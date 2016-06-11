<%@ page language="java" contentType="text/html; charset=utf-8"
    import="com.yryj.model.User"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<title>找回密码</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" href="css/bootstrap.min.css"/>
		<link rel="stylesheet" href="css/bootstrapValidator.min.css"/>
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/bootstrap.js"></script>
		<script src="js/bootstrapValidator.min.js"></script>
		<script src="js/bootstrapValidator_zh_CN.js"></script>

		<style type="text/css" media="all">
			html,body{height:100%;margin:0;padding:0;}
			#floater{height:50%;margin-bottom:-150px;position:relative;}
			#content{clear:both;height:300px;position:relative;margin:0 auto;background-color:#EDEDED;width:100%;padding:20px; display:table;}
		</style>
</head>
<%
String id=request.getParameter("id");
%>
<body >
<div id="floater">
</div>
<div id="content">
	<div style="display:table-cell;vertical-align:middle;">
		<div class="container">
		<form id="defaultForm" method="post" action="updateUser.action?mood=3&id=<%=id%>" >
				<div class='col-lg-4 col-lg-offset-4'> <div class="form-group" ><input type="password" id="password" name="password" class="form-control" placeholder="密码"/></div></div>
				<div class='col-lg-4 col-lg-offset-4'> <div class="form-group" > <input type="password" id="repassword" name="password2" class="form-control" placeholder="确认密码"/></div></div>
				<!--  确认重置后跳转到登陆界面 可以不   -->
				<div class="col-lg-4 col-lg-offset-7" style="right:18px;" > <div class="form-group" > <button type="submit" class="btn btn-primary ">确认重置</button>   </div></div>
		</form>
		</div>
	</div>
</div>
</body>
<script>
$(document).ready(function() {
    $('#defaultForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
		fields: {
            password: {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
					stringLength: {
						min: 3,
						max: 10,
						message: '用户名不能短于3位长于10位'
					},
                }
            },
            password2: {
                validators: {
                    notEmpty: {
                        message: '不能为空'
                    },
					stringLength: {
						min: 3,
						max: 10,
						message: '用户名不能短于3位长于10位'
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
</html>