<%@ page language="java" contentType="text/html; charset=utf-8"
	import="com.yryj.model.*" import="com.yryj.daoImpl.*"
	import="com.yryj.dao.*" import="java.util.*" import="com.yryj.pub.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>管理页面</title>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="css/bootstrap.css" />
		<link rel="stylesheet" href="css/style.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.js"></script>
		<script src="js/Pinyin.js"></script>
		<script type="text/javascript">
        $(document).ready(function () {
            $('.dropdown-toggle').dropdown();
        });
		</script>
		<style>
a:link {
	text-decoration: none;
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

td {
	display: middle;
}

#category ul {
	list-style: none;
}

#category li {
	float: left;
}

#shade a:link {
	color: white;
}

#shade a:link {
	color: #d9d9d9;
}

.singleClass {
	text-align: center;
	position: relative;
	height: 64px;
	padding: 10px 0;
	margin-left: 15px;
	margin-right: 15px;
	-webkit-border-radius: 0px;
	-moz-border-radius: 0px;
	border-radius: 0px;
	-webkit-box-shadow: #666 0px 0px 3px;
	-moz-box-shadow: #666 0px 0px 3px;
	box-shadow: #666 0px 0px 3px;
	background: #ffffff;
	behavior: url(/PIE.htc);
}
</style>
</head>
<body>

	<%
	TypeDao typeDao = new TypeDL();
	User user=(User)session.getAttribute("user"); 
	ArrayList<ArrayList<Type>> types=(ArrayList<ArrayList<Type>>)session.getAttribute("types");
	ArrayList<Type> types1 = (ArrayList<Type>)typeDao.getClassByMood(1);
	ArrayList<Type> types2 = (ArrayList<Type>)typeDao.getClassByMood(2);
	if(types==null){
		types=new ArrayList<ArrayList<Type>>();
	}
	%>
	<nav class="navbar navbar-default" role="navigation"
		style=" margin:0px 0px 0px 0px;">
	<div class="navbar-header">
		<a class="navbar-brand" href="main.jsp" style="font-family: SimHei;">一人一句</a>
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
					<% } %>
					<li><a href="logout.action">注销</a></li>
				</ul> <%}else{ %> <a href="beforelogin.action"> 登录 </a> <%} %>
			</li>
		</ul>
		<p class="navbar-text navbar-right" style="font-family: SimHei;">
			<a href="creat_story.jsp"><span class="glyphicon glyphicon-plus" />添加故事</a>
		</p>
	</div>
	</nav>

	<div class="container">
		<div class="col-lg-2" style="margin-top: 20px;">
			<ul class="nav nav-pills nav-stacked">
				<li class="active ma"><a href="#" id="category">管理分类</a></li>
				<li class="ma"><a href="#" id="activity">管理活动</a></li>
			</ul>
		</div>

		<div class="col-lg-10" style="margin-top: 20px;">
			<!--一级分类，二级分类-->
			<div id="categoryShow">
				<div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">一级分类</h3>
						</div>
					</div>
					<div class="row" style="margin-bottom: 15px">
						<% %>
						<% for(int i=0;i<types1.size();i++) { %>
						<div class="col-lg-2 singleClass" id="1_<%=i%>">
							<a href="javascript:;" class="1lClass" style="font-size: 20px;"><%=types1.get(i).getContent() %></a>
						</div>
						<% } %>
						<div class="col-lg-2 singleClass" id="add1lCategory">
							<a href="javascript:;" id="add1lCategoryFunc"><span
								class="glyphicon glyphicon-plus" style="color: #a4c2f4"></span>
								添加一级分类</a>
						</div>
					</div>
				</div>

				<div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">二级分类</h3>
						</div>
					</div>
					<div class="row" style="margin-bottom: 15px">
						<% for(int i=0;i<types2.size();i++) { %>
						<div class="col-lg-2 singleClass" id="2_<%=i %>">
							<a href="javascript:;" class="1lClass" style="font-size: 20px;"><%=types2.get(i).getContent() %></a>
						</div>
						<%} %>
						<div class="col-lg-2 singleClass" id="add2lCategory">
							<a href="javascript:;" id="add1lCategoryFunc"><span
								class="glyphicon glyphicon-plus" style="color: #a4c2f4"></span>
								添加二级分类</a>
						</div>
					</div>
				</div>

			</div>
			<script>
		function checkEmpty(){
			if($("#newClass").val()==""){
				alert("输入框不能为空！");
				return false;
			}
			return true;
		}
					// 添加一级分类
						$(document).on("click","#add1lCategoryFunc",function(){
									if($("#newClass").length==0){
									$(this).parent().html('<input type="text" style="border-top:none;border-left:none; border-right:none; outline:none;" size="10"  id="newClass" name="newClass" placeholder="新分类"/>'+
										'<div style="margin-bottom:-10px; margin-top:-15px;">'+ 
										'<a href="javascript:;" id="confirm1lCategory"><span class="glyphicon glyphicon-ok-circle" style="font-size:20px;margin-right:20px;"/></a>'+
										'<a href="javascript:;" id="cancel1lCategory" ><span class="glyphicon glyphicon-remove-circle" style="font-size:20px;margin-top:20px;" /></a></div>');
									}
									else{alert("请先保存当前修改！");}
									});
								
								// 确认新的一级分类信息
		$(document).on("click","#confirm1lCategory",function(){

									var numofcategory = $(".singleClass").length;
									var newClassName = $('#newClass').val();
									if(checkEmpty()){
									if(numofcategory%5==0) {// 添加分类的div新起一行
										$(this).parent().parent().parent().parent().append('<div class="row" style="margin-bottom:15px"><div class="col-lg-2 singleClass" id="add1lCategory">'+ 
										'<a href="javascript:;" id="add1lCategoryFunc" ><span class="glyphicon glyphicon-plus" style="color:#a4c2f4"></span>   添加一级分类</a>'+
										'</div></div>');
									}
									else{// 添加分类的div就跟在后面
										$(this).parent().parent().parent().append('<div class="col-lg-2 singleClass" id="add1lCategory" > '+					
										'<a href="javascript:;" id="add1lCategoryFunc" ><span class="glyphicon glyphicon-plus" style="color:#a4c2f4"></span>添加一级分类</a></div>');
									}
									  $.ajax({
						                    type: "get",
						                    url: "manage.jsp",//WebAjaxForMe.aspx为目标文件，GetValueAjax为目标文件中的方法
						                    data: {"className": newClassName,
						                    	"location":location},
						                    success: function (result) {
						                        alert("添加成功");//result.d为后台返回的参数
						                    }})
						            <% if(request.getParameter("className")!=null){
						            	String location = request.getParameter("location");
						             	if(location=="add1lCategory"){
											Type type = new Type(); 
									 		type.setContent(request.getParameter("className")); 
									 		type.setMood(1); 
									 		typeDao.save(type);
						             	}
										else if(location!=null){
						            		String[] str = location.split("_");
						            		Type type=typeDao.findByMoodAndIndex((long)1,Integer.parseInt(str[1]));
						            		type.setContent(request.getParameter("className"));
						            		typeDao.update(type);
										}
									}%>
									$(this).parent().parent().html('<a href="javascript:;" class="1lClass" style="font-size:20px;" >'+$("#newClass").val()+'</a>');
									}
							});
								
								// 取消添加一级分类
		$(document).on("click","#cancel1lCategory",function(){
									$(this).parent().parent().html('<a href="javascript:;" ><span class="glyphicon glyphicon-plus" style="color:#a4c2f4"></span>   添加一级分类</a>');	
								});

					
					
						var oldName = "";
						$("#categoryShow .col-lg-2").hover(function() {
							if($(this).attr("id") != "add1lCategory"){
							if($("#newClass").length==0){
								$(this).append('<div id="shade" style="z-index:1;background-color:#666666;position:absolute;top:0px;bottom:0px;left:0px;right:0px;display:block;padding-top:20px;"><a href="javascript:;" id="modifyClass"><b>修改名称</b></a></div>');
								oldName = $(this).children(".1lClass").text();
							}}
						},function(){
						if($(this).attr("id") != "add1lCategory"){
							if($("#newClass").length==0){
							var d = document.getElementById("shade");
							d.remove();}}
						});
						$(document).on("click","#modifyClass",function(){ //修改名称
							var location = $(this).attr("id");
							if($("#newClass").length==0){
								
								$(this).parent().parent().html('<input type="text" style="border-top:none;border-left:none; border-right:none; outline:none;"  size="10" id="newClass" placeholder="新名字"/>'+
								'<div style="margin-bottom:-10px; margin-top:-15px;">'+
								'<a href="javascript:;" id="confirmMod"><span class="glyphicon glyphicon-ok-circle" style="font-size:20px;margin-right:20px;"/></a>'+
								'<a href="javascript:;" id="cancelMod"><span class="glyphicon glyphicon-remove-circle" style="font-size:20px;margin-top:20px;"/></a></div>');
							}
							else{alert("请先保存当前修改！");}
						});
						
						$(document).on("click","#confirmMod",function(){
							
							var newClassName = $('#newClass').val();
							if(checkEmpty()){
								$(this).parent().parent().html('<a href="javascript:;" class="1lClass" style="font-size:20px;" >'+$("#newClass").val()+'</a>');
							}
							$.ajax({
			                    type: "get",
			                    url: "manage.jsp",//WebAjaxForMe.aspx为目标文件，GetValueAjax为目标文件中的方法
			                    data: {"className": newClassName,
			                    	"location":location},
			                    success: function (result) {
			                        alert("修改成功");//result.d为后台返回的参数
			                    }})
							
						});
						$(document).on("click","#cancelMod",function(){
							$(this).parent().parent().html('<a href="javascript:;" class="1lClass" style="font-size:20px;" >'+oldName+'</a>');
						});
					</script>


			<div id="activityShow" style="display: none">
				<button class="btn btn-primary" data-toggle="button"
					id="addActivity">添加活动</button>
				<!--序号，名称(变文本框)，图片（加上传图片按钮），链接（变文本框），主办方（变文本框），时间（时间选择器）-->
				<table class="table table-bordered" id="myTable" style="">
					<thead>
						<tr>
							<th>序号</th>
							<th>名称</th>
							<th>图片</th>
							<th>主办方</th>
							<th>链接</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><p id="id">2</p></td>
							<td><p id="name" value="1">暴走大事件接龙</p></td>
							<td><a href="pics/main_pic2.jpeg" value="1">baozou.jpg</a></td>
							<td><p value="1">暴走漫画</p></td>
							<td><a href="http://www.qxnic.com" name="urlpath">www.qxnic.com</a></td>
							<td><p id="status">进行中</p></td>
							<td><button class="btn btn-sm btn-primary edit">编辑
								</button>
								<button class="btn btn-sm btn-danger delete">关闭</button></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script>							
		// -------------------------------------------------------------以下是管理活动的方法---------------------------------------------------------//		
		var backlog = "";
			  //增加
		  $("#addActivity").click(function(){
			var num = document.getElementById("myTable").rows[1].cells;
			 var next =  parseInt($(num[0]).text()) +1 ;
			if($("table tbody tr").hasClass("addtr")){
			alert("先完成操作！！！");
			}else{
		     $("#myTable tr:first").after(' <tr class="addtr"><td><p id="id">'+ next +'</p></td>'+
			 '<td><input type="text" name="name" value="" size="10px" /></td>'+
			 '<td><input type="file" accept="image/jpeg" style="display:none;" onchange="input1.value=this.value" id="file"/>'+
				'<input type="text" id="input1"><input type="button"  class="btn btn-sm btn-primary" value="上传图片" onclick="file.click()" '+		
				'</td>' +
			 ' <td><input type="text" name="host" value="" size="10px"/></td>' + 
			 '<td><input type="url" name="urlpath" value="" size="20px"/></td>'+
			 '<td><p id="status">进行中</p></td>'+ 
			 '<td> <button class="btn save btn-sm btn-primary">保存</button><button class="btn off btn-info btn-sm">取消</button> </td>'+' </tr>');
		    } 
		  })
		  
		  //保存
		  $(document).on("click",".save",function(){
			var id = $(this).parent().parent().find('p#id').text();
		   var name =$(this).parent().parent().find('input[name="name"]').val();
		   var host =$('input[name="host"]').val();
		   var url =$('input[name="urlpath"]').val();
		   var status =$(this).parent().parent().find('p#status').text();
		   var imgpath = $('input[id="input1"]').val();
			var img = imgpath.substring( imgpath.lastIndexOf('\\')+1 );
		      var n="";
		      n+='<td><p id="id">'+id+'</p></td>';
		        n+=' <td>'+name+'</td>';
		       n+='  <td><a href="'+img+'">'+ img +'</a></td>';
			   n+=' <td>'+host+'</td>';
			   n+=' <td><a href="'+url+'">'+ url +'</a></td>';
			   n+=' <td><p id="status">'+status+'</p></td>';
				n+=' <td>';
				n+='  <button class="btn edit btn-primary btn-sm">编辑</button>';
				n+='  <button class="btn delete btn-danger btn-sm">关闭</button>';
				n+=' </td>';		
				$(this).parent().parent().removeClass("addtr");
		      $(this).parent().parent().html(n);
		  })
		  
		   //编辑
		  $(document).on("click",".edit",function(){
		  if($("table tbody tr").hasClass("addtr")){
			alert("先完成操作！！！");
			}else{
			var old = $(this).parent().parent();
			backlog = old.html();
			var id=$(this).parent().parent().find('td').eq(0).text();
		   var name =$(this).parent().parent().find('td').eq(1).text();
		   var img =$(this).parent().parent().find('td').eq(2).text();
		   var host =$(this).parent().parent().find('td').eq(3).text();
		   var url =$(this).parent().parent().find('td').eq(4).text();
		   var status = $(this).parent().parent().find('td').eq(5).text();
		   
		    var n="";
				n+='<td><p id="id">'+id+'</p></td>';
		      n+='<td><input type="text" name="name" value="'+name+'" /></td>';
		        n+=' <td><input type="file" accept="image/jpeg" style="display:none;" onchange="input1.value=this.value" id="file"/>'+
				'<input type="text" id="input1" value="'+img+'"/><input type="button" class="btn btn-sm btn-primary" value="上传图片" onclick="file.click()" '+		
				'</td>';
		       n+='  <td><input type="text" name="host" value="'+host+'" /></td>';
				n+='  <td><input type="url" name="urlpath" value="'+url+'" /></td>';
				n+='<td><p id="status">'+status+'</p></td>';
				n+=' <td>';
				n+='  <button class="btn save btn-primary btn-sm">保存</button>';
				n+='  <button class="btn end btn-info btn-sm">取消</button>';
				n+=' </td>';
		       $(this).parent().parent().addClass("addtr");
		      $(this).parent().parent().html(n);
			  }
		  })
		  
		  // 关闭，修改状态
		  $(document).on("click",".delete",function(){
			//alert(backlog);
				var $status=$(this).parent().parent().find('td').eq(5);
				if($status.text()=="进行中"){		
				$status.text("已关闭");
				$(this).text("开放");
				}
				else{
				$status.text("进行中");
				$(this).text("关闭");
				}
		  })
		  
		  $(document).on("click",".off",function(){ //删除当前行
		  $(this).parent().parent().remove();
		  })
		  

		  $(document).on("click",".end",function(){ 
		  alert(backlog);
		   $(this).parent().parent().html(backlog);
		  })
		  
		$("#activity").on("click",function(){
		$("#activityShow").show();//显示
		$("#categoryShow").hide();
		}); 
		$("#category").on("click",function(){
		$("#activityShow").hide();
		$("#categoryShow").show();
		}); 
		$(function(){
				$(".ma").click(function(){
					$(this).addClass("active");
					$(this).siblings().removeClass("active");
				});
			});
		 </script>
</html>