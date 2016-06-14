<%@ page language="java" contentType="text/html; charset=utf-8"
import="com.yryj.pub.*"
	import="com.yryj.model.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>一人一句</title>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="css/bootstrap.css" />
		<link rel="stylesheet" href="css/style.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/bootstrapValidator.min.css" />


		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/bootstrap.js"></script>
		<script src="js/bootstrapValidator.min.js"></script>
		<script src="js/bootstrapValidator_zh_CN.js"></script>
		<script src="js/bootstrap-treeview.js"></script>
		<script src="js/bootstrap-treeview.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('.dropdown-toggle').dropdown();
			});
		</script>
		<script type="text/javascript">
			// 返回顶部的代码
			function goTopEx() {
				var obj = document.getElementById("goTopBtn");
				function getScrollTop() {
					return document.documentElement.scrollTop
							+ document.body.scrollTop;
				}
				function setScrollTop(value) {
					if (document.documentElement.scrollTop) {
						document.documentElement.scrollTop = value;
					} else {
						document.body.scrollTop = value;
					}
				}
				window.onscroll = function() {
					getScrollTop() > 0 ? obj.style.display = ""
							: obj.style.display = "none";
				}
				obj.onclick = function() {
					var goTop = setInterval(scrollMove, 10);
					function scrollMove() {
						setScrollTop(getScrollTop() / 1.1);
						if (getScrollTop() < 1)
							clearInterval(goTop);
					}
				}
			}
		</script>
		<style>
a:link {
	text-decoration: none;
	color: #666666;
}

a:visited {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

a:active {
	text-decoration: none;
}
</style>
</head>
<%
	User user=(User)session.getAttribute("user"); 
	List<Chapter> storys=(List<Chapter>)session.getAttribute("storys");
	if(storys==null)
		storys=new ArrayList<Chapter>();
	ArrayList<ArrayList<Type>> types=(ArrayList<ArrayList<Type>>)session.getAttribute("types");
	if(types==null){
		types=new ArrayList<ArrayList<Type>>();
	}
%>
<body>

<script type="text/javascript">
	window.onload =function onload(){
		var a=<%=types.size() %>;
		if(a==0){
			window.location.href='startTree.action';
		}
	}
</script>
	<!--onLoad="scrollTo(0,500)-->
	<!--导航栏-->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
		style="background-color:#ededed; margin:0px 0px 0px 0px;">
	<div class="navbar-header">
		<a class="navbar-brand" href="readStart.action"
			style="font-family: SimHei;">一人一句</a>
	</div>
	<div>
		<ul class="nav navbar-nav navbar-right" style="margin-right: 20px;">
			<li class="dropdown"
				style="margin: 0px 0px 0px 0px; font-family: SimHei;">
				<%
					if(user!=null){
				%> <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <%=user.getName()%><b
					class="caret"></b>
			</a>
				<ul class="dropdown-menu">
					<li><a href="getInfo.action">个人主页</a></li>
					<%if(user.getName().equals(Format.managerName)){ %>
						<li><a href="manage.action">管理</a></li>
					<%} %>
					<li><a href="logout.action">注销</a></li>
				</ul> <%
 	}else{
 %> <a href="beforelogin.action"> 登录 </a> <%
 	}
 %>
			</li>
		</ul>
		<p class="navbar-text navbar-right" style="font-family: SimHei;">
			<a href="creat_story.jsp"><span class="glyphicon glyphicon-plus" />添加故事</a>
		</p>
	</div>
	</nav>
	<div class="container" style="margin-top: 50px;">
		<div class="row">

			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" >
				<div class="sidebar-menu">
				<a href="startTree.action"  ><div class="menu-first" style="background:#EEE685"><b>热门</b></div></a>
				<a href="startTree.action?mood=0"><div class="menu-first" style="background:#EEE685"><b>短篇</b></div></a>
				<a href="startTree.action?mood=1" ><div class="menu-first" style="background:#EEE685"><b>中篇</b></div></a>
				<a href="startTree.action?mood=2"><div class="menu-first" style="background:#EEE685"><b>长篇</b></div></a>
				<%
				if(types.size()>0){
				for(int i=0;i<types.get(0).size();i++){ 
					Type t1=types.get(0).get(i);
				%>
						<a href=<%="#"+t1.getId() %> id="xiaoshuo" class="nav-header collapsed"  data-toggle="collapse"><div class="menu-first"><b><%=t1.getContent() %></b></div></a>
						<ul id=<%=t1.getId() %> class="nav nav-list collapse menu-second">
						<%for(int j=0;j<types.get(1).size();j++){ 
							Type t2=types.get(1).get(j);
						%>
							<li><a href="#" id="getStart.action?formatId=<%=i %>&styleId=<%=j %>"><%=t2.getContent() %></a></li>
							<%} %>							
						</ul>
				<%}} %>
				</div>
			</div>
			<script type=text/javascript>
							$(".sidebar-menu ul li a").click(function(){
								//alert();
								var h = $(this).attr("id");
								$("#maincontent").load(h);
							});
						</script>
			
			<!--右侧故事开头-->
			<div class="col-lg-9 col-md-9 col-xs-9" id="maincontent">


				<%for(int i=0;i<storys.size();i++ ){%>
				<%
					Chapter ch=storys.get(i);
					String length="短篇"; 
					switch((int)ch.getLength()){
					case 1:
						length="中篇";
						break;
					case 2:
						length="长篇";
						break;
					};
		
				%>
				<div class="row storyofmain" style="padding-left: 10px;">

					<%if((i%4)==0){ %>
					<div class="col-lg-4 col-md-4 col-xs-4 storyclass storycenter"
						style="background-color: #191970">
					<%} 
					if((i%4)==1){
					%>
					<div class="col-lg-4 col-md-4 col-xs-4 storyclass storycenter"
						style="background-color: #DC143C">
					<%} 
					if((i%4)==2){
					%>
					<div class="col-lg-4 col-md-4 col-xs-4 storyclass storycenter"
						style="background-color: #EEC900">
					<%} 
					if((i%4)==3){
					%>
					<div class="col-lg-4 col-md-4 col-xs-4 storyclass storycenter"
						style="background-color: #458B74">
					<%} %>
						<h3>
							<a href="#" style="color:#ffffff"><%=ch.getFormat() %></a>
						</h3>
						<h4>
							<a href="#" style="color:#ffffff"><%=ch.getStyle() %></a>
						</h4>
						<h5>
							<a href="#" style="color:#ffffff"><%=length %></a>
						</h5>
					</div></div></div></div>
					<div class="col-lg-8 col-md-8 col-xs-8 storybegin">
						<p class="storycenter">
							<a href="readStory.action?index=<%=ch.getId() %>" style="color:#000000" ><%=ch.getContent() %></a>
						</p>
					</div>
				</div>
				<%} %>
			</div>
		</div>
	</div>

	<!--返回顶部的图片-->
	<div
		style="display: none; POSITION: fixed; LINE-HEIGHT: 30px; BOTTOM: 35px; CURSOR: pointer; RIGHT: 10px; _position: absolute; _right: auto"
		id="goTopBtn">
		<img src="pics\top.gif" />
	</div>
	<script type=text/javascript>
		goTopEx();
	</script>

</body>
</html>