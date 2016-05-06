<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<title>新加一段文字</title>
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
<body>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style=" margin:0px 0px 0px 0px;">
		<div class="navbar-header">
			<a class="navbar-brand" href="read.jsp" style="padding-top:17px;"><img src="pics\go_back.png"/></a>
			<a class="navbar-brand" href="read.jsp" style="padding-left:0px">返回</a>
		</div>
		<div>
			<ul class="nav navbar-nav navbar-right" style="margin-right: 20px;">
				<li class="dropdown" style="margin:0px 0px 0px 0px;font-family: SimHei  ;">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" >
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
	
	<div style="position:fixed; left:0px; top:50px; width:100%; height:100%">
		<img src="pics\back.jpg" width=100% height="100%"/>
	</div>
	
	<div class="container" style=" margin-top:50px;">
		
		<div class="row " > <!--onmouseover="DivShow()" onmouseout="DivHide()" -->

			<div class="col-lg-8 col-lg-offset-2  chptbox" >
				<p class="everychpt">
				青云山脉巍峨高耸，虎踞中原，山阴处有大河“洪川”，山阳乃重镇“河阳城”，扼天下咽喉，地理位置十分重要。<br/>
    青云山连绵百里，峰峦起伏，最高有七峰，高耸入云，平日里只见白云环绕山腰，不识山顶真容。青云山山林密布，飞瀑奇岩，珍禽异兽，在所多有，景色幽险奇峻，天下闻名。<br/>
    只是更有名的，却是在这山上的修真门派——青云门。<br/>
    青云一脉历史悠久，创派至今已有两千余年，为当今正邪两道之首。据说开派祖师本是一个江湖相师，半生潦倒，郁郁不得志。在其四十九岁那年，云游四方，路经青云山，一眼便看出此山钟灵奇秀，聚天地灵气，是一绝好之地。当下立刻登山，餐风饮露，修真炼道，未几，竟于青云山深处一处密洞内，得到一本无名古卷，上载各般法门妙术，艰深枯涩，却是妙用无穷，威力巨大。<br/>
    相师得此奇遇，潜心修习。忽忽二十年，小有所成，乃出，几番江湖风雨，虽不能独霸天下，倒也成了一方之雄。遂在青云山上，开宗立派，名曰：青云。因此古卷所载，近于道家，他便做道人打扮，自号“青云子”，后世子弟多尊称为“青云真人”。<br/>
    青云子寿三百六十七岁，身前收了十个弟子，临终前叮嘱道：“我半生说学，尽在相术，尤精于风水之相。这青云山乃是人间罕有灵地，我青云一门占有此山，日后必定兴盛，尔等决不可放弃。切记，切记！”<br/>
    </p>
				<div class="row" >
					<div class="user" id="chptuser">
						<a href="x.jsp">萧乾</a>
						<span>浏览数：10</span>
					</div>
					<div class="functs" id="funct" style="margin-right: 10px;">
						<button type="button" class="btn btn-default chptbtn glyphicon glyphicon-heart" style="border:none;padding:3px 7px 2px 7px;" id="love" value="0" onclick="LoveShow(this)"></button>
						<button type="button" class="btn btn-default glyphicon glyphicon-star" style="border:none;padding:3px 7px 2px 7px;" id="collect" value="0" onclick="CollectShow(this)"></button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2" id="newchpt" style="padding:0px 0px 0px 0px;">
				<div > <!--contenteditable=true-->
					<textarea class="form-control" id="newchptcont" resize="none" autoHeight="true" style="overflow:hidden; min-height:80px; border-radius:0px;" placeholder="写文字..."></textarea>
				</div>
				<div style="float:right; margin-top:10px;">
					<!--发布以后跳到一个新的界面上， 前面是他接的故事. 从此它上面的chapter的+号变成蓝色-->
					<button class="btn btn-primary" data-toggle="modal" data-target="#publishModal" onclick="Publish()"/> 发布</button>
					<button class="btn btn-primary" data-toggle="modal" data-target="#saveModal" onclick="SaveDraft()"/>存草稿</button>
					<!--确认取消返回读文章的页面，取消取消留在本页面上-->
					<button class="btn btn-default"  data-toggle="modal" data-target="#myModal"/> 取消</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="publishModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               添加关键字
            </h4>
         </div>
         <div class="modal-body">
            <input type="text" class="form-control" id="newchptkey" placeholder="用#分割，例：#美人鱼#邓超，最多三个" style="border-radius:0px; border-top-width:0px;"/>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
            </button>
            <button type="button" class="btn btn-primary" data-dismiss="modal">
               确认发布
            </button>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-body">
            确认放弃文字？
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default"  data-dismiss="modal">
               取消
            </button>
            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="Cancel()">
               确认
            </button>
         </div>
      </div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<div class="modal fade" id="saveModal" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-body">
            保存成功！
         </div>
      </div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
</body>
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
	
   
   function Publish(){
		window.location.href="#"; 
   }
   
   function SaveDraft(){
		var content = document.getElementById('newchptcont').value;  // 存了文字内容
		var keywords = [];  // 存了三个关键字
		var fda = document.getElementById('newchptkey').value;
		if(fda.indexOf("#")>0){ // 如果用户输入的内容包含#，#后面的关键字才做关键字处理
			fda = fda.split("#");
			alert(fda);
			for(var i=0; i<3; i++){
				keywords.push(fda[i+1]);
			}
		}
		else{ //如果用户输入的内容不包含#，则用户输入的文字当作一个标签处理
			keywords[0] = fda;
		}
   }
	function Cancel(){
		var iwrite = document.getElementById("write");
		iwrite.style.color="#000000";
		history.go(-1);
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
</html>