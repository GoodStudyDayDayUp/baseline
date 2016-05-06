<%@ page language="java" contentType="text/html; charset=utf-8"%>
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
		<script src="js/bootstrap-treeview.js"></script>
		<script src="js/bootstrap-treeview.min.js"></script>
	<script type="text/javascript">
        $(document).ready(function () {
            $('.dropdown-toggle').dropdown();
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
<body ><!--onLoad="scrollTo(0,500)-->
	<!--导航栏-->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="background-color:#ededed; margin:0px 0px 0px 0px;">
		<div class="navbar-header">
      <a class="navbar-brand" href="main.jsp" style="font-family:SimHei;">一人一句</a>
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
	<div class="container" style="margin-top:50px;">
		<div class="row">
		
			<!--左侧树状结构-->
			<div id="tree" class="col-lg-3" style="margin-top:10px;">
			</div>
			
			<!--右侧故事开头-->
			<div class="col-lg-9" id="maincontent">
			<div class="row storyofmain" style="  padding-left:10px;" >
				
				<div class="col-lg-4 storyclass storycenter" style="background-color:#191970" >
					<h3 ><a href="x">小说</a></h3>
					<h4 ><a href="x">武侠</a></h4>
					<h5 ><a href="x">长篇</a></h5>
				</div>
				<div class="col-lg-8 storybegin"><p class="storycenter">
					<a href="read.jsp">这世间本是没有什么神仙的，但自太古以来，人类眼见周遭世界，诸般奇异之事，电闪雷鸣，狂风暴雨，又有天灾人祸，伤亡无数，哀鸿遍野，决非人力所能为，所能抵挡。遂以为九天之上，有诸般神灵，九幽之下，亦是阴魂归处，阎罗殿堂。于是神仙之说，流传于世。</a>
				</p></div>
			</div>		
			<div class="row storyofmain" style="  padding-left:10px;" >
				
				<div class="col-lg-4 storyclass storycenter"style="background-color:#DC143C" >
					<h3 ><a href="x">戏剧</a></h3>
					<h4 ><a href="x">近代</a></h4>
					<h5 ><a href="x">孟京辉</a></h5>
				</div>
				<div class="col-lg-8 storybegin"><p class="storycenter">
					<a href="x">劳伦斯 ：在星期四吗，伯爵？时间未免太局促了。<br>
					帕里斯 ：这是我的岳父凯普莱特的意思；他既然这样性急，我也不愿把时间延迟下去。<br></a>
				</p></div>
			</div>		
			<div class="row storyofmain" style="  padding-left:10px;" >
				
				<div class="col-lg-4 storyclass storycenter" style="background-color:#458B74" >
					<h3 ><a href="x">诗歌</a></h3>
					<h4 ><a href="x">死亡</a></h4>
					<h5 ><a href="x">太阳</a></h5>
				</div>
				<div class="col-lg-8 storybegin"><p class="storycenter">
					<a href="x">在青麦地上跑着 <br/>
					雪和太阳的光芒 <br/>
					诗人，你无力偿还 <br/></a>
				</p></div>
			</div>		
			<div class="row storyofmain" style="  padding-left:10px;" >
				<div class="col-lg-4 storyclass storycenter" style="background-color:#EEC900" >
					<h3 ><a href="x">散文</a></h3>
					<h4 ><a href="x">风景</a></h4>
					<h5 ><a href="x">短篇</a></h5>
				</div>
				<div class="col-lg-8 storybegin"><p class="storycenter">
					<a href="x">秋天，无论在什么地方的秋天，总是好的；可是啊，北国的秋，却特别地来得清，来得静，来得悲凉。我的不远千里，要从杭州赶上青岛，更要从青岛赶上北平来的理由，也不过想饱尝一尝这“秋”，这故都的秋味。</a>
				</p></div>
				
			</div>		
			</div>
		</div>
	</div>
	
	<!--返回顶部的图片-->
	<div style="display:none;POSITION: fixed;LINE-HEIGHT: 30px;  BOTTOM: 35px; CURSOR: pointer; RIGHT: 10px; _position: absolute; _right: auto  " 
		id="goTopBtn">
		<img src="pics\top.gif" />
	</div>
	<script type=text/javascript>goTopEx();</script>  
	
</body>
<script language="JavaScript">
	function getTree(){
		var data = [
			{
            text: '热门',
            href: '#hot',
			 selectable: true,
			 state: {
			 selected: true,
			 }
			},
			{
            text: '小说',
            href: '#xiaoshuo',
            nodes: [
              {
                text: '科幻',
                href: '#kehuan',
                nodes: [
                  {
                    text: '长篇',
                    href: '#long',
                  },
                  {
                    text: '中篇',
                    href: '#medium',
                  }
                ]
              },
              {
                text: '传记',
                href: '#zhuanji',
              }
            ]
          },
          {
            text: '散文',
            href: '#sanwen',
			nodes: [
              {
                text: '风景',
                href: '#fengjing',
                nodes: [
                  {
                    text: '长篇',
                    href: '#changpian',
                  },
                  {
                    text: '中篇',
                    href: '#zhongpian',
                  }
                ]
              },
              {
                text: '人物',
                href: '#renwu',
              }
            ]
          },
          {
            text: '诗歌',
            href: '#shige',
          },
          {
            text: '戏剧',
            href: '#xiju',
          },
          
        ];
		return data;
	}
	$('#tree').treeview({
		color: "#428bca",
        expandIcon: "glyphicon glyphicon-stop",
        collapseIcon: "glyphicon glyphicon-unchecked",
		enableLinks: true,
		data: getTree(),
	});
	$('#tree').on('nodeSelected', function(event, node) {
	// 事件代码...
	var str = node.text;
	if(str=="小说"){
	}
	else{
	
	}
	});  
</script>
</html>