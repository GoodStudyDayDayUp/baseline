<%@ page language="java" contentType="text/html; charset=utf-8" import="com.yryj.model.*"%>
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
</head>
<%
	User user=(User)session.getAttribute("user"); 
	%>
<body >
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style=" margin:0px 0px 0px 0px;">
		<div class="navbar-header">
			<a class="navbar-brand" href="main.jsp">首页 /</a>
			<a class="navbar-brand" style="padding-left:0px;" href="#">小说 /</a>
			<a class="navbar-brand" style="padding-left:0px;" href="#">玄幻 /</a>
			<a class="navbar-brand" style="padding-left:0px;" href="#">长篇</a>
		</div>
		<div>
			<ul class="nav navbar-nav navbar-right" style="margin-right: 20px;">
				<li class="dropdown" style="margin:0px 0px 0px 0px;font-family: SimHei  ;">
				<%if(user!=null){ %>
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" >
					<%=user.getName() %><b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
						<li><a href="usercenter.jsp">个人主页</a></li>
						<li><a href="logout.action">注销</a></li>
					</ul>
					<%}else{ %>
					<a href="beforelogin.action"  >
					登录
					</a>
					<%} %>
				</li>
			</ul>
			<p class="navbar-text navbar-right" style="font-family: SimHei  ;"><a href="creat_story.jsp"><span class="glyphicon glyphicon-plus" />添加故事开头</a></p>
		</div>
	</nav>
	
	
	<div style="position:fixed; left:0px; top:50px; width:100%; height:100%">
		<img src="pics\back.jpg" width=100% height="100%"/>
	</div>


	
	<div class="container" style=" margin-top:50px;">
		
		<div class="row " > <!--onmouseover="DivShow()" onmouseout="DivHide()" -->

			<div class="col-lg-8 col-lg-offset-2  chptbox" >
				<div style="display:inline;">
					<span class="label label-primary chptlabel" >从前有...</span>
					<span class="label label-danger chptlabel">大陆</span>
				</div>
				<p class="everychpt">
				时间：不明，应该在很早、很早以前。<br/>
				地点：神州浩土。</p>
				<div class="row" >
					<div class="user" id="chptuser">
						<a href="x.jsp">萧乾</a>
						<span>浏览数：10</span>
					</div>
					<div class="functs" id="funct">
						<button type="button" class="btn btn-default chptbtn glyphicon glyphicon-heart" style="border:none;padding:3px 7px 2px 7px;" id="a" value="0" onclick="LoveShow(this)"></button>
						<button type="button" class="btn btn-default glyphicon glyphicon-star" style="border:none;padding:3px 7px 2px 7px;" id="b" value="0" onclick="CollectShow(this)"></button>
						<a href="write.jsp"><button type="button" class="btn btn-default glyphicon glyphicon-plus" style="border:none;padding:3px 7px 2px 7px;" id="c" ></button></a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row " > <!--onmouseover="DivShow()" onmouseout="DivHide()" -->
			<div class="col-lg-1 col-lg-offset-1" style="display:table;position:relative;">
				<div style="margin-top:50px;display:table-cell;vertical-align:middle; position:absolute;height:100%; top:0px;bottom:0px;right:10px;">
					<a href="javascript:void(0);" id="ToLeft" onclick="LeftChpt();" > <span class="glyphicon glyphicon-chevron-left"/></a>
				</div>
			</div>
			<div class="col-lg-8  chptbox" >
				<p class="everychpt" id="b1">
				天地不仁，以万物为诌狗！
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
					<div class="user" id="chptuser">
						<a href="x.jsp">萧乾</a>
						<span>浏览数：10</span>
					</div>
					<div class="functs" id="funct">
						<button type="button" class="btn btn-default chptbtn glyphicon glyphicon-heart" style="border:none;padding:3px 7px 2px 7px;" id="d" value="0" onclick="LoveShow(this)"></button>
						<button type="button" class="btn btn-default glyphicon glyphicon-star" style="border:none;padding:3px 7px 2px 7px;" id="e" value="0" onclick="CollectShow(this)"></button>
						<a href="write.jsp"><button type="button" class="btn btn-default glyphicon glyphicon-plus" style="border:none;padding:3px 7px 2px 7px;" id="f" ></button></a>
					</div>
				</div>
			</div>
			<div class="col-lg-1" style="display:table;position:relative;">
				<div style="margin-top:50px;display:table-cell;vertical-align:middle; position:absolute;height:100%; top:0px;bottom:0px;left:10px;">
					<a href="#" id="ToRight" > <span class="glyphicon glyphicon-chevron-right"/></a>
				</div>
			</div>
		</div>
		
		<div class="row " > <!--onmouseover="DivShow()" onmouseout="DivHide()" -->
			<div class="col-lg-1 col-lg-offset-1" style="display:table;position:relative;">
				<div style="margin-top:50px;display:table-cell;vertical-align:middle; position:absolute;height:100%; top:0px;bottom:0px;right:10px;">
					<a href="#" id="ToLeft" > <span class="glyphicon glyphicon-chevron-left"/></a>
				</div>
			</div>
			<div class="col-lg-8  chptbox" >
				<div style="display:inline;">
					<span class="label label-info chptlabel" >玄幻</span>
					<span class="label label-warning chptlabel">从前</span>
					<span class="label label-default chptlabel">青云山</span>
				</div>
				<p class="everychpt">
				青云山脉巍峨高耸，虎踞中原，山阴处有大河“洪川”，山阳乃重镇“河阳城”，扼天下咽喉，地理位置十分重要。<br/>
    青云山连绵百里，峰峦起伏，最高有七峰，高耸入云，平日里只见白云环绕山腰，不识山顶真容。青云山山林密布，飞瀑奇岩，珍禽异兽，在所多有，景色幽险奇峻，天下闻名。<br/>
    只是更有名的，却是在这山上的修真门派——青云门。<br/>
    青云一脉历史悠久，创派至今已有两千余年，为当今正邪两道之首。据说开派祖师本是一个江湖相师，半生潦倒，郁郁不得志。在其四十九岁那年，云游四方，路经青云山，一眼便看出此山钟灵奇秀，聚天地灵气，是一绝好之地。当下立刻登山，餐风饮露，修真炼道，未几，竟于青云山深处一处密洞内，得到一本无名古卷，上载各般法门妙术，艰深枯涩，却是妙用无穷，威力巨大。<br/>
    相师得此奇遇，潜心修习。忽忽二十年，小有所成，乃出，几番江湖风雨，虽不能独霸天下，倒也成了一方之雄。遂在青云山上，开宗立派，名曰：青云。因此古卷所载，近于道家，他便做道人打扮，自号“青云子”，后世子弟多尊称为“青云真人”。<br/>
    青云子寿三百六十七岁，身前收了十个弟子，临终前叮嘱道：“我半生说学，尽在相术，尤精于风水之相。这青云山乃是人间罕有灵地，我青云一门占有此山，日后必定兴盛，尔等决不可放弃。切记，切记！”<br/>
    当时十位弟子纷纷点头，深信不疑，青云子方才溘然而逝。不料其后百年间，不知是天意弄人，或根本是青云子相术不精，青云门非但没有发达，反而日见式微。<br/>
    十位弟子中，两人早夭，四人死于江湖仇杀对决，剩下的一人残废，一人失踪，只传下两脉。如此过了五十年，青云山方圆百里发生了从未有过的天灾地震，山洪爆发，地动山摇，死伤无数，竟是又绝了一脉。而仅剩独苗，却限于资质，本领低微，早不复青云子当年风光，反因那本古卷缘故，惹来外敌争夺，几番血战，若不是青云子留下的几道厉害禁制法宝，只怕青云门已被人灭了。<br/>
    这种情况一直持续了整整四百年，青云门毫无起色，几乎可以用“苟延残喘”来形容了。到了最后，甚至被人欺负到了家门口，青云七峰中，除了主峰通天峰，其余六座都被外敌占了，其中还有强盗悍匪，以做据点，四处抢掠，横行不法。不知情的人多有误解，以为青云门已堕落如斯，青云子弟虽多般辩解，亦有心杀敌正名，却是有心无力，可怜可叹。至今想起，那实在是青云一脉最悲苦的一段日子。<br/>
    直到距今一千三百年前，情况才有了改变。</p>
				<div class="row" >
					<div class="user" id="chptuser">
						<a href="x.jsp">萧乾</a>
						<span>浏览数：10</span>
					</div>
					<div class="functs" id="funct">
						<button type="button" class="btn btn-default chptbtn glyphicon glyphicon-heart" style="border:none;padding:3px 7px 2px 7px;" id="d" value="0" onclick="LoveShow(this)"></button>
						<button type="button" class="btn btn-default glyphicon glyphicon-star" style="border:none;padding:3px 7px 2px 7px;" id="e" value="0" onclick="CollectShow(this)"></button>
						<a href="write.jsp"><button type="button" class="btn btn-default glyphicon glyphicon-plus" style="border:none;padding:3px 7px 2px 7px;" id="f" ></button></a>
					</div>
				</div>
			</div>
			<div class="col-lg-1" style="display:table;position:relative;">
				<div style="margin-top:50px;display:table-cell;vertical-align:middle; position:absolute;height:100%; top:0px;bottom:0px;left:10px;">
					<a href="#" id="ToRight" > <span class="glyphicon glyphicon-chevron-right"/></a>
				</div>
			</div>
		</div>		
	</div>
	
</body>
<script language="JavaScript">
	
	function LeftChpt(){
		var content = document.getElementById("b1");
		content.innerjsp ="乌山镇，玉兰大陆第一山脉‘魔兽山脉’西方的芬莱王国中的一个普通小镇。";
	}
	function RightChpt(){
		//按下向右的按钮更换p内容
	}
	
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

</html>