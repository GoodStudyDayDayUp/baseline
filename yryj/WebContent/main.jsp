<%@ page language="java" contentType="text/html; charset=utf-8"
	import="java.io.File"
	import="com.yryj.model.*" import="java.util.*" import="com.yryj.pub.*"%>
	<c:set var="ctx" value="${pageContext.request.contextPath}"/>
	
	<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
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
		<script type="text/javascript">
        $(document).ready(function () {
            $('.dropdown-toggle').dropdown();
        });
   </script>
		<script>
   $(function(){
      // 初始化轮播
	  $('.carousel').carousel({
			interval: 5000
		});
	});
	</script>
		<script type="text/javascript">// 返回顶部的代码
function goTopEx() {
    var obj = document.getElementById("goTopBtn");
    function getScrollTop() {
        return document.documentElement.scrollTop + document.body.scrollTop;
    }
    function setScrollTop(value) {
        if (document.documentElement.scrollTop) {
            document.documentElement.scrollTop = value;
        } else {
            document.body.scrollTop = value;
        }
    }
    window.onscroll = function() {
        getScrollTop() > 0 ? obj.style.display = "": obj.style.display = "none";
    }
    obj.onclick = function() {
        var goTop = setInterval(scrollMove, 10);
        function scrollMove() {
            setScrollTop(getScrollTop() / 1.1);
            if (getScrollTop() < 1) clearInterval(goTop);
        }
    }
}
</script>
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
	
	List<Activity> acts=(List<Activity>)session.getAttribute("acts");
	if(acts==null)
		acts=new ArrayList<Activity>();
	%>
<body>
	<!--onLoad="scrollTo(0,500)-->
	<script type="text/javascript">
	window.onload =function onload(){
		var a=<%=types.size() %>;
		if(a==0){
			window.location.href='readStart.action';
		}
	}
	</script>


	<!--导航栏-->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
		style="background-color:#ededed; margin:0px 0px 0px 0px;">
	<div class="navbar-header">
		<a class="navbar-brand" href="readStart.action" style="font-family: SimHei;">一人一句</a>
	</div>
	<div>
		<ul class="nav navbar-nav navbar-right" style="margin-right: 20px;">
			<li class="dropdown"
				style="margin: 0px 0px 0px 0px; font-family: SimHei;">
				<%if(user!=null){ %> <a href="#" class="dropdown-toggle"
				data-toggle="dropdown"> <%=user.getName() %><b class="caret"></b>
			</a>
				<ul class="dropdown-menu">
					<li><a href="getInfo.action">个人主页</a></li>
					<%if(user.getName().equals(Format.managerName)){ %>
					<li><a href="manage.action">管理</a></li>
					<%} %>
					<li><a href="logout.action">注销</a></li>
				</ul> <%}else{ %> <a href="beforelogin.action"> 登录 </a> <%} %>
			</li>
		</ul>
		<p class="navbar-text navbar-right" style="font-family: SimHei;">
			<a href="createStory.action"><span class="glyphicon glyphicon-plus" />添加故事</a>
		</p>
	</div>
	</nav>

	<div id="myCarousel" class="carousel slide"
		style="margin-top: 0px; padding-top: 50px; height: 100%; background-color: #ededed">
		<ol class="carousel-indicators">
		<%if(acts.size()==0){ %>
		<!-- 轮播（Carousel）指标 -->
		
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
		<%}else{
			int j=0;
			for(;j<acts.size();j++){
				if(j==0){
			%>
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<%}else{ %>
			<li data-target="#myCarousel" data-slide-to="<%=j%>"></li>
		<%}} }%>
		</ol>
		<!-- 轮播（Carousel）项目 -->
		<div class="carousel-inner">
			<%if(acts.size()==0){ %>
			<div class="item active">
				<p style="text-align: center; margin: auto">
					<img src="pics\logopic.png" height="100%" alt="First slide">
				</p>
			</div>
			<div class="item">
				<p style="text-align: center; margin: auto">
					<img src="pics\main_pic2.jpeg" height="100%" alt="Second slide">
				</p>
			</div>
			<%}else{ %>
			
			<%for(int i=0;i<acts.size();i++){
					Activity oneA=acts.get(i);
					if(i==0){
			%>
			<div class="item active">
				<p style="text-align: center; margin: auto">
				<a href="//<%=oneA.getUrl() %>" title=<%=oneA.getString() %>><img src="getPic.action?path=<%=oneA.getPic()%>" height="100%" alt="Second slide"  /></a>
				</p>
			</div>
			<%}else{ %>
			<div class="item">
				<p style="text-align: center; margin: auto">
				<a href="//<%=oneA.getUrl() %>" title=<%=oneA.getString() %>><img src="getPic.action?path=<%=oneA.getPic()%>" height="100%" alt="Second slide"/></a>
				</p>
			</div>
			<%}} %>
			
			<%}%>
		</div>
	</div>


	<!------------------------------ 最大一层的分类 ------------------------------>
	<center>
		<table class="category">
			<tr>
			<%
			if(types.size()>0)
			for(int i=0;i<types.get(0).size();i++){ 
			%>
				<td><div class="category-boxes">
						<a href="main-tree.jsp"> <%if(i==0){%> <img
							src="pics\xiaoshuo.jpg" class="blur" /> <%}if(i==1){ %> <img
							src="pics\shige.jpg" class="blur" /> <%}if(i==2){%> <img
							src="pics\sanwen.jpg" class="blur" /> <%}if(i==3){%> <img
							src="pics\xiju.jpg" class="blur" /> <% } if(i<4){%> <span
							class="title"><%=types.get(0).get(i).getContent() %></span> <%} %>
						</a>
					</div></td>
				<%} %>
			</tr>
		</table>
	</center>

	<p style="text-align: center; margin: 40px 0px 10px 0px">
		<img src="pics\fengexian.png" />
	</p>

	<div class="container">
		<div class="row">
			<%for(int i=0;i<storys.size();i++ ){ %>
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
		
		if(i%2==0){
		
		%>
			<div class="col-lg-8 col-lg-offset-2 col-md-12 col-sm-12 storyofmain" >
				<div class="col-lg-4 col-md-4 col-sm-4 storyclass storycenter" style="background-color:#191970" >
					<h3 ><a href="main-tree.jsp" style="color:#ffffff"><%=ch.getFormat() %></a></h3>
					<h4 ><a href="main-tree.jsp" style="color:#ffffff"><%=ch.getStyle() %></a></h4>
					<h5 ><a href="main-tree.jsp" style="color:#ffffff"><%=length %></a></h5>
				</div>
				<div class="col-lg-8  col-md-8 col-sm-8 storybegin"><p class="storycenter">
					<a href="readStory.action?index=<%=ch.getId() %>"><%=ch.getContent() %></a>
				</p></div>
			</div>
	<%}else{ %>		
			<div class="col-lg-8 col-lg-offset-2 col-md-12 col-sm-12  storyofmain" >
				<div class="col-lg-8  col-md-8 col-sm-8 storybegin"><p class="storycenter">
					<a href="readStory.action?index=<%=ch.getId() %>" style="color:#000000"><%=ch.getContent() %></a>
				</p></div>
				<div class="col-lg-4  col-md-4 col-sm-4  storyclass storycenter"style="background-color:#DC143C" >
					<h3 ><a href="main-tree.jsp" style="color:#ffffff"><%=ch.getFormat() %></a></h3>
					<h4 ><a href="main-tree.jsp" style="color:#ffffff"><%=ch.getStyle() %></a></h4>
					<h5 ><a href="main-tree.jsp" style="color:#ffffff"><%=length %></a></h5>
				</div>
			</div>
			<%} }%>
		</div>
	</div>

	<!--返回顶部的图片-->
	<div
		style="display: none; POSITION: fixed; LINE-HEIGHT: 30px; BOTTOM: 35px; CURSOR: pointer; RIGHT: 10px; _position: absolute; _right: auto"
		id="goTopBtn">
		<img src="pics\top.gif" />
	</div>
	<script type=text/javascript>goTopEx();</script>
	<!-- 分割线-->
	<hr width="100%" />
</body>
</html>