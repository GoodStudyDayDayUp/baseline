<%@ page language="java" contentType="text/html; charset=utf-8" import="com.yryj.model.*"
import="java.util.*"
import="com.yryj.pub.*"
import="com.yryj.sercvice.*"
import="com.yryj.serviceImpl.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
		<title>阅读界面</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" href="css/style.css"/>
		<link rel="stylesheet" href="css/bootstrap.min.css"/>
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.js"></script>
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

$(function(){
	$(document).tooltip();
});
</script>

</head>
<%
	User user=(User)session.getAttribute("user"); 
	List<Chapter> story=(List<Chapter>) session.getAttribute("story");
	Relations relation=null;
	if(user!=null){
		//获得所有的关系
		relation=new RelationsML().findByUserId(user.getId());
		session.setAttribute("relation", relation);
	}
	ChapterManager cm=new ChapterML();
	%>
<body >
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="background-color:#ededed; margin:0px 0px 0px 0px;">
		<div class="navbar-header">
			<a class="navbar-brand" href="readStart.action">首页 /</a>
			<a class="navbar-brand" style="padding-left:0px;" href="#"><%=story.get(0).getFormat()%> /</a>
			<a class="navbar-brand" style="padding-left:0px;" href="#"><%=story.get(0).getStyle()%> /</a>
			<%String length="短篇";
			  if(story.get(0).getLength()==1)
				  length="中篇";
			  if(story.get(0).getLength()==2)
				  length="长篇";
			%>
			<a class="navbar-brand" style="padding-left:0px;" href="#"><%=length %></a>
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
						<li><a href="manage.jsp">管理</a></li>
						<%} %>
						<li><a href="logout.action">注销</a></li>
					</ul>
					<%}else{ %>
					<a href="beforelogin.action">
					登录
					</a>
					<%} %>
				</li>
			</ul>
			
			<%if(user!=null){ %>
			<p class="navbar-text navbar-right" style="font-family: SimHei  ;"><a href="creat_story.jsp"><span class="glyphicon glyphicon-plus" />添加故事</a></p>
			<%} %>
		</div>
	</nav>
	
	
	<!--<div style="position:fixed; left:0px; top:50px; width:100%; height:100%">
		<img src="pics\back.jpg" width=100% height="100%"/>
	</div> -->


	
	<div class="container" style=" margin-top:50px;">
		
		<div class="row " > <!--onmouseover="DivShow()" onmouseout="DivHide()" -->

			<!-- 根章节 -->
			<div class="col-lg-8 col-lg-offset-2  col-sm-8 col-sm-offset-2  col-md-8 col-md-offset-2 chptbox" >
				<div style="display:inline;">
				<%String a=story.get(0).getKey();
				  String keys[];					  
				  if(a.indexOf("#")!=-1){
					  keys=a.split("#");
					  for(int i=0;i<keys.length;i++){
				%>
					<span class="label label-primary chptlabel" ><%=keys[i] %></span>
				<%} }else
					  if(a!=""&&a!=null){
				  %>
				  <span class="label label-danger chptlabel" ><%=a %></span>
				  <%} %>
				</div>
				<div class="everychpt">
				<p class="everychpt"><%=story.get(0).getContent() %></p></div>
				<div class="row" >
					<div class="user" id="chptuser">
						<a href="viewPerson.action?name=<%=story.get(0).getUserName() %>"><%=story.get(0).getUserName() %></a>&nbsp;&nbsp;
						<span><%=Format.sdf.format(new Date(story.get(0).getDate())) %></span>&nbsp;&nbsp;
						
						<span>点赞数：<span id=<%="zanNum"+story.get(0).getId()%>><%=story.get(0).getZan() %></span></span>
					</div>
					<div class="functs" id="funct">
						<%
					if(user!=null){
					boolean isFind=false;
					if(relation!=null){
						String love=relation.getU2cZan();
						isFind=Format.findInArray(love.split("#"), String.valueOf(story.get(0).getId()));
					}
					if(isFind){
					%>
						<button id=<%="zan"+story.get(0).getId()%> type="button" class="btn btn-default chptbtn glyphicon glyphicon-heart" style="border:none;padding:3px 7px 2px 7px;color:red"  value="1" onclick="LoveShow(this)"></button>
					<%} else{%>
						<button id=<%="zan"+story.get(0).getId()%> type="button" class="btn btn-default chptbtn glyphicon glyphicon-heart" style="border:none;padding:3px 7px 2px 7px;"  value="0" onclick="LoveShow(this)"></button>
					<%}
					}else{%>
						<a href="setLove.action"><button  type="button" class="btn btn-default chptbtn glyphicon glyphicon-heart" style="border:none;padding:3px 7px 2px 7px;"  value="0" onclick="LoveShow(this)"></button></a>
					<%} %>
					
					<%
					if(user!=null){
					boolean isFind=false;
					if(relation!=null){
						String love=relation.getU2cStore();
						isFind=Format.findInArray(love.split("#"), String.valueOf(story.get(0).getId()));
					}
					if(isFind){
					%>
						<button id=<%="store"+story.get(0).getId()%> type="button" class="btn btn-default glyphicon glyphicon-star"  style="border:none;padding:3px 7px 2px 7px;color:#f1c232"  value="1" onclick="CollectShow(this)"></button>
					<%} else{%>
						<button id=<%="store"+story.get(0).getId()%> type="button" class="btn btn-default glyphicon glyphicon-star" style="border:none;padding:3px 7px 2px 7px;"  value="0" onclick="CollectShow(this)"></button>
					<%}
					}else{%>
						<a href="setStore.action"><button type="button" class="btn btn-default glyphicon glyphicon-star" style="border:none;padding:3px 7px 2px 7px;" id="b" value="0" onclick="CollectShow(this)"></button></a>
						<%} %>
						<a href="prepareWrite.action?parentId=<%=story.get(0).getId() %>"><button type="button" class="btn btn-default glyphicon glyphicon-plus" style="border:none;padding:3px 7px 2px 7px;" id="c" ></button></a>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- 正文 -->
		<%for(int i=1;i<story.size();i++){ 
			long left=story.get(i).getLeftStory();
		%>
		<div class="row " id="contents" > <!--onmouseover="DivShow()" onmouseout="DivHide()" -->
			<div class="col-lg-1 col-lg-offset-1 col-md-1 col-md-offset-1 col-sm-1 col-sm-offset-1" style="display:table;position:relative;">
				<div style="margin-top:50px;display:table-cell;vertical-align:middle; position:absolute;height:100%; top:0px;bottom:0px;right:10px;">
					<a href="turnStory.action?mood=0&index=<%=i %>" id=<%="ToLeft"+story.get(i).getId()%> onclick="LeftChpt();" title="可以查看<%=left %> 条内容"> <span class="glyphicon glyphicon-chevron-left"/></a>
				</div>
			</div>
			<div class="col-lg-8 col-md-8  col-sm-8 chptbox" >
			<div style="display:inline;">
				<%a=story.get(i).getKey();
				String ks[];
				  if(a.indexOf("#")!=-1){
					  ks=a.split("#");
					  for(int j=0;j<ks.length;j++){
				%>
					<span class="label label-danger chptlabel" ><%=ks[j] %></span>
				<%}}
				  else
					  if(a!=""&&a!=null){
				  %>
				  <span class="label label-danger chptlabel" ><%=a %></span>
				  <%} %>
				</div>
				<div>
				<p class="everychpt" id=<%="content"+story.get(i).getId() %>><%=story.get(i).getContent() %></p></div>
				<div class="row" >
					<div class="user" id="chptuser">
						<a href="viewPerson.action?name=<%=story.get(i).getUserName() %>"><%=story.get(i).getUserName() %></a>&nbsp;&nbsp;
						<span><%=Format.sdf.format(new Date(story.get(i).getDate())) %></span>&nbsp;&nbsp;
						
						<span>点赞数：</span><span id=<%="zanNum"+story.get(i).getId()%>><%=story.get(i).getZan() %></span>
					</div>
					<div class="functs" id="funct">
					<%
					if(user!=null){
					boolean isFind=false;
					if(relation!=null){
						String love=relation.getU2cZan();
						isFind=Format.findInArray(love.split("#"), String.valueOf(story.get(i).getId()));
					}
					if(isFind){
					%>
						<button id=<%="zan"+story.get(i).getId()%> type="button" class="btn btn-default chptbtn glyphicon glyphicon-heart" style="border:none;padding:3px 7px 2px 7px;color:red"  value="1" onclick="LoveShow(this)"></button>
					<%} else{%>
						<button id=<%="zan"+story.get(i).getId()%> type="button" class="btn btn-default chptbtn glyphicon glyphicon-heart" style="border:none;padding:3px 7px 2px 7px;"  value="0" onclick="LoveShow(this)"></button>
					<%}
					}else{%>
						<a href="setLove.action"><button  type="button" class="btn btn-default chptbtn glyphicon glyphicon-heart" style="border:none;padding:3px 7px 2px 7px;"  value="0" onclick="LoveShow(this)"></button></a>
					<%} %>
					
					<%
					if(user!=null){
					boolean isFind=false;
					if(relation!=null){
						String love=relation.getU2cStore();
						isFind=Format.findInArray(love.split("#"), String.valueOf(story.get(i).getId()));
					}
					if(isFind){
					%>
						<button id=<%="store"+story.get(i).getId()%> type="button" class="btn btn-default glyphicon glyphicon-star"  style="border:none;padding:3px 7px 2px 7px;color:#f1c232"  value="1" onclick="CollectShow(this)"></button>
					<%} else{%>
						<button id=<%="store"+story.get(i).getId()%> type="button" class="btn btn-default glyphicon glyphicon-star"  style="border:none;padding:3px 7px 2px 7px;"  value="0" onclick="CollectShow(this)"></button>
					<%}
					}else{%>
						<a href="setStore.action"><button type="button" class="btn btn-default glyphicon glyphicon-star" style="border:none;padding:3px 7px 2px 7px;" id="e" value="0" onclick="CollectShow(this)"></button></a>
						
					<%} %>	
						
						<a href="prepareWrite.action?parentId=<%=story.get(i).getId() %>"><button type="button" class="btn btn-default glyphicon glyphicon-plus" style="border:none;padding:3px 7px 2px 7px;" id="f" ></button></a>
					</div>
				</div>
			</div>
			<%
			List<Chapter> siblings=cm.getChildren(story.get(i).getParentId());
		    long total=siblings.size();
		    long right=total-left-1;
			%>
			<div class="col-lg-1 col-md-1 col-sm-1" style="display:table;position:relative;">
				<div style="margin-top:50px;display:table-cell;vertical-align:middle; position:absolute;height:100%; top:0px;bottom:0px;left:10px;">
					<a href="turnStory.action?mood=1&index=<%=i %>" id=<%="ToRight"+story.get(i).getId()%> title="还可以查看<%=right %>条内容" > <span class="glyphicon glyphicon-chevron-right"/></a>
				</div>
			</div>
		</div>
		<%} %>
	</div>
	
	<!--返回顶部的图片-->
	<div style="display:none;POSITION: fixed;LINE-HEIGHT: 30px;  BOTTOM: 35px; CURSOR: pointer; RIGHT: 10px; _position: absolute; _right: auto  " 
		id="goTopBtn">
		<img src="pics\top.gif" />
	</div>
	<script type=text/javascript>goTopEx();</script>  
	<!-- 分割线-->
	<hr width="100%"/>
	
</body>

<script language="JavaScript">
<%for(int i=0;i<story.size();i++){%>
$("<%="#zan"+story.get(i).getId()%>").click(function(){
	$.ajax({
			url:"setLove.action?id=<%=story.get(i).getId() %>",
			type:"POST",
			async:true,
			success:function(data){	
			},
			error:function(){
			}
 });
 }); 
$("<%="#store"+story.get(i).getId()%>").click(function(){
	$.ajax({
			url:"setStore.action?id=<%=story.get(i).getId() %>",
			type:"POST",
			async:true,
			success:function(data){
			},
			error:function(){
			}
 });
 }); 
 
$("<%="#ToLeft"+story.get(i).getId()%>").click(function(){
	$.ajax({
			url:"turnStory.action?mood=0&index=<%=i %>",
			type:"POST",
			async:true,
			success:function(data){
				$("#contents").html(aStory.jsp);
			},
			error:function(){
			}
 });
 }); 
 

$("<%="#ToRight"+story.get(i).getId()%>").click(function(){
	$.ajax({
			url:"turnStory.action?mood=1&index=<%=i %>",
			type:"POST",
			async:true,
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
		var id=obj.id;
		var num="#zanNum"+id.substring(3);
		var love = document.getElementById(obj.id);
		var zanNum=$(num).text();
		if(obj.value=="0"){
			obj.value="1";
			love.style.color = "#ff0033";
			$(num).html(++zanNum);
			}
		else if(obj.value=="1"){
			obj.value="0";
			love.style.color = "#000000";
			$(num).html(--zanNum);
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

<script language="JavaScript">
	// textarea高度自增的代码
	$.fn.autoHeight = function(){
	
	function autoHeight(elem){
		elem.style.height = 'auto';
		elem.scrollTop = 0; //防抖动
		elem.style.height = elem.scrollHeight + 'px';
	}
	this.each(function(){
		autoHeight(this);
		$(this).on('keyup', function(){
			autoHeight(this);
		});
	});
 	}	
	$('textarea[autoHeight]').autoHeight();
	// textarea 结束
</script>
<script type="text/javascript">
window.onbeforeunload = function(){
    var scrollPos;    
    if (typeof window.pageYOffset != 'undefined') {
        scrollPos = window.pageYOffset;
    }
    else if (typeof document.compatMode != 'undefined' &&
        document.compatMode != 'BackCompat') {
        scrollPos = document.documentElement.scrollTop;
    }
    else if (typeof document.body != 'undefined') {
        scrollPos = document.body.scrollTop;
    }
    document.cookie="scrollTop="+scrollPos; //存储滚动条位置到cookies中
}

window.onload = function()
{ 
    if(document.cookie.match(/scrollTop=([^;]+)(;|$)/)!=null){
        var arr=document.cookie.match(/scrollTop=([^;]+)(;|$)/); //cookies中不为空，则读取滚动条位置
        document.documentElement.scrollTop=parseInt(arr[1]);
        document.body.scrollTop=parseInt(arr[1]);
    }
}

</script>

</html>