<%@ page language="java" contentType="text/html; charset=utf-8"
	import="com.yryj.model.*" import="java.util.*" import="com.yryj.pub.*"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>发起一个故事</title>
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
<body>
	<%
	User user=(User)session.getAttribute("user"); 
	Draft draft=(Draft)session.getAttribute("draft");
	if(draft==null||draft.getParentId()!=-1)
		draft=new Draft();
	ArrayList<ArrayList<Type>> types=(ArrayList<ArrayList<Type>>)session.getAttribute("types");
	%>


	<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="background-color:#ededed; margin:0px 0px 0px 0px;">
		<div class="navbar-header">
			<a class="navbar-brand" href="readStart.action"
				style="font-family: SimHei;">一人一句</a>
		</div>
		<div>
			<ul class="nav navbar-nav navbar-right" style="margin-right: 20px;">
				<li class="dropdown"
					style="margin: 0px 0px 0px 0px; font-family: SimHei;">
					<%if(user!=null){ %> <a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <%=user.getName() %><b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="getInfo.action">个人主页</a></li>
						<%if(user.getName().equals(Format.managerName)){ %>
						<li><a href="manage.jsp">管理</a></li>
						<%} %>
						<li><a href="logout.action">注销</a></li>
					</ul> <%}else{ %> <a href="beforelogin.action"> 登录 </a> <%} %>
				</li>
			</ul>
		</div>
	</nav>

	<div
		style="position: fixed; left: 0px; top: 50px; width: 100%; height: 100%; z-index: -1;">
		<img src="pics\back.jpg" width=100% height="100%" />
	</div>

	<!-- 选大类，二级分类，贴标签。可以存草稿。在发布的时候选择分类 -->
	<div class="container" style="margin-top: 60px;">

		<div class="row">

			<div class="col-lg-8 col-lg-offset-2" id="newchpt"
				style="padding: 0px 0px 0px 0px;">
				<form action="draft.action">
					<div>
						<!--contenteditable=true-->
						<%if(draft.getContent()==""){%>
						<textarea class="form-control" id="newchptcont" name="content"
							resize="none" autoHeight="true"
							style="overflow: hidden; min-height: 150px; border-radius: 0px;">写一个开头...</textarea>
						<%}else{ %>
						<textarea class="form-control" id="newchptcont" name="content"
							resize="none" autoHeight="true"
							style="overflow: hidden; min-height: 150px; border-radius: 0px;"><%=draft.getContent() %></textarea>
						<%} %>
					</div>
					<div style="float: right; margin-top: 10px;">
						<!--
					<button class="btn btn-primary" onclick="Confirm()"/>确定内容</button>-->
						<%if(user==null){ %>
						<button type="submit" class="btn btn-primary" data-toggle="modal"
							data-target="#saveModal" />
						存草稿
						</button>
						<%}else{ %>
						<button type="submit" class="btn btn-primary" data-toggle="modal"
							data-target="#saveModal" onclick="SaveDraft()" "/>
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
	<div class="container" id="addsth" style="margin-top: 10px;">
		<!--点击 确认后  选择分类和标签-->
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2" style="background-color: #fff;">
				<p style="margin-top: 10px; font-family: SimHei;">请选择分类</p>
				<div class="row">
					<%for(int i=0;i<types.get(0).size();i++){ 
					Type a=types.get(0).get(i);
				%>
				<div class="col-lg-2 col-md-2 col-xs-2" ><div class=" <%=i%> root_1l "><p style="display:table-cell; vertical-align:middle;"><%=a.getContent() %></p></div></div>
				<%} %>
				</div>
			</div></a>
			
			<div class="col-lg-8 col-lg-offset-2 2level" style="background-color:#fff;display:none;">
			<p style="margin-top:10px; font-family:SimHei;">请选择二级分类</p>
			
			<div class="row" >
			<%for(int i=0;i<types.get(1).size();i++){ %>
			<div class="col-lg-2 col-md-2 col-xs-2" ><div class=" <%=types.get(0).size()+i %> root_2l " style=""><p style="display:table-cell; vertical-align:middle;"><%=types.get(1).get(i).getContent() %></p></div></div>
			<%} %>	
			</div>
			</a>

			<div class="col-lg-8 col-lg-offset-2 2level"
				style="background-color: #fff; display: none;">
				<p style="margin-top: 10px; font-family: SimHei;">请选择二级分类</p>

				<div class="row">
					<%for(int i=0;i<types.get(1).size();i++){ %>
					<div class="col-lg-2">
						<div class=" <%=types.get(0).size()+i %> root_2l " style="">
							<p style="display: table-cell; vertical-align: middle;"><%=types.get(1).get(i).getContent() %></p>
						</div>
					</div>
					<%} %>
				</div>

			</div>

			<div class="col-lg-8 col-lg-offset-2" style="background-color: #fff;">
				<p style="margin-top: 10px; font-family: SimHei;">添加关键字</p>
				<input type="text" class="form-control" id="newchptkey"
					placeholder="用#分割，例：#美人鱼#邓超" style="margin-bottom: 10px;" />
			</div>
		</div>

		<div class="row">
			<div class="col-lg-8 col-lg-offset-2" id="newchpt"
				style="padding: 0px 0px 0px 0px;">
				<div style="float: right; margin-top: 10px;">
					<!--发布以后跳到一个新的界面上， 前面是他接的故事. 从此它上面的chapter的+号变成蓝色-->
					<form action="write.action?he=1" onsubmit="return Publish()">
						<textarea name="content" hidden="hidden" id="ctt"></textarea>
						<input value="" hidden="hidden" name="format" id="format">
						<input value="" hidden="hidden" name="style" id="style"> <input
							value="" hidden="hidden" name="key" id="key">
						<button type="submit" class="btn btn-primary" id="publish"
							data-toggle="modal" data-target="#publishModal" />
						发起
						</button>
					</form>
				</div>
			</div>
		</div>

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
   //function Confirm(){
	//	var iwrite = document.getElementById("addsth");
	//	addsth.style.display="block";
   //}
   
   function SaveDraft(){
		var content = document.getElementById('newchptcont').value;  // 存了文字内容
		var keywords = [];  // 存关键字
		var fda = document.getElementById('newchptkey').value;
	
		var ctt=document.getElementById('ctt');
		ctt.value=content;
		var key=document.getElementById('key');
		key.value=fda;		
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
<%int num=types.get(0).size(); %>
<%int num2=types.get(1).size(); %>
<script type="text/javascript">
	var l=0;
	var num=<%=num%>;
	var num2=<%=num2%>;
	$(function(){
		
		for(var m=0;m<num;m++){
		$("."+m).click(function(){
			$(".2level").show();
			$(".root_1l").siblings().removeClass("root_1lc");
			for(var j=0;j<num;j++){
				if(i!=j)
					$("."+j).removeClass("root_1lc");
			}
			$(this).addClass("root_1lc");
			$("#format").val($(this).children("p").text());
		});
		}
		
		for(var i=num;i<num+num2;i++){
		$("."+i).click(function(){
			l=1;
			$(".root_2l").siblings().removeClass("root_2lc");
			for(var j=num;j<num+num2;j++){
				if(i!=j)
					$("."+j).removeClass("root_2lc");
			}
			$(this).addClass("root_2lc");
			$("#style").val($(this).children("p").text());
		});
		}
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