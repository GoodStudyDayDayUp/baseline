<%@ page language="java" contentType="text/html; charset=utf-8"
	import="com.yryj.model.User" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>注册</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrapValidator.min.css" />
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/bootstrapValidator.min.js"></script>
<script src="js/bootstrapValidator_zh_CN.js"></script>
</head>
<%
	User webUser=(User)session.getAttribute("webreguser");
if(webUser==null){
	webUser=new User();
}
	String msg=(String)session.getAttribute("regmsg");
	if(msg==null)
		msg=" ";
	String pass2=(String)session.getAttribute("webpass2");
	%>
<body style="background-color: #EDEDED">
	<div class="container">
		<div class="row">

			<p style="text-align: center; margin: auto"><a href="readStart.action"><img src="pics\logopic.png" /></a></p>

			<section>
				<div class="col-lg-6 col-lg-offset-3" style="margin-top: -50px">
					<form id="defaultForm" method="post" action="register.action">

						<div class="row">
							<div class="col-lg-8 col-lg-offset-2 col-md-4 col-md-offset-4  col-sm-6 col-sm-offset-3 col-xs-6 col-xs-offset-3 "> 
								<div class="form-group row" >
									<%if(webUser.getName()!=null&&webUser.getName()!="") {%>
									<input type="text" id="name" name="name"
										onchange="changemsg(this)" value=<%=webUser.getName() %>
										class="form-control col-lg-5" />
									<%}else{ %>
									<input type="text" id="name" name="name"
										onchange="changemsg(this)" class="form-control col-lg-5"
										placeholder="用户名" />
									<%} %>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-lg-8 col-lg-offset-2 col-md-4 col-md-offset-4  col-sm-6 col-sm-offset-3 col-xs-6 col-xs-offset-3 "> 
								<div class="form-group row" >
									<%if(webUser.getEmail()!=null&&webUser.getEmail()!="") {%>
									<input type="text" id="email" name="email"
										onchange="changemsg(this)" value=<%=webUser.getEmail() %>
										class="form-control col-lg-5" placeholder="邮箱" />
									<%}else{ %>
									<input type="text" id="email" name="email"
										onchange="changemsg(this)" class="form-control col-lg-5"
										placeholder="邮箱" />
									<%} %>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-lg-8 col-lg-offset-2 col-md-4 col-md-offset-4  col-sm-6 col-sm-offset-3 col-xs-6 col-xs-offset-3 "> 
								<div class="form-group row" >
									<%if(webUser.getPassword()!=null&&webUser.getPassword()!="") {%>
									<input type="password" id="password" name="password"
										onchange="changemsg(this)" value=<%=pass2 %>
										class="form-control" placeholder="密码" />
									<%}else{ %>
									<input type="password" id="password" name="password"
										onchange="changemsg(this)" class="form-control"
										placeholder="密码" />
									<%} %>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-lg-8 col-lg-offset-2 col-md-4 col-md-offset-4  col-sm-6 col-sm-offset-3 col-xs-6 col-xs-offset-3 "> 
								<div class="form-group row" >
									<%if(pass2!=null&&pass2!="") {%>
									<input type="password" id="repassword" name="password2"
										onchange="changemsg(this)" value=<%=pass2%>
										class="form-control" placeholder="确认密码" />
									<%}else{ %>
									<input type="password" id="repassword" name="password2"
										onchange="changemsg(this)" class="form-control"
										placeholder="确认密码" />
									<%} %>
								</div>
							</div>
						</div>

						<div class="form-group row">
							<div class="col-lg-8 col-lg-offset-2 col-md-4 col-md-offset-4  col-sm-6 col-sm-offset-3 col-xs-6 col-xs-offset-3">
								<h5 style="color: red;" id="msgs"><%=msg%></h5>
							</div>
						</div>

						
						<div class="row">
							<div class="col-lg-8 col-lg-offset-2 col-md-4 col-md-offset-4  col-sm-6 col-sm-offset-3 col-xs-6 col-xs-offset-3">
								<div style="float:right; margin-top:-8px; margin-right:-14px;" ><div class="form-group"><button type="submit" class="btn btn-primary">注册</button>	</center></div></div>
								<div style="float:right;margin-right:10px;"><a href="beforelogin.action" >我是老用户</a></div>
							</div>
						</div>
							
							
					</form>
				</div>
			</section>
		</div>
	</div>

	<script type="text/javascript">
	function changemsg(obj){
		$("#msgs").html(" ");
	}
	window.onload =function onload(){
		$("#msgs").html('<%=msg %>');
	}
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
		    $('#defaultForm').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
				fields: {
		            name: {
		                message: 'The username is not valid',
		                validators: {
		                    notEmpty: {
		                        message: '用户名不能为空'
		                    },
		                    stringLength: {
		                        max: 20,
		                        message: '用户名不能为超过20个'
		                    },
							regexp: {
		                        regexp: /^[a-zA-Z0-9_\.\u4E00-\u9FA5]+$/,
		                        message: '用户名只能包含数字，字母，下划线，英文句号，汉字'
		                    }
		                }
		            },
					email: {
		                validators: {
		                    notEmpty: {
		                        message: '邮箱不能为空'
		                    },
		                    emailAddress: {
		                        message: '输入的不是合法邮箱'
		                    }
		                }
		            },
		            password: {
		                validators: {
		                    notEmpty: {
		                        message: '密码不能为空'
		                    },
							stringLength: {
		                        min: 3,
		                        max: 10,
		                        message: '密码不能短于3位长于10位'
		                    }
		                }
		            },
		            password2: {
		                validators: {
		                    notEmpty: {
		                        message: '不能为空'
		                    },
		                    identical: {
		                        field: 'password',
		                        message: '两次密码不一致'
		                    }
		                }
		            },
		        }
		    });
		});
		</script>
</body>
</html>

