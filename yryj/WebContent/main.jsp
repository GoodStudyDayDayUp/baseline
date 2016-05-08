<%@ page language="java" contentType="text/html; charset=utf-8" import="com.yryj.model.*"
import="java.util.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<title>一人一句</title>
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
	%>
<body "><!--onLoad="scrollTo(0,500)-->
	<!--导航栏-->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="background-color:#ededed; margin:0px 0px 0px 0px;">
		<div class="navbar-header">
      <a class="navbar-brand" href="main.jsp" style="font-family:SimHei;">一人一句</a>
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
						<li><a href="logout.action">注销</a></li>
					</ul>
					<%}else{ %>
					<a href="beforelogin.action"  >
					登录
					</a>
					<%} %>
				</li>
			</ul>
			<p class="navbar-text navbar-right" style="font-family: SimHei  ;"><a href="creat_story.jsp"><span class="glyphicon glyphicon-plus" />添加故事</a></p>
		</div>
	</nav>
	
	<div id="myCarousel" class="carousel slide" style="margin-top:0px; padding-top:50px; height:100%;background-color:#ededed">
		<!-- 轮播（Carousel）指标 -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
		</ol>   
		<!-- 轮播（Carousel）项目 -->
		<div class="carousel-inner">
			<div class="item active">
				<p style="text-align:center; margin:auto"><img src="pics\logopic.png" height="100%" alt="First slide"></p>
			</div>
			<div class="item">
				<p style="text-align:center; margin:auto"><img src="pics\main_pic2.jpeg" height="100%" alt="Second slide"></p>
			</div>
		</div>
	</div> 
	
	
	<!------------------------------ 最大一层的分类 ------------------------------>
	<center>
		<table class="category">
			<tr>
				<td><div class="category-boxes">
				<a href="main-tree.jsp" >
					<img src="pics\xiaoshuo.jpg" class="blur"/>		
					<span class="title" >小说</span>
				</a></div>
				</td>
				
				<td><div class="category-boxes"><a href="main-tree.jsp">
					<img src="pics\shige.jpg" class="blur"/>
					<span class="title" >诗歌</span>
				</a></div></td>
				
				<td><div class="category-boxes"><a href="main-tree.jsp">
					<img src="pics\sanwen.jpg" class="blur"/>
					<span class="title" >散文</span>
				</a></div></td>
				
				<td><div class="category-boxes"><a href="main-tree.jsp">
					<img src="pics\xiju.jpg" class="blur"/>
					<span class="title" >戏剧</span>
				</a></div></td>
			</tr>
		</table>
	</center>
	
	<p style="text-align:center; margin:40px 0px 10px 0px"><img src="pics\fengexian.png" /></p>
	
	<div class="container" >
		<div class="row">
		<%for(Chapter ch:storys){ %>
		<%String length="短篇"; 
		switch((int)ch.getLength()){
		case 1:
			length="中篇";
			break;
		case 2:
			length="长篇";
			break;
		};
		
		%>
			<div class="col-lg-8 col-lg-offset-2 storyofmain" >
				<div class="col-lg-4 storyclass storycenter" style="background-color:#191970" >
					<h3 ><a href="main-tree.jsp"><%=ch.getFormat() %></a></h3>
					<h4 ><a href="main-tree.jsp"><%=ch.getStyle() %></a></h4>
					<h5 ><a href="main-tree.jsp"><%=length %></a></h5>
				</div>
				<div class="col-lg-8 storybegin"><p class="storycenter">
					<a href="readStory.action?index=<%=ch.getId() %>"><%=ch.getContent() %></a>
				</p></div>
			</div>
		<%} %>
		</div>
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
</html>