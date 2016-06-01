<%@ page language="java" contentType="text/html; charset=utf-8"
	import="com.yryj.model.*" import="com.yryj.pub.*"
	import="java.util.Date" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>新加一段文字</title>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="css/bootstrap.css" />
		<link rel="stylesheet" href="css/style.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="dist/css/wangEditor.min.css" />
		<script src="js/jquery.min.js"></script>
		<script type="text/javascript" src="dist/js/wangEditor.min.js"></script>
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
	Draft draft=(Draft)session.getAttribute("draft");
	if(draft==null||draft.getParentId()==-1)
		draft=new Draft();
	Chapter parent =(Chapter) session.getAttribute("parentChapter");
	if(parent==null)
		parent=new Chapter();
	%>
<body>
	<script type="text/javascript">
	window.onload =function onload(){
		<%if(parent.getContent()==""){%>
			window.location.href='404error.jsp';
		<%}%>
	}
	</script>

	<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
		style=" margin:0px 0px 0px 0px;">
	<div class="navbar-header">
		<a class="navbar-brand" href="read.jsp" style="padding-top: 17px;"><img
			src="pics\go_back.png" /></a> <a class="navbar-brand" href="read.jsp"
			style="padding-left: 0px">返回</a>
	</div>
	<div>
		<ul class="nav navbar-nav navbar-right" style="margin-right: 20px;">
			<li class="dropdown"
				style="margin: 0px 0px 0px 0px; font-family: SimHei;">
				<%if(user!=null){ %> <a href="#" class="dropdown-toggle"
				data-toggle="dropdown"> <%=user.getName() %><b class="caret"></b>
			</a>
				<ul class="dropdown-menu">
					<li><a href="usercenter.jsp">个人主页</a></li>
					<%if(user.getName().equals(Format.managerName)){ %>
					<li><a href="manage.jsp">管理</a></li>
					<%} %>
					<li><a href="logout.action">注销</a></li>
				</ul> <%}else{ %> <a href="beforelogin.action"> 登录 </a> <%} %>
			</li>
		</ul>
		<p class="navbar-text navbar-right" style="font-family: SimHei;">
			<a href="creat_story.jsp"><span class="glyphicon glyphicon-plus" />添加故事开头</a>
		</p>
	</div>
	</nav>

	<div
		style="position: fixed; left: 0px; top: 50px; width: 100%; height: 100%">
		<img src="pics\back.jpg" width=100% height="100%" />
	</div>

	<div class="container" style="margin-top: 50px;">

		<div class="row ">
			<!--onmouseover="DivShow()" onmouseout="DivHide()" -->

			<div class="col-lg-8 col-lg-offset-2  chptbox">
				<p class="everychpt"><%=parent.getContent() %>
				</p>
				<div class="row">
					<div class="user" id="chptuser">
						<a href="x.jsp"><%=parent.getUserName() %></a> <span><%=Format.sdf.format(new Date(parent.getDate())) %></span>
						<span>点赞数：<%=parent.getZan() %></span>
					</div>

				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-8 col-lg-offset-2" id="newchpt"
				style="padding: 0px 0px 0px 0px;">
				<form action="draft.action">
					<div>
						<!--contenteditable=true-->
						<%if(draft.getContent()==""||draft.getParentId()!=parent.getId()){%>
						<textarea class="form-control" id="newchptcont" name="content"
							resize="none" autoHeight="true"
							style="overflow: hidden; min-height: 150px; border-radius: 0px;">请输入内容...</textarea>
						<%}else{%>
						<textarea class="form-control" id="newchptcont" name="content"
							resize="none" autoHeight="true"
							style="overflow: hidden; min-height: 150px; border-radius: 0px;"><%=draft.getContent() %></textarea>
						<%} %>
					</div>
					<div style="float: right; margin-top: 10px;">
						<!--发布以后跳到一个新的界面上， 前面是他接的故事. 从此它上面的chapter的+号变成蓝色-->
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#publishModal" onclick="Publish()" />
						发布
						</button>
						<!--
					<button class="btn btn-primary" onclick="Confirm()"/>确定内容</button>-->
						<%if(user==null){ %>
						<button type="submit" class="btn btn-primary" data-toggle="modal"
							data-target="#saveModal" />
						存草稿
						</button>
						<%}else{ %>
						<button type="submit" class="btn btn-primary" data-toggle="modal"
							data-target="#saveModal" onclick="SaveDraft()" />
						存草稿
						</button>
						<%} %>


						<!--确认取消返回读文章的页面，取消取消留在本页面上-->
						<button type="button" class="btn btn-default" data-toggle="modal"
							data-target="#myModal" />
						取消
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="modal fade" id="publishModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">添加关键字</h4>
				</div>

				<form action="write.action" onsubmit="return sub()">
					<textarea name="content" hidden="hidden" id="ctt"></textarea>
					<div class="modal-body">
						<input type="text" name="key" class="form-control" id="newchptkey"
							placeholder="用#分割，例：#美人鱼#邓超"
							style="border-radius: 0px; border-top-width: 0px;" />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<!--发布以后跳到一个新的界面上， 前面是他接的故事. 从此它上面的chapter的+号变成蓝色-->


						<button class="btn btn-primary" id="publish" data-toggle="modal"
							data-target="#publishModal" />
						发起
						</button>

					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>


	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">确认放弃文字？</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						onclick="Cancel()">取消</button>

					<input type="button"
						onclick="window.location.href= 'deleteDraft.action' "
						class="btn btn-primary" data-dismiss="modal" value="确认" />
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<div class="modal fade" id="saveModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">保存成功！</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

</body>

<!--这里引用jquery和wangEditor.js-->
<script type="text/javascript">
    var editor = new wangEditor('newchptcont');
	editor.config.menus = [
        'bold',
        'underline',
        'italic',
        'strikethrough',
        'eraser',
        'forecolor',
        'bgcolor',
        '|',
        'quote',
        'fontfamily',
        'fontsize',
        'head',
        'unorderlist',
        'orderlist',
        'alignleft',
        'aligncenter',
        'alignright',
        '|',
        'undo',
        'redo',
        'fullscreen'
     ];
    editor.create();
	$('#publ').click(function () {
        // 获取编辑器区域完整html代码
        var html = editor.$txt.html();
		alert(html);
        // 获取编辑器纯文本内容
        var text = editor.$txt.text();
		alert(text);
        // 获取格式化后的纯文本
        var formatText = editor.$txt.formatText();
		alert(formatText);
    });
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
	
   
   function Publish(){
		window.location.href="#"; 
   }
   
   function SaveDraft(){
		var content = document.getElementById('newchptcont').value;  // 存了文字内容
		var keywords = [];  // 存了三个关键字
		var fda = document.getElementById('newchptkey').value;
		if(fda.indexOf("#")>=0){ // 如果用户输入的内容包含#，#后面的关键字才做关键字处理
			fda = fda.split("#");
			for(var i=0; i<3; i++){
				keywords.push(fda[i+1]);
			}
		}
		else{ //如果用户输入的内容不包含#，则用户输入的文字当作一个标签处理
			keywords[0] = fda;
		}
		
		var ctt=document.getElementById('ctt');
		ctt.value=content;
		
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
	
	function sub(){
		SaveDraft();
		return true;
	}
   
</script>
</html>