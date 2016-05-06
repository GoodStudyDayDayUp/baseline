<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
<body>
<nav class="navbar navbar-default" role="navigation" style=" margin:0px 0px 0px 0px;">
	<div class="navbar-header">
      <a class="navbar-brand" href="main.jsp" style="font-family:SimHei;">一人一句</a>
   </div>
		<div>
			<ul class="nav navbar-nav navbar-right" style="margin-right: 20px;">
				<li class="dropdown" style="margin:0px 0px 0px 0px;font-family: SimHei  ;">
					<a href="usercenter.jsp" class="dropdown-toggle" data-toggle="dropdown" >
					用户名 <b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
						<li><a href="usercenter.jsp">个人主页</a></li>
						<li><a href="login.jsp">注销</a></li>
					</ul>
				</li>
			</ul>
			<p class="navbar-text navbar-right" style="font-family: SimHei  ;"><a href="creat_story.jsp"><span class="glyphicon glyphicon-plus" />添加故事开头</a></p>
		</div>
	</nav>

	<div class="container">
	<div class="col-lg-2" style="margin-top:20px;">
	<ul class="nav nav-pills nav-stacked">
	<li class="active na"><a href="#" id="info">基本信息</a></li>
	<li class="na"><a href="#" id="mychpts">我的作品</a></li>
	<li class="na"><a href="#" id="mycol">我的收藏</a></li>
	<li class="na"><a href="#" id="myfol">关注</a></li>
	<li class="na"><a href="#" id="myfans">粉丝</a></li>
	<li class="na"><a href="#" id="mypoints">积分</a></li>
	</ul>
	</div>
	<div class="col-lg-10" style="margin-top:20px;">
		<div id="basicInfo">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						基本信息
					</h3>
				</div>
				<div class="panel-body" >
					<table class="table">
						<tr><td>用户名</td><td><span class="label label-default">robin_g</span></td></tr>
						<tr><td>邮箱</td><td><span class="label label-default">842136912@qq.com</span></td></tr>
						<tr><td>联系方式</td>
						<td>
							<input type="text" class="form-control" id="phone" value="18813039364"/>
							<button type="button" class="btn btn-default" style="margin-top:5px;">更新联系方式</button>
						</td>
						</tr>
					</table>
					<hr/>
					<p>原有密码</p>
					<input type="text" class="form-control" id=oldpwd" />
					<p>新密码</p>
					<input type="password" name="password" class="form-control" id=newpwd" />
					<p>确认新密码</p>
					<input type="password" name="password" class="form-control" id=confirmpwd" />
					<button type="button" class="btn btn-default" style="margin-top:5px;">更新密码</input>
				</div>
			</div>
			<div class="panel panel-danger">
				<div class="panel-heading">
					<h3 class="panel-title">删除当前用户</h3>
				</div>
				<div class="panel-body">
					<button type="button" class="btn btn-danger">删除用户</button>
				</div>
			</div>
		</div>
		<div id="chpts" style="display:none;">
			<ul id="myTab" class="nav nav-tabs">
				<li class="active">
					<a href="#pub" data-toggle="tab">已发布的 </a>
				</li>
				<li><a href="#draft" data-toggle="tab">草稿箱</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active" id="pub">
					
						
							<div class="panel panel-default">
								<div class="panel-body">
								<div style="display:inline;">
									<span class="label label-primary chptlabel" >从前有...</span>
									<span class="label label-danger chptlabel">大陆</span>
								</div>
								<p class="everychpt">时间：不明，应该在很早、很早以前。<br/>	地点：神州浩土。</p>
								<div class="row" >
									<div class="user">
										<span>浏览数：10</span>
									</div>
									<div class="functs check" >
										<a href="read.jsp">查看前后文</a>
									</div>
								</div>
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
										<span>浏览数：10</span>
									</div>
									<div class="functs check">
										<a href="read.jsp">查看前后文</a>
									</div>
								</div>
								</div>
							</div>
				</div>
				<div class="tab-pane fade" id="draft"> <!-- 草稿箱 --> 
					<table class="table">
						<tr><td>神州浩土，广瀚无边。唯有中原大地，最是丰美肥沃，天下人口十之八九聚居于此。</td><td><a href="write.jsp"><button type="button" class="btn btn-default" style="float:right;">查看</button></a></td></tr>
						<tr><td>神州浩土，广瀚无边。唯有中原大地，最是丰美肥沃，天下人口十之八九聚居于此。</td><td><a href="write.jsp"><button type="button" class="btn btn-default" style="float:right;">查看</button></a></td></tr>
						<tr><td>神州浩土，广瀚无边。唯有中原大地，最是丰美肥沃，天下人口十之八九聚居于此。</td><td><a href="write.jsp"><button type="button" class="btn btn-default" style="float:right;">查看</button></a></td></tr>
						<tr><td>神州浩土，广瀚无边。唯有中原大地，最是丰美肥沃，天下人口十之八九聚居于此。</td><td><a href="write.jsp"><button type="button" class="btn btn-default" style="float:right;">查看</button></a></td></tr>
						<tr><td>神州浩土，广瀚无边。唯有中原大地，最是丰美肥沃，天下人口十之八九聚居于此。</td><td><a href="write.jsp"><button type="button" class="btn btn-default" style="float:right;">查看</button></a></td></tr>
					</table>
				</div>
			</div>
		</div>
		<div id="collects" style="display:none;">
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
										<a href="x.jsp">萧乾</a>
										<span>浏览数：10 </span>
										<a href="read.jsp">查看前后文</a>
									</div>
									<div class="functs check">
										<button type="button" class="btn btn-default chptbtn glyphicon glyphicon-heart" style="border:none;padding:3px 7px 2px 7px;" id="a" value="0" onclick="LoveShow(this)"></button>
										<button type="button" class="btn btn-default glyphicon glyphicon-star" style="border:none;padding:3px 7px 2px 7px;color:#f1c232;" id="b" value="0" onclick="CollectShow(this)"></button>
										<a href="write.jsp"><button type="button" class="btn btn-default glyphicon glyphicon-plus" style="border:none;padding:3px 7px 2px 7px;" id="c" ></button></a>
									</div>
								</div>
								</div>
							</div>
		</div>
		<div id="follow" style="display:none">
			<div class="panel panel-default">
				<div class="panel-heading">我关注的人</div>
					<ul class="list-group">
						<li class="list-group-item"><a href="x">张兵</a></li>
						<li class="list-group-item"><a href="x">何明</a></li>
						<li class="list-group-item"><a href="x">李子康</a></li>
						<li class="list-group-item"><a href="x">交大吴彦祖</a></li>
						<li class="list-group-item"><a href="x">刘烨</a></li>
						<li class="list-group-item"><a href="x">bear4515</a></li>
						<li class="list-group-item"><a href="x">vegetchichen</a></li>
						<li class="list-group-item"><a href="x">炸炸</a></li>
						<li class="list-group-item"><a href="x">TaylorSwift</a></li>
						<li class="list-group-item"><a href="x">LadyGaga</a></li>
						<li class="list-group-item"><a href="x">CharseDikense</a></li>
						<li class="list-group-item"><a href="x">MarkTowan</a></li>
					</ul>
				</div>
		</div>
		<div id="fans" style="display:none">
			<div class="panel panel-default">
				<div class="panel-heading">关注我的人</div>
					<ul class="list-group">
						<li class="list-group-item"><a href="x">张兵</a></li>
						<li class="list-group-item"><a href="x">何明</a></li>
						<li class="list-group-item"><a href="x">李子康</a></li>
						<li class="list-group-item"><a href="x">交大吴彦祖</a></li>
					</ul>
				</div>
		</div>
		<div id="points" style="display:none">
			<div class="panel panel-default">
				<div class="panel-heading">积分</div>
				<div class="panel-body">
					积分余额<span class="label label-default" style="margin-left:20px;">102</span>
				</div>
				<table class="table">
					<th>时间</th><th>积分</th>
					<tr><td>2016-04-12</td><td>200</td></tr>
					<tr><td>2016-03-12</td><td>400</td></tr>
				</table>
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
$("#points").hide();
});
$("#mychpts").on("click",function(){
$("#chpts").show();
$("#basicInfo").hide();
$("#collects").hide();
$("#follow").hide();
$("#fans").hide();
$("#points").hide();
});
$("#mycol").on("click",function(){
$("#collects").show();
$("#basicInfo").hide();
$("#chpts").hide();
$("#follow").hide();
$("#fans").hide();
$("#points").hide();
});
$("#myfol").on("click",function(){
$("#follow").show();
$("#basicInfo").hide();
$("#chpts").hide();
$("#collects").hide();
$("#fans").hide();
$("#points").hide();
});
$("#myfans").on("click",function(){
$("#fans").show();
$("#basicInfo").hide();
$("#chpts").hide();
$("#collects").hide();
$("#follow").hide();
$("#points").hide();
});
$("#mypoints").on("click",function(){
$("#points").show();
$("#basicInfo").hide();
$("#chpts").hide();
$("#collects").hide();
$("#follow").hide();
$("#fans").hide();
});
</script>
</html>