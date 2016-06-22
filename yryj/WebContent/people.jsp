<%@ page language="java" contentType="text/html; charset=utf-8"
import="com.yryj.model.*"
import="java.util.*"
import="com.yryj.pub.*"
import="java.util.Date"
import="com.yryj.serviceImpl.*"
%>
<html>
<head>
		<title>个人中心</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" href="css/style.css"/>
		<link rel="stylesheet" href="css/bootstrap.min.css"/>
		<link rel="stylesheet" href="css/bootstrapValidator.min.css"/>
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
	User person=(User)session.getAttribute("person");
	String index=(String)session.getAttribute("index");
	List<Chapter> chs=(List<Chapter>)session.getAttribute("chapters");
	List<Chapter>  store=(List<Chapter>)session.getAttribute("store");
	String[][] i2uDArray=(String[][])session.getAttribute("i2uDArray");       //我关注的用户列表，id字符串
	String[][] u2iDArray=(String[][])session.getAttribute("u2iDArray");		//关注我的用户列表，id字符串
	if(chs==null)
		chs=new ArrayList<Chapter>();
	
	Relations relation=null;
	if(person!=null){
		//获得所有的关系
		relation=new RelationsML().findByUserId(person.getId());
		session.setAttribute("relation", relation);
	}
	
		if(i2uDArray==null){
		i2uDArray=new String[0][0];
	}
	if(u2iDArray==null){
		u2iDArray=new String[0][0];
	}
%>
<body >
<script type="text/javascript">
	window.onload =function onload(){
		var a=<%=person %>;
		if(a==null){
			window.location.href='404error.jsp';
		}
	}
	</script>
	<nav class="navbar navbar-default" role="navigation" style=" margin:0px 0px 0px 0px;">
	<div class="navbar-header">
      <a class="navbar-brand" href="readStart.action" style="font-family:SimHei;">一人一句</a>
   </div>
		<div>
			<ul class="nav navbar-nav navbar-right" style="margin-right: 20px;">
				<li class="dropdown" style="margin:0px 0px 0px 0px;font-family: SimHei  ;">
				<%if(user!=null){ %>
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" >
					<%=user.getName() %><b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
						<li><a href="getInfo.action">个人主页</a></li>
						<%if(user.getName().equals(Format.managerName)){ %>
						<li><a href="manage.action">管理</a></li>
						<%} %>
						<li><a href="logout.action">注销</a></li>
					</ul>
					<%}else{ %>
					<a href="beforelogin.action"  >
					登录
					</a>
					<%} %>
				</li>
			</ul>
			<p class="navbar-text navbar-right" style="font-family: SimHei  ;"><a href="createStory.action"><span class="glyphicon glyphicon-plus" />添加故事</a></p>
		</div>
	</nav>
	
	<div class="container">
		<div class="col-lg-2 col-md-2 col-sm-3 col-xs-2" style="margin-top:20px;">
		<ul class="nav nav-pills nav-stacked">
			<li class="active na"><a href="#" id="info"><%=person.getName() %></a></li>
			<li class="na" ><a href="#" id="mychpts">作品&nbsp;&nbsp;&nbsp;<span class="label label-default"><%=chs.size() %></span></a></li>
			<li class="na"><a href="#" id="mycol">收藏&nbsp;&nbsp;&nbsp;<span class="label label-default"><%=store.size() %></span></a></li>
			<li class="na"><a href="#" id="myfol">关注&nbsp;&nbsp;&nbsp;<span class="label label-default"><%if(i2uDArray[0][0].equals("无"))%>0<%else %><%=i2uDArray.length %></span></a></li>
			<li class="na"><a href="#" id="myfans">粉丝&nbsp;&nbsp;&nbsp;<span class="label label-default"><%if(u2iDArray[0][0].equals("无"))%>0<%else %><%=u2iDArray.length %></span></a></li>
		</ul>
		<br/>
		<%if(index.equals("2")){ %>
			<button onclick="location='setAttention.action?id=<%=person.getId()%>&mood=1' " class="btn btn-info" > 关注TA </button>
	    <%}if(index.equals("1")){ %>
			<button onclick="location='setAttention.action?id=<%=person.getId()%>&mood=1' " class="btn btn-info" > 取消关注 </button>
		<%} %>
		</div>
		<div class="col-lg-10 col-md-10 col-sm-9 col-xs-10" style="margin-top:20px;">
		<div id="basicInfo"> <!--   个人主页放置个人积分、点赞数多的chpts、点赞数多的收藏的作品   -->
			<div class="panel panel-default">
				<div class="panel-heading">
					积分：<span class="label label-default"><%=person.getPoint() %></span>
				</div>
				
			</div>
			<div class="panel panel-default" >
				<div class="panel-heading" >
					<h3 class="panel-title">精选作品</h3>
				</div>
			</div>
			<% for(int i=0;i<chs.size();i++){ 
				if(i==2) break;
					String a[]=chs.get(i).getKey().split("#"); %>
					<div class="panel panel-default" style="margin-top:-25px;">
								<div class="panel-body">
								<div style="display:inline;">
								<%for(String s:a){ %>
									<span class="label label-primary chptlabel" ><%=s%></span>
									<%} %>
								</div>
								<p class="everychpt"><%=chs.get(i).getContent() %></p>
								<div class="row" >
									<div class="user" >
										<span><%=Format.sdf.format(new Date(chs.get(i).getDate())) %></span>
										<span>浏览数：<%=chs.get(i).getViewNum() %></span>
									</div>
									<div class="functs check">
										<a href="readStory.action?index=<%=chs.get(i).getId()%>">查看前后文</a>
									</div>
								</div>
								</div>
							</div>
							<%} %>
			
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">精选收藏</h3>
				</div>
			</div>
					<% for(int i=0;i<store.size();i++){ 
				if(i==2) break;
					String a[]=store.get(i).getKey().split("#"); %>
					<div class="panel panel-default" style="margin-top:-25px;">
								<div class="panel-body">
								<div style="display:inline;">
								<%for(String s:a){ %>
									<span class="label label-primary chptlabel" ><%=s%></span>
									<%} %>
								</div>
								<p class="everychpt"><%=store.get(i).getContent() %></p>
								<div class="row" >
									<div class="user" >
										<span><%=Format.sdf.format(new Date(store.get(i).getDate())) %></span>
										<span>浏览数：<%=store.get(i).getViewNum() %></span>
									</div>
									<div class="functs check">
										<a href="readStory.action?index=<%=store.get(i).getId()%>">查看前后文</a>
									</div>
								</div>
								</div>
							</div>
							<%} %>
		</div>
		<div id="chpts" style="display:none;"><!--作品-->
			<div class="panel panel-default">
				<div class="panel-heading">
					排序方式：&nbsp;&nbsp;<a href="#" id="test.html">赞同数</a>&nbsp;&nbsp;<span style="width:1px; height:30px; ">|</span>&nbsp;&nbsp;<a href="#">发布时间</a>
				</div>
				<script type=text/javascript>
							$(".panel-heading a").click(function(){
								$("#maincontent").load($(this).attr("id"));
							});
				</script>
			</div>
			
			<div id="maincontent">
			<% for(int i=0;i<chs.size();i++){ %>	
						<%String a[]=chs.get(i).getKey().split("#"); %>
					<div class="panel panel-default">
								<div class="panel-body">
								<div style="display:inline;">
								<%for(String s:a){ %>
									<span class="label label-primary chptlabel" ><%=s%></span>
									<%} %>
								</div>
								<p class="everychpt"><%=chs.get(i).getContent() %></p>
								<div class="row" >
									<div class="user" >
										<span><%=Format.sdf.format(new Date(chs.get(i).getDate())) %></span>
										<span>浏览数：<%=chs.get(i).getViewNum() %></span>
									</div>
									<div class="functs check">
										<a href="readStory.action?index=<%=chs.get(i).getId()%>">查看前后文</a>
									</div>
								</div>
								</div>
							</div>
							<%} %>
			</div>
							
		</div>
		
		
		<div id="collects" style="display:none;">   <!--收藏-->
			<div class="panel panel-default">
				<div class="panel-heading">
					排序方式：&nbsp;&nbsp;<a href="#">赞同数</a>&nbsp;&nbsp;<span style="width:1px; height:30px; ">|</span>&nbsp;&nbsp;<a href="#">发布时间</a>
				</div>
			</div>
			<% for(int i=0;i<store.size();i++){ %>	
		<%String a[]=store.get(i).getKey().split("#"); %>
			<div class="panel panel-default">
								<div class="panel-body">
								<div style="display:inline;">
								<%for(String s:a){ %>
									<span class="label label-primary chptlabel" ><%=s%></span>
									<%} %>
								</div>
								<p class="everychpt"><%=store.get(i).getContent() %></p>
								<div class="row" >
									<div class="user" >
										<a href="viewPerson.action?name=<%=store.get(i).getUserName() %>"><%=store.get(i).getUserName() %></a>
										<span><%=Format.sdf.format(new Date(store.get(i).getDate())) %></span>
										<span>点赞数：<%=store.get(i).getZan() %></span>
									</div>
									<div class="functs check">
										<%
					boolean isFind=false;
					if(relation!=null){
						String love=relation.getU2cZan();
						isFind=Format.findInArray(love.split("#"), String.valueOf(store.get(i).getId()));
					}
					if(isFind){
					%>
						<button id=<%="zan"+store.get(i).getId()%> type="button" class="btn btn-default chptbtn glyphicon glyphicon-heart" style="border:none;padding:3px 7px 2px 7px;color:red"  value="1" onclick="LoveShow(this)"></button>
					<%} else{%>
						<button id=<%="zan"+store.get(i).getId()%> type="button" class="btn btn-default chptbtn glyphicon glyphicon-heart" style="border:none;padding:3px 7px 2px 7px;"  value="0" onclick="LoveShow(this)"></button>
					<%}%>
										<a href="readStory.action?index=<%=store.get(i).getId()%>">查看前后文</a>
									</div>
								</div>
								</div>
							</div>
		<%} %>
		</div>
		<div id="follow" style="display:none">
			<div class="panel panel-default">
				<div class="panel-heading">我关注的人</div>
					<ul class="list-group">
						
							<%if(i2uDArray[0][0].equals("无")) {%>
							<li class="list-group-item" ">
							<table>
							<tr>
							<td style="width:100px;"><b>无</b></td>
							</tr>
							</table>
							</li>
							<%}else{ %>
							<%for(int i=0;i<i2uDArray.length;i++){ %>
							<li class="list-group-item" ">
							<table>
							<tr>
							<td style="width:100px;"><a href="viewPerson.action?name=<%=i2uDArray[i][1]%>"><b><%=i2uDArray[i][1] %></b></a></td>
							<td><p style="font-size:12px;padding-bottom:-10px;margin-bottom:-10px;">粉丝数：<span><%=i2uDArray[i][2] %></span>&nbsp;&nbsp;&nbsp;&nbsp;章节数：<span><%=i2uDArray[i][3] %></span></p></td>
							</tr>
							</table>
							<%if(i2uDArray[i][4].equals("1")){ %>
							<a href="setAttention.action?id=<%=i2uDArray[i][0] %>&mood=1"><button class="btn btn-info" style="float:right;margin-top:-25px;"> 取消关注 </button></a><%} %>
							<%if(i2uDArray[i][4].equals("2")){ %>
							<a href="setAttention.action?id=<%=i2uDArray[i][0] %>&mood=1"><button class="btn btn-info" style="float:right;margin-top:-25px;"> 关注TA </button></a><%} %>
							<%}%>
							</li>
							<%}%>
						
					</ul>
				</div>
		</div>
		<div id="fans" style="display:none">
			<div class="panel panel-default">
				<div class="panel-heading">关注我的人</div>
					<ul class="list-group">
						
							<%if(u2iDArray[0][0].equals("无")) {%>
							<li class="list-group-item" ">
							<table>
							<tr>
							<td style="width:100px;"><b>无</b></td>
							</tr>
							</table>
							</li>
							<%}else{ %>
							<%for(int i=0;i<u2iDArray.length;i++){ %>
							<li class="list-group-item" ">
							<table>
							<tr>
							<td style="width:100px;"><a href="viewPerson.action?name=<%=u2iDArray[i][1]%>"><b><%=u2iDArray[i][1] %></b></a></td>
							<td><p style="font-size:12px;padding-bottom:-10px;margin-bottom:-10px;">粉丝数：<span><%=u2iDArray[i][2] %></span>&nbsp;&nbsp;&nbsp;&nbsp;章节数：<span><%=u2iDArray[i][3] %></span></p></td>
							</tr>
							</table>
							<%if(u2iDArray[i][4].equals("1")){ %>
							<a href="setAttention.action?id=<%=u2iDArray[i][0] %>&mood=1"><button class="btn btn-info" style="float:right;margin-top:-25px;"> 取消关注 </button></a><%} %>
							<%if(u2iDArray[i][4].equals("2")){ %>
							<a href="setAttention.action?id=<%=u2iDArray[i][0] %>&mood=1"><button class="btn btn-info" style="float:right;margin-top:-25px;"> 关注 TA</button></a><%} %>
							<%}%>
							</li>
							<%}%>
						
					</ul>
				</div>
		</div>
	</div>
	</div>
	
</body>
<script type="text/javascript">
	$(function(){
		$(".na").click(function(){
			$(this).addClass("active");
			$(this).siblings().removeClass("active");
		});
	});
</script>

<script language="JavaScript">
<%for(int i=0;i<store.size();i++){%>
$("<%="#zan"+store.get(i).getId()%>").click(function(){
	$.ajax({
			url:"setLove.action?id=<%=store.get(i).getId() %>",
			type:"POST",
			data:{},
			dataType:"json",
			success:function(data){
				
			},
			error:function(){
			}
 });
 }); 
<%}%>
</script>
<script language="JavaScript">
	
	function LoveShow(obj){
		var love = document.getElementById(obj.id);
		
		if(obj.value=="0"){
			obj.value="1";
			love.style.color = "#ff0033";
			}
		else if(obj.value=="1"){
			obj.value="0";
			love.style.color = "#000000";
		}
	}
	function CollectShow(obj){
		var collect = document.getElementById(obj.id);
		
		if(obj.value=="0"){
			obj.value="1";
			collect.style.color = "#f1c232";
			}
		else if(obj.value=="1"){
			obj.value="0";
			collect.style.color = "#000000";
		}
	}
</script>

<script type="text/javascript">
$("#info").on("click",function(){
$("#basicInfo").show();//显示
$("#chpts").hide();
$("#collects").hide();
$("#follow").hide();
$("#fans").hide();
});
$("#mychpts").on("click",function(){
$("#chpts").show();
$("#basicInfo").hide();
$("#collects").hide();
$("#follow").hide();
$("#fans").hide();
});
$("#mycol").on("click",function(){
$("#collects").show();
$("#basicInfo").hide();
$("#chpts").hide();
$("#follow").hide();
$("#fans").hide();
});
$("#myfol").on("click",function(){
$("#follow").show();
$("#basicInfo").hide();
$("#chpts").hide();
$("#collects").hide();
$("#fans").hide();
});
$("#myfans").on("click",function(){
$("#fans").show();
$("#basicInfo").hide();
$("#chpts").hide();
$("#collects").hide();
$("#follow").hide();
});
</script>
</html>