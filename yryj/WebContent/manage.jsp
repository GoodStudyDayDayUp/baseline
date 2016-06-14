<%@ page language="java" contentType="text/html; charset=utf-8"
	import="com.yryj.model.*" import="com.yryj.daoImpl.*"
	import="com.yryj.dao.*" import="java.util.*" import="com.yryj.pub.*"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>管理页面</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/Pinyin.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
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
		User user=(User)session.getAttribute("user"); 
		@SuppressWarnings("unchecked")
		List<Activity> activities = (List<Activity>)session.getAttribute("activities");
		@SuppressWarnings("unchecked")
		List<User> allUser = (List<User>) session.getAttribute("allUsers");
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
				<%
					if(user!=null){
				%> <a href="#" class="dropdown-toggle"> <%=user.getName()%><b
					class="caret"></b>
			</a>
				<ul class="dropdown-menu">
					<li><a href="getInfo.action">个人主页</a></li>
					<%
						if(user.getName().equals(Format.managerName)){
					%>
					<li><a href="manage.action">管理</a></li>
					<%
						}
					%>
					<li><a href="logout.action">注销</a></li>
				</ul> <%
 	}else{
 %> <a href="beforelogin.action"> 登录 </a> <%
 	}
 %>
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
				<li class="ma"><a href="#" id="manage_users">管理用户</a></li>
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
						<%
						@SuppressWarnings("unchecked")
						ArrayList<Type> types1 =(ArrayList<Type>)session.getAttribute("types1");
						@SuppressWarnings("unchecked")
						ArrayList<Type> types2 =(ArrayList<Type>)session.getAttribute("types2");
						for(int i=0;i<types1.size();i++) {
						%>
						<div class="col-lg-2 singleClass" id="1_<%=i%>">
							<a href="javascript:;" class="1lClass" style="font-size: 20px;"><%=types1.get(i).getContent()%></a>
						</div>
						<%
							}
						%>
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
						<%
							for(int i=0;i<types2.size();i++) {
						%>
						<div class="col-lg-2 singleClass" id="2_<%=i%>">
							<a href="javascript:;" class="1lClass" style="font-size: 20px;"><%=types2.get(i).getContent()%></a>
						</div>
						<%
							}
						%>
						<div class="col-lg-2 singleClass" id="add2lCategory">
							<a href="javascript:;" id="add2lCategoryFunc"><span
								class="glyphicon glyphicon-plus" style="color: #a4c2f4"></span>
								添加二级分类</a>
						</div>
					</div>
				</div>

			</div>
			<script>
				function checkEmpty() {
					if ($("#newClass").val() == "") {
						alert("输入框不能为空！");
						return false;
					}
					return true;
				}
				// 添加一级分类
				$(document)
						.on(
								"click",
								"#add1lCategoryFunc",
								function() {
									if ($("#newClass").length == 0) {
										$(this)
												.parent()
												.html(
														'<input type="text" style="border-top:none;border-left:none; border-right:none; outline:none;" size="10"  id="newClass" name="newClass" placeholder="新分类"/>'
																+ '<div style="margin-bottom:-10px; margin-top:-15px;">'
																+ '<a href="javascript:;" id="confirm1lCategory"><span class="glyphicon glyphicon-ok-circle" style="font-size:20px;margin-right:20px;"/></a>'
																+ '<a href="javascript:;" id="cancel1lCategory" ><span class="glyphicon glyphicon-remove-circle" style="font-size:20px;margin-top:20px;" /></a></div>');
									} else {
										alert("请先保存当前修改！");
									}
								});

				// 确认新的一级分类信息
				$(document)
						.on(
								"click",
								"#confirm1lCategory",
								function() {

									var numofcategory = $(".singleClass").length;
									var newClassName = $('#newClass').val();
									if (checkEmpty()) {
										if (numofcategory % 5 == 0) {// 添加分类的div新起一行
											$(this)
													.parent()
													.parent()
													.parent()
													.parent()
													.append(
															'<div class="row" style="margin-bottom:15px"><div class="col-lg-2 singleClass" id="add1lCategory">'
																	+ '<a href="javascript:;" id="add1lCategoryFunc" ><span class="glyphicon glyphicon-plus" style="color:#a4c2f4"></span>   添加一级分类</a>'
																	+ '</div></div>');
										} else {// 添加分类的div就跟在后面
											$(this)
													.parent()
													.parent()
													.parent()
													.append(
															'<div class="col-lg-2 singleClass" id="add1lCategory" > '
																	+ '<a href="javascript:;" id="add1lCategoryFunc" ><span class="glyphicon glyphicon-plus" style="color:#a4c2f4"></span>添加一级分类</a></div>');
										}
										$.ajax({
											type : "post",
											url : "addNewClass.action",//WebAjaxForMe.aspx为目标文件，GetValueAjax为目标文件中的方法
											data : {
												"className" : newClassName,
												"mode": 1
											},
											success : function(result) {
												alert("添加成功");//result.d为后台返回的参数'
											}
										})
			<%-- <%if(request.getParameter("className")!=null){
						            	String location = request.getParameter("location");
						             	if(location==null){
											Type type = new Type(); 
									 		type.setContent(request.getParameter("className")); 
									 		type.setMood(1); 
									 		typeDao.save(type);
						             	}
										else{
						            		String[] str = location.split("_");
						            		Type type=typeDao.findByMoodAndIndex((long)1,2);
						            		type.setContent(request.getParameter("className"));
						            		typeDao.update(type);
										}
									}%> --%>
				$(this).parent().parent().html(
												'<a href="javascript:;" class="1lClass" style="font-size:20px;" >'
														+ $("#newClass").val()
														+ '</a>');
									}
								});

				// 取消添加一级分类
				$(document)
						.on(
								"click",
								"#cancel1lCategory",
								function() {
									$(this)
											.parent()
											.parent()
											.html(
													'<a href="javascript:;" ><span class="glyphicon glyphicon-plus" style="color:#a4c2f4"></span>   添加一级分类</a>');
								});

				var oldName = "";
				$("#categoryShow .col-lg-2")
						.hover(
								function() {
									if ($(this).attr("id") != "add1lCategory"&&$(this).attr("id") != "add2lCategory") {
										if ($("#newClass").length == 0) {
											$(this)
													.append(
															'<div id="div_'+$(this).attr("id")+'" style="z-index:1;background-color:#666666;position:absolute;top:0px;bottom:0px;left:0px;right:0px;display:block;padding-top:20px;"><a href="javascript:;" id="modifyClass"><b>修改名称</b></a></div>');
											oldName = $(this).children(
													".1lClass").text();
										}
									}
								},
								function() {
									if ($(this).attr("id") != "add1lCategory"&&$(this).attr("id") != "add2lCategory") {
										if ($("#newClass").length == 0) {
											var d = document
													.getElementById("div_"+$(this).attr("id"));
											d.remove();
										}
									}
								});
				$(document)
						.on(
								"click",
								"#modifyClass",
								function() { //修改名称
									
									if ($("#newClass").length == 0) {

										$(this)
												.parent()
												.parent()
												.html(
														'<input type="text" style="border-top:none;border-left:none; border-right:none; outline:none;"  size="10" id="newClass" placeholder="新名字"/>'
																+ '<div style="margin-bottom:-10px; margin-top:-15px;">'
																+ '<a href="javascript:;" id="confirmMod"><span class="glyphicon glyphicon-ok-circle" style="font-size:20px;margin-right:20px;"/></a>'
																+ '<a href="javascript:;" id="cancelMod"><span class="glyphicon glyphicon-remove-circle" style="font-size:20px;margin-top:20px;"/></a></div>');
									} else {
										alert("请先保存当前修改！");
									}
								});

				$(document).on(
						"click",
						"#confirmMod",
						
						function() {
							var location = $(this).parent().parent().attr("id");
							var newClassName = $('#newClass').val();
							if (checkEmpty()) {
								$(this).parent().parent()
										.html(
												'<a href="javascript:;" class="1lClass" style="font-size:20px;" >'
														+ $("#newClass").val()
														+ '</a>');
							}
							$.ajax({
								type : "post",
								url : "updateClass.action",//WebAjaxForMe.aspx为目标文件，GetValueAjax为目标文件中的方法
								data : {
									"className" : newClassName,
									"location" : location
								},
								success : function(result) {
									alert("修改成功");//result.d为后台返回的参数
								}
							})

						});
				$(document).on(
						"click",
						"#cancelMod",
						function() {
							$(this).parent().parent().html(
									'<a href="javascript:;" class="1lClass" style="font-size:20px;" >'
											+ oldName + '</a>');
						});
				// 添加二级分类
				$(document)
						.on(
								"click",
								"#add2lCategoryFunc",
								function() {
									if ($("#newClass").length == 0) {
										$(this)
												.parent()
												.html(
														'<input type="text" style="border-top:none;border-left:none; border-right:none; outline:none;" size="10"  id="newClass" name="newClass" placeholder="新分类"/>'
																+ '<div style="margin-bottom:-10px; margin-top:-15px;">'
																+ '<a href="javascript:;" id="confirm2lCategory"><span class="glyphicon glyphicon-ok-circle" style="font-size:20px;margin-right:20px;"/></a>'
																+ '<a href="javascript:;" id="cancel2lCategory" ><span class="glyphicon glyphicon-remove-circle" style="font-size:20px;margin-top:20px;" /></a></div>');
									} else {
										alert("请先保存当前修改！");
									}
								});

				// 确认新的二级分类信息
				$(document)
						.on(
								"click",
								"#confirm2lCategory",
								function() {

									var numofcategory = $(".singleClass").length;
									var newClassName = $('#newClass').val();
									if (checkEmpty()) {
										if (numofcategory % 5 == 0) {// 添加分类的div新起一行
											$(this)
													.parent()
													.parent()
													.parent()
													.parent()
													.append(
															'<div class="row" style="margin-bottom:15px"><div class="col-lg-2 singleClass" id="add1lCategory">'
																	+ '<a href="javascript:;" id="add2lCategoryFunc" ><span class="glyphicon glyphicon-plus" style="color:#a4c2f4"></span>   添加二级分类</a>'
																	+ '</div></div>');
										} else {// 添加分类的div就跟在后面
											$(this)
													.parent()
													.parent()
													.parent()
													.append(
															'<div class="col-lg-2 singleClass" id="add2lCategory" > '
																	+ '<a href="javascript:;" id="add2lCategoryFunc" ><span class="glyphicon glyphicon-plus" style="color:#a4c2f4"></span>添加二级分类</a></div>');
										}
										$.ajax({
											type : "post",
											url : "addNewClass.action",//WebAjaxForMe.aspx为目标文件，GetValueAjax为目标文件中的方法
											data : {
												"className" : newClassName,
												"mode": 2
											},
											success : function(result) {
												alert("添加成功");//result.d为后台返回的参数'
											}
										})
		
				$(this).parent().parent().html(
												'<a href="javascript:;" class="1lClass" style="font-size:20px;" >'
														+ $("#newClass").val()
														+ '</a>');
									}
								});

				// 取消添加二级分类
				$(document)
						.on(
								"click",
								"#cancel2lCategory",
								function() {
									$(this)
											.parent()
											.parent()
											.html(
													'<a href="javascript:;" ><span class="glyphicon glyphicon-plus" style="color:#a4c2f4"></span>   添加二级分类</a>');
								});

				var oldName = "";
			</script>


			<div id="activityShow" style="display: none">
				<button class="btn btn-primary" id="addActivity">添加活动</button>
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
					<% for(int i=0;i<activities.size();i++){
					Activity activity = activities.get(i);
					%>
						<tr>
							<td><p id="id" ><%=activity.getId() %></p></td>
							<td><p id="name"><%=activity.getName() %></p></td>
							<td><a href="<%=activity.getPic() %>"><%=activity.getPic() %></a></td>
							<td><p><%=activity.getOwner() %></p></td>
							<td><a href="<%=activity.getUrl() %>" name="urlpath"><%=activity.getUrl() %></a></td>
							<%if (activity.getState()==1){%>
								<td><p id="status">进行中</p></td>
							<%}else {%>
								<td><p id="status">已关闭</p></td>
								<%} %>
							<td><button class="btn btn-sm btn-primary edit">编辑
								</button>
							<%if (activity.getState()==1){%>
								<button class="btn btn-sm btn-danger delete">关闭</button></td>
							<%}else {%>
								<button class="btn btn-sm btn-danger delete">开放</button></td>
								
								<% } %>
								
						</tr>
					<%} %>
					</tbody>
				</table>
			</div>
			<div id="manage_users_show" style="display: none">
				<div class="form-group pull-right">
					<input type="text" class="search form-control" placeholder="搜索" />
				</div>
				<span class="counter pull-right"></span>
				<form id="defaultForm" method="post">
					<table class="table table-hover table-bordered results">
						<thead>
							<tr>
								<th>ID</th>
								<th>用户名</th>
								<th scope="col">邮箱</th>
								<th>手机号码</th>
								<th>管理操作</th>
							</tr>
							<tr class="warning no-result">
								<td colspan="6"><i class="fa fa-warning"></i> No result</td>
							</tr>
						</thead>
						<tbody>
						<% for(int i=0;i<allUser.size();i++){
							User oneUser = allUser.get(i);
						%>
							<tr>
								<th><p id="m_id"><%=oneUser.getId() %></p></th>
								<td><p id="m_name"><%=oneUser.getName() %></p></td>
								<td><p id="m_mail"><%=oneUser.getEmail() %></p></td>
								<td><p id="m_phone"><%=oneUser.getPhone() %></p></td>
								<td><button class="btn btn-sm btn-primary m_edit">编辑
									</button>
									<button class="btn btn-sm btn-danger m_delete">删除</button></td>
							</tr>
							<%} %>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script>
		var userlog = "";
		$(document).on("click", ".m_delete", function() { //删除当前用户
			$(this).parent().parent().remove();
			var id = $(this).parent().parent().find('th')
			.text();
			$.ajax({
				type : "post",
				url : "deleteUserMg.action",//WebAjaxForMe.aspx为目标文件，GetValueAjax为目标文件中的方法
				data : {
					"id" : id
				},
				success : function(result) {
					alert("修改成功");//result.d为后台返回的参数
				}
			})
		});

		$(document)
				.on(
						"click",
						".m_edit",
						function() {
							if ($("table tbody tr").hasClass("addtr")) {
								alert("先完成修改！！！");
							} else {
								$(this).parent().parent().addClass("addtr");
								userlog = $(this).parent().parent().html();
								var id = $(this).parent().parent().find('th')
										.text();
								var name = $(this).parent().parent().find('td')
										.eq(0).text();
								var mail = $(this).parent().parent().find('td')
										.eq(1).text();
								var phone = $(this).parent().parent()
										.find('td').eq(2).text();
								var status = $(this).parent().parent().find(
										'td').eq(3).text();
								$.ajax({
									type : "post",
									url : "updateUserMg.action",//WebAjaxForMe.aspx为目标文件，GetValueAjax为目标文件中的方法
									data : {
										"name" : name,
										"email" : mail,
										"phone" : phone,
										"id" : id
									},
									success : function(result) {
										alert("修改成功");//result.d为后台返回的参数
									}
								})
								var n = '';
								n += '<th><p id="m_id">' + id + '</p></th>';
								n += '<td><div class="form-group"><input type="text" class="form-control mm_username" name="username" value="'+name+'" /><div style="color:#c00; font-size:8px;"><p class="name_w wrong_info" style="display:none;">格式不正确<p/><p class="name_b wrong_info" style="display:none;">不能为空<p/></div></div></td>';
								n += '<td><div class="form-group"><input type="text" class="form-control mm_mail" name="mail" value="'+mail+'" /><div style="color:#c00; font-size:8px;"><p class="mail_w wrong_info" style="display:none;">格式不正确<p/><p class="mail_b wrong_info" style="display:none;">不能为空<p/></div></div></td>';
								n += '<td><div class="form-group"><input type="text" class="form-control mm_phone" name="phone" value="'+phone+'" /><div style="color:#c00; font-size:8px;"><p class="phone_w wrong_info" style="display:none;">格式不正确<p/></div></div></td>';
								n += ' <td>';
								n += '  <button class="btn save_user btn-primary btn-sm">保存</button>';
								n += '  <button class="btn end_user btn-info btn-sm">取消</button>';
								n += ' </td>';
								$(this).parent().parent().html(n);
							}
						});

		$("tbody tr").on("keyup", "td div input", function() { //jQuery 使用on绑定动态生成的元素时，不能直接用该对象操作，而是选择其非动态生成的父节点然后再找到本身才能达到效果。
			// 每一次点击判断正误  错误就显示错误信息并禁用按钮
			var name = $('input[name="username"]').val();
			var mail = $('input[name="mail"]').val();
			var phone = $('input[name="phone"]').val();
			if (name.length == 0) {
				$(".name_b").show();
			} else if (mail.length == 0) {
				$(".mail_b").show();
			} else {
				$(".name_b").hide();
				$(".mail_b").hide();
			}
				if ($(".wrong_info").is(":visible")) {
				$(".save_user").attr("disabled", "disabled");
			} else {
				$(".save_user").removeAttr("disabled");
			}
		});


		$(document)
				.on(
						"click",
						".save_user",
						function() { // 保存用户信息

							var id = $(this).parent().parent().find('p#m_id')
									.text();
							var name = $(this).parent().parent().find(
									'input[name="username"]').val();
							var mail = $('input[name="mail"]').val();
							var phone = $('input[name="phone"]').val();
							$.ajax({
								type : "post",
								url : "updateUserMg.action",//WebAjaxForMe.aspx为目标文件，GetValueAjax为目标文件中的方法
								data : {
									"name" : name,
									"email" : mail,
									"phone" : phone,
									"id" : id
								},
								success : function(result) {
									alert("修改成功");//result.d为后台返回的参数
								}
							})
							var n = "";
							n += '<th><p id="m_id">' + id + '</p></th>';
							n += ' <td><p id="m_name">' + name + '</p></td>';
							n += ' <td><p id="m_mail">' + mail + '</p></td>';
							n += ' <td><p id="m_phone">' + phone + '</p></td>';
							n += ' <td>';
							n += '  <button class="btn m_edit btn-primary btn-sm m_edit">编辑</button>';
							n += '  <button class="btn m_delete btn-danger btn-sm m_delete">删除</button>';
							n += ' </td>';
							$(this).parent().parent().removeClass();
							$(this).parent().parent().html(n);
						});

		$(document).on("click", ".end_user", function() { // 取消修改
			$(this).parent().parent().removeClass();
			$(this).parent().parent().html(userlog);
		})
	</script>
	<script>
		// -------------------------------------------------------------以下是管理活动的方法---------------------------------------------------------//		
		var backlog = "";
		//增加
		$("#addActivity")
				.click(
						function() {
							var num  = $("#myTable tr").length;
							var next = num-1;
							if ($("table tbody tr").hasClass("addtr")) {
								alert("先完成操作！！！");
							} else {
								$("#myTable tr:first")
										.after(
												' <tr class="addtr"><td><p id="id">'
														+ next
														+ '</p></td>'
														+ '<td><input type="text" name="name" value="" size="10px" /></td>'
														+ '<td><input type="file" accept="image/jpeg" style="display:none;" onchange="input1.value=this.value" id="file"/>'
														+ '<input type="text" id="input1"><input type="button"  class="btn btn-sm btn-primary" value="上传图片" onclick="file.click()" '
														+ '</td>'
														+ ' <td><input type="text" name="host" value="" size="10px"/></td>'
														+ '<td><input type="url" name="urlpath" value="" size="20px"/></td>'
														+ '<td><p id="status">进行中</p></td>'
														+ '<td> <button class="btn save btn-sm btn-primary">保存</button><button class="btn off btn-info btn-sm">取消</button> </td>'
														+ ' </tr>');
							}
						})

		//保存
		$(document)
				.on(
						"click",
						".save",
						function() {
							var id = $(this).parent().parent().find('p#id')
									.text();
							var name = $(this).parent().parent().find(
									'input[name="name"]').val();
							var host = $('input[name="host"]').val();
							var url = $('input[name="urlpath"]').val();
							var status = $(this).parent().parent().find(
									'p#status').text();
							var imgpath = $('input[id="input1"]').val();
							$.ajax({
								type : "post",
								url : "updateActivity.action",//WebAjaxForMe.aspx为目标文件，GetValueAjax为目标文件中的方法
								data : {
									"id" : id,
									"name" : name,
									"pic" : imgpath,
									"host" : host,
									"url" : url
								},
								success : function(result) {
									alert("修改成功");//result.d为后台返回的参数
								}
							})
							var n = "";
							n += '<td><p id="id">' + id + '</p></td>';
							n += ' <td>' + name + '</td>';
							n += '  <td><a href="'+imgpath+'">' + imgpath + '</a></td>';
							n += ' <td>' + host + '</td>';
							n += ' <td><a href="'+url+'">' + url + '</a></td>';
							n += ' <td><p id="status">' + status + '</p></td>';
							n += ' <td>';
							n += '  <button class="btn edit btn-primary btn-sm">编辑</button>';
							n += '  <button class="btn delete btn-danger btn-sm">关闭</button>';
							n += ' </td>';
						
							$(this).parent().parent().removeClass("addtr");
							$(this).parent().parent().html(n);
						})

		//编辑
		$(document)
				.on(
						"click",
						".edit",
						function() {
							if ($("table tbody tr").hasClass("addtr")) {
								alert("先完成操作！！！");
							} else {
								var old = $(this).parent().parent();
								backlog = old.html();
								var id = $(this).parent().parent().find('td')
										.eq(0).text();
								var name = $(this).parent().parent().find('td')
										.eq(1).text();
								var img = $(this).parent().parent().find('td')
										.eq(2).text();
								var host = $(this).parent().parent().find('td')
										.eq(3).text();
								var url = $(this).parent().parent().find('td')
										.eq(4).text();
								var status = $(this).parent().parent().find(
										'td').eq(5).text();

								var n = "";
								n += '<td><p id="id">' + id + '</p></td>';
								
								n += '<td><input type="text" name="name" value="'+name+'" /></td>';
								n += ' </form> ';
								n += ' <td><input type="file" accept="image/jpeg" style="display:none;" onchange="input1.value=this.value" id="file"/>'
										+ '<input type="text" name ="pic" id="input1" value="'+img+'"/><input type="button" class="btn btn-sm btn-primary" value="上传图片" onclick="file.click()" '
										+ '</td>';
								n += '  <td><input type="text" name="host" value="'+host+'" /></td>';
								n += '  <td><input type="url" name="urlpath" value="'+url+'" /></td>';
								n += '<td><p id="status">' + status
										+ '</p></td>';
								n += ' <td>';
								n += '  <button class="btn save btn-primary btn-sm">保存 </button>';
								n += '  <button class="btn end btn-info btn-sm">取消</button>';
								n += ' </td> ';
								$(this).parent().parent().addClass("addtr");
								$(this).parent().parent().html(n);
							}
						})

		// 关闭，修改状态
		$(document).on("click", ".delete", function() {
			//alert(backlog);
			var $status = $(this).parent().parent().find('td').eq(5);
			var id = $(this).parent().parent().find('td')
			.eq(0).text();
			var status_code = 1;
			if ($status.text() == "进行中") {
				$status.text("已关闭");
				status_code=0;
				$(this).text("开放");
			} else {
				status_code=1;
				$status.text("进行中");
				$(this).text("关闭");
			}
			$.ajax({
				type : "post",
				url : "updateActivity.action",//WebAjaxForMe.aspx为目标文件，GetValueAjax为目标文件中的方法
				data : {
					"id" : id,
					"status" : status_code
				},
				success : function(result) {
				}
			})
		})

		$(document).on("click", ".off", function() { //删除当前行
			$(this).parent().parent().remove();
		})

		$(document).on("click", ".end", function() {
			$(this).parent().parent().html(backlog);
			$("table tbody tr").removeClass("addtr");
		})

		$("#activity").on("click",function(){
			$("#activityShow").show();//显示
			$("#categoryShow").hide();
			$("#manage_users_show").hide();
			}); 
			$("#category").on("click",function(){
			$("#activityShow").hide();
			$("#categoryShow").show();
			$("#manage_users_show").hide();
			}); 
			$("#manage_users").on("click",function(){
			$("#activityShow").hide();
			$("#categoryShow").hide();
			$("#manage_users_show").show();
			}); 
		$(function() {
			$(".ma").click(function() {
				$(this).addClass("active");
				$(this).siblings().removeClass("active");
			});
		});
	</script>
</body>

</html>