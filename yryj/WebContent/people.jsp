<%@ page language="java" contentType="text/html; charset=utf-8"
import="com.yryj.model.*"
import="java.util.*"
import="com.yryj.pub.*"
import="java.util.Date"
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
	List<Chapter> chs=(List<Chapter>)session.getAttribute("chapters");
%>
<body >
<script type="text/javascript">
	window.onload =function onload(){
		var a=<%=person %>;
		if(a==null){
			window.location.href='errorPage/404error.jsp';
		}
	}
	</script>
	<nav class="navbar navbar-default" role="navigation" style=" margin:0px 0px 0px 0px;">
	<div class="navbar-header">
      <a class="navbar-brand" href="main.html" style="font-family:SimHei;">一人一句</a>
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
			<p class="navbar-text navbar-right" style="font-family: SimHei  ;"><a href="creat_story.html"><span class="glyphicon glyphicon-plus" />添加故事</a></p>
		</div>
	</nav>
	
	<div class="container">
		<div class="col-lg-2" style="margin-top:20px;">
		<ul class="nav nav-pills nav-stacked">
			<li class="active na"><a href="#" id="info"><%=person.getName() %></a></li>
			<li class="na" ><a href="#" id="mychpts">作品&nbsp;&nbsp;&nbsp;<span class="label label-default">100</span></a></li>
			<li class="na"><a href="#" id="mycol">收藏&nbsp;&nbsp;&nbsp;<span class="label label-default">20</span></a></li>
			<li class="na"><a href="#" id="myfol">关注&nbsp;&nbsp;&nbsp;<span class="label label-default">3</span></a></li>
			<li class="na"><a href="#" id="myfans">粉丝&nbsp;&nbsp;&nbsp;<span class="label label-default">123</span></a></li>
		</ul>
		</div>
		<div class="col-lg-10" style="margin-top:20px;">
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
				if(i==3) break;
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
										<a href="read.jsp">查看前后文</a>
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
					<div class="panel panel-default" style="margin-top:-25px;">
								<div class="panel-body">
								<p class="everychpt">天地不仁，以万物为诌狗！
    这世间本是没有什么神仙的，但自太古以来，人类眼见周遭世界，诸般奇异之事，电闪雷鸣，狂风暴雨，又有天灾人祸，伤亡无数，哀鸿遍野，决非人力所能为，所能抵挡。遂以为九天之上，有诸般神灵，九幽之下，亦是阴魂归处，阎罗殿堂。
    于是神仙之说，流传于世。无数人类子民，诚心叩拜，向着自己臆想创造出的各种神明顶礼膜拜，祈福诉苦，香火鼎盛。
    自古以来，凡人无不有一死。但世人皆恶死爱生，更有地府阎罗之说，平添了几分苦惧，在此之下，遂有长生不死之说。
    相比与其他生灵物种，人类或在体质上处于劣势，但万物灵长，却是绝无虚言。在追求长生的原动力下，一代代聪明才智之士，前赴后继，投入毕生精力，苦苦钻研。至今为止，虽然真正意义上的长生不死仍未找到，却有一些修真炼道之士，参透些天地造化，以凡人之身，掌握强横力量，借助各般秘宝法器之力，竟可震撼天地，有雷霆之威。而一些得到高深的前辈，更传说已活上千年之久而不死。世上之人以为得道成仙，便有更多人投入修真炼道之路。
    神州浩土，广瀚无边。唯有中原大地，最是丰美肥沃，天下人口十之八九聚居于此。而东南西北边荒之地，山险水恶，多凶兽猛禽，多恶瘴毒物，亦多蛮族夷民，虏毛饮血，是以人迹罕至。而人间自古相传，有洪荒遗种，残存人世，藏于深山密谷，寿逾万年，却是无人得见。
    时至今日，人间修真炼道之人，多如过江之鲫，数不胜数。又以神州浩土之广阔，人间奇人异士之多，故修炼之法道林林总总，俱不相同。长生之法还未找到，彼此间却逐渐有了门派之分，正邪之别。由之而起的门户之见，勾心斗角乃至争伐杀戮，在所多有。
    当长生不死看起来那般遥远而不可捉摸，修炼中所带来的力量，便逐渐成了许多人的目标。
    方今之世，正道大昌，邪魔退避。中原大地山灵水秀，人气鼎盛，物产丰富，为正派诸家牢牢占据。其中尤以“青云门”、“天音寺”、和“焚香谷”为三大支柱，是为领袖。
    这个故事，便是从“青云门”开始的。</p>
								<div class="row" >
									<div class="user" >
										<a href="x.html">萧乾</a>&nbsp;&nbsp;&nbsp;&nbsp;
										浏览数：<span>10 </span>&nbsp;&nbsp;&nbsp;&nbsp;
										点赞数：<span>10000 </span>
									</div>
									<div class="functs check">
										<a href="read.html">查看前后文</a>
									</div>
								</div>
								</div>
							</div>
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
										<a href="read.jsp">查看前后文</a>
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
			<div class="panel panel-default">
								<div class="panel-body">
								<p class="everychpt">天地不仁，以万物为诌狗！
    这世间本是没有什么神仙的，但自太古以来，人类眼见周遭世界，诸般奇异之事，电闪雷鸣，狂风暴雨，又有天灾人祸，伤亡无数，哀鸿遍野，决非人力所能为，所能抵挡。遂以为九天之上，有诸般神灵，九幽之下，亦是阴魂归处，阎罗殿堂。
    于是神仙之说，流传于世。无数人类子民，诚心叩拜，向着自己臆想创造出的各种神明顶礼膜拜，祈福诉苦，香火鼎盛。
    自古以来，凡人无不有一死。但世人皆恶死爱生，更有地府阎罗之说，平添了几分苦惧，在此之下，遂有长生不死之说。
    相比与其他生灵物种，人类或在体质上处于劣势，但万物灵长，却是绝无虚言。在追求长生的原动力下，一代代聪明才智之士，前赴后继，投入毕生精力，苦苦钻研。至今为止，虽然真正意义上的长生不死仍未找到，却有一些修真炼道之士，参透些天地造化，以凡人之身，掌握强横力量，借助各般秘宝法器之力，竟可震撼天地，有雷霆之威。而一些得到高深的前辈，更传说已活上千年之久而不死。世上之人以为得道成仙，便有更多人投入修真炼道之路。
    神州浩土，广瀚无边。唯有中原大地，最是丰美肥沃，天下人口十之八九聚居于此。而东南西北边荒之地，山险水恶，多凶兽猛禽，多恶瘴毒物，亦多蛮族夷民，虏毛饮血，是以人迹罕至。而人间自古相传，有洪荒遗种，残存人世，藏于深山密谷，寿逾万年，却是无人得见。
    时至今日，人间修真炼道之人，多如过江之鲫，数不胜数。又以神州浩土之广阔，人间奇人异士之多，故修炼之法道林林总总，俱不相同。长生之法还未找到，彼此间却逐渐有了门派之分，正邪之别。由之而起的门户之见，勾心斗角乃至争伐杀戮，在所多有。
    当长生不死看起来那般遥远而不可捉摸，修炼中所带来的力量，便逐渐成了许多人的目标。
    方今之世，正道大昌，邪魔退避。中原大地山灵水秀，人气鼎盛，物产丰富，为正派诸家牢牢占据。其中尤以“青云门”、“天音寺”、和“焚香谷”为三大支柱，是为领袖。
    这个故事，便是从“青云门”开始的。</p>
								<div class="row" >
									<div class="user" >
										<a href="x.html">萧乾</a>&nbsp;&nbsp;&nbsp;&nbsp;
										浏览数：<span>10 </span>&nbsp;&nbsp;&nbsp;&nbsp;
										点赞数：<span>10000 </span>
									</div>
									<div class="functs check">
										<a href="read.html">查看前后文</a>
									</div>
								</div>
								</div>
							</div>
		</div>
		<div id="follow" style="display:none">
			<div class="panel panel-default">
				<div class="panel-heading">我关注的人</div>
					<ul class="list-group">
						<li class="list-group-item" ">
							<table><tr>
							<td style="width:100px;"><a href="#" ><b>张兵</b></a></td>
							<td><p style="font-size:12px;padding-bottom:-10px;margin-bottom:-10px;">粉丝数：<span>100</span>&nbsp;&nbsp;&nbsp;&nbsp;章节数：<span>300</span></p></td>
							</tr></table>
							<button class="btn btn-info" style="float:right;margin-top:-25px;"> 关注TA </button>
						</li>
						
						<li class="list-group-item" ">
							<table><tr>
							<td style="width:100px;"><a href="x"><b>何明</b></a></td>
							<td><p style="font-size:12px;padding-bottom:-10px;margin-bottom:-10px;">粉丝数：<span>100</span>&nbsp;&nbsp;&nbsp;&nbsp;章节数：<span>300</span></p></td>
							</tr></table>
							<button class="btn btn-info" style="float:right;margin-top:-25px;"> 关注TA </button>
						</li>
						<li class="list-group-item" ">
							<table><tr>
							<td style="width:100px;"><a href="x"><b>交大吴彦祖</b></a></td>
							<td><p style="font-size:12px;padding-bottom:-10px;margin-bottom:-10px;">粉丝数：<span>100</span>&nbsp;&nbsp;&nbsp;&nbsp;章节数：<span>300</span></p></td>
							</tr></table>
							<button class="btn btn-info" style="float:right;margin-top:-25px;"> 关注TA </button>
						</li>
						<li class="list-group-item" ">
							<table><tr>
							<td style="width:100px;"><a href="x"><b>李子康</b></a></td>
							<td><p style="font-size:12px;padding-bottom:-10px;margin-bottom:-10px;">粉丝数：<span>100</span>&nbsp;&nbsp;&nbsp;&nbsp;章节数：<span>300</span></p></td>
							</tr></table>
							<button class="btn btn-info" style="float:right;margin-top:-25px;"> 关注TA </button>
						</li>
						
					</ul>
				</div>
		</div>
		<div id="fans" style="display:none">
			<div class="panel panel-default">
				<div class="panel-heading">关注我的人</div>
					<ul class="list-group">
						<li class="list-group-item" ">
							<table><tr>
							<td style="width:100px;"><a href="x"><b>张兵</b></a></td>
							<td><p style="font-size:12px;padding-bottom:-10px;margin-bottom:-10px;">粉丝数：<span>100</span>&nbsp;&nbsp;&nbsp;&nbsp;章节数：<span>300</span></p></td>
							</tr></table>
							<button class="btn btn-info" style="float:right;margin-top:-25px;"> 关注TA </button>
						</li>
						<li class="list-group-item" ">
							<table><tr>
							<td style="width:100px;"><a href="x"><b>何明</b></a></td>
							<td><p style="font-size:12px;padding-bottom:-10px;margin-bottom:-10px;">粉丝数：<span>100</span>&nbsp;&nbsp;&nbsp;&nbsp;章节数：<span>300</span></p></td>
							</tr></table>
							<button class="btn btn-info" style="float:right;margin-top:-25px;"> 关注TA </button>
						</li>
						<li class="list-group-item" ">
							<table><tr>
							<td style="width:100px;"><a href="x"><b>交大吴彦祖</b></a></td>
							<td><p style="font-size:12px;padding-bottom:-10px;margin-bottom:-10px;">粉丝数：<span>100</span>&nbsp;&nbsp;&nbsp;&nbsp;章节数：<span>300</span></p></td>
							</tr></table>
							<button class="btn btn-info" style="float:right;margin-top:-25px;"> 关注TA </button>
						</li>
						<li class="list-group-item" ">
							<table><tr>
							<td style="width:100px;"><a href="x"><b>李子康</b></a></td>
							<td><p style="font-size:12px;padding-bottom:-10px;margin-bottom:-10px;">粉丝数：<span>100</span>&nbsp;&nbsp;&nbsp;&nbsp;章节数：<span>300</span></p></td>
							</tr></table>
							<button class="btn btn-info" style="float:right;margin-top:-25px;"> 关注TA </button>
						</li>
						
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