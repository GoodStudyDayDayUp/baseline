<%@ page language="java" contentType="text/html; charset=utf-8"
    import="com.yryj.model.*"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
		<title>发起一个故事</title>
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
<%
	User user=(User)session.getAttribute("user"); 
	Draft draft=(Draft)session.getAttribute("draft");
	if(draft==null)
		draft=new Draft();
	%>

	<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style=" margin:0px 0px 0px 0px;">
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
		</div>
	</nav>
	
	<div style="position:fixed; left:0px; top:50px; width:100%; height:100%;z-index:-1;">
		<img src="pics\back.jpg" width=100% height="100%"/>
	</div>
	
	<!-- 选大类，二级分类，贴标签。可以存草稿。在发布的时候选择分类 -->
	<div class="container" style=" margin-top:60px;">
		
		<div class="row">
		
			<div class="col-lg-8 col-lg-offset-2" id="newchpt" style="padding:0px 0px 0px 0px;">
			<form action="draft.action">
				<div > <!--contenteditable=true-->
				<%if(draft.getContent()==""){%>
					<textarea class="form-control" id="newchptcont" name="content" resize="none" autoHeight="true" style="overflow:hidden; min-height:150px; border-radius:0px;" placeholder="写一个开头..."></textarea>
				<%}else{ %>
					<textarea class="form-control" id="newchptcont" name="content" resize="none" autoHeight="true" style="overflow:hidden; min-height:150px; border-radius:0px;"><%=draft.getContent() %></textarea>
				<%} %>
				</div>
				<div style="float:right; margin-top:10px;">
					<!--
					<button class="btn btn-primary" onclick="Confirm()"/>确定内容</button>-->
					<%if(user==null){ %>
					<button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#saveModal"  />存草稿</button>
					<%}else{ %>
					<button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#saveModal" onclick="SaveDraft()" "/>存草稿</button>
					<%} %>
					
			
					<!--确认取消返回读文章的页面，取消取消留在本页面上-->
					<button type="button" class="btn btn-default"  data-toggle="modal" data-target="#myModal"/> 取消</button>
				</div>
			</form>
				
			</div>
		
		</div>
	</div>
	<div class="container" id="addsth" style=" margin-top:10px; ">
		<!--点击 确认后  选择分类和标签-->
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2" style="background-color:#fff;">
				<p style="margin-top:10px; font-family:SimHei;">请选择分类</p>
				<div class="row" >
				<div class="col-lg-2" ><div class=" xiaoshuo root_1l  " style=""><p style="display:table-cell; vertical-align:middle;">小说</p></div></div>
				<div class="col-lg-2" ><div class=" shige root_1l  " style=""><p style="display:table-cell; vertical-align:middle;">诗歌</p></div></div>
				<div class="col-lg-2" ><div class=" sanwen root_1l  " style=""><p style="display:table-cell; vertical-align:middle;">散文</p></div></div>
				<div class="col-lg-2" ><div class=" xiju root_1l  " style=""><p style="display:table-cell; vertical-align:middle;">戏剧</p></div></div>
				</div>
			</div></a>
			
			<div class="col-lg-8 col-lg-offset-2 2level" style="background-color:#fff;display:none;">
			<p style="margin-top:10px; font-family:SimHei;">请选择二级分类</p>
			<div class="row" >
			<div class="col-lg-2" ><div class=" root_2l kehuan " ><p style="display:table-cell; vertical-align:middle;">科幻</p></div></div>
			<div class="col-lg-2" ><div class=" root_2l  " style=""><p style="display:table-cell; vertical-align:middle;">科幻</p></div></div>
			<div class="col-lg-2" ><div class=" root_2l  " style=""><p style="display:table-cell; vertical-align:middle;">科幻</p></div></div>
			<div class="col-lg-2" ><div class=" root_2l  " style=""><p style="display:table-cell; vertical-align:middle;">科幻</p></div></div>
			<div class="col-lg-2" ><div class=" root_2l  " style=""><p style="display:table-cell; vertical-align:middle;">科幻</p></div></div>
			<div class="col-lg-2" ><div class=" root_2l  " style=""><p style="display:table-cell; vertical-align:middle;">科幻</p></div></div>
			</div>
			<div class="row" >
			<div class="col-lg-2" ><div class=" root_2l  " style=""><p style="display:table-cell; vertical-align:middle;">科幻</p></div></div>
			<div class="col-lg-2" ><div class=" root_2l  " style=""><p style="display:table-cell; vertical-align:middle;">科幻</p></div></div>
			<div class="col-lg-2" ><div class=" root_2l  " style=""><p style="display:table-cell; vertical-align:middle;">科幻</p></div></div>
			<div class="col-lg-2" ><div class=" root_2l  " style=""><p style="display:table-cell; vertical-align:middle;">科幻</p></div></div>
			<div class="col-lg-2" ><div class=" root_2l  " style=""><p style="display:table-cell; vertical-align:middle;">科幻</p></div></div>
			<div class="col-lg-2" ><div class=" root_2l  " style=""><p style="display:table-cell; vertical-align:middle;">科幻</p></div></div>
			</div>
			
			</div>
			
			<div class="col-lg-8 col-lg-offset-2" style="background-color:#fff;">
				<p style="margin-top:10px; font-family:SimHei;">添加关键字</p>
				<input type="text" class="form-control" id="newchptkey" placeholder="用#分割，例：#美人鱼#邓超，最多三个" style="margin-bottom:10px;"/>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2" id="newchpt" style="padding:0px 0px 0px 0px;">
				<div style="float:right; margin-top:10px;">
					<!--发布以后跳到一个新的界面上， 前面是他接的故事. 从此它上面的chapter的+号变成蓝色-->
					<form action="write.action" onsubmit="return Publish()">
					<textarea name="content" hidden="hidden" id="ctt"></textarea>
					<input value="" hidden="hidden" name="format" id="format">
					<input value="" hidden="hidden" name="style" id="style">
					<input value="" hidden="hidden" name="key" id="key">
					<button class="btn btn-primary" id="publish" data-toggle="modal" data-target="#publishModal"  /> 发起</button>
					</form>
				</div>
			</div>
		</div>
		
	</div>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-body">
            确认放弃文字？
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default"  data-dismiss="modal" onclick="Cancel()">
               取消
            </button>
  
            <input type="button" onclick= "window.location.href= 'deleteDraft.action' " class="btn btn-primary" data-dismiss="modal" value="确认"/>
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
   //function Confirm(){
	//	var iwrite = document.getElementById("addsth");
	//	addsth.style.display="block";
   //}
   
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
		var ctt=document.getElementById('ctt');
		ctt.value=content;
		var key=document.getElementById('key');
		key.value=fda;
		
		var first=document.getElementById('format');
		var second=document.getElementById('style');
		
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
<script type="text/javascript">
	var l=0;
	$(function(){
		$(".xiaoshuo").click(function(){
			$(".2level").show();
			$(this).addClass("root_1lc");
			$(".root_1l").siblings().removeClass("root_1lc");
			$(".sanwen").removeClass("root_1lc");
			$(".shige").removeClass("root_1lc");
		});
		$(".xiju").click(function(){
			$(".2level").show();
			$(this).addClass("root_1lc");
			$(".sanwen").removeClass("root_1lc");
			$(".shige").removeClass("root_1lc");
			$(".xiaoshuo").removeClass("root_1lc");
		});
		$(".sanwen").click(function(){
			$(".2level").show();
			$(this).addClass("root_1lc");
			$(".xiaoshuo").removeClass("root_1lc");
			$(".shige").removeClass("root_1lc");
			$(".xiju").removeClass("root_1lc");
		});
		$(".shige").click(function(){
			$(".2level").show();
			$(this).addClass("root_1lc");
			$(".xiju").removeClass("root_1lc");
			$(".sanwen").removeClass("root_1lc");
			$(".xiaoshuo").removeClass("root_1lc");
		});
		$(".kehuan").click(function(){
			l=1;
			$(this).addClass("root_2lc");
		});
	});
	function Publish(){
		if(l==0){
			alert("请选择二级分类");
			return false;
		}
		
		SaveDraft();
   }
</script>
</html>