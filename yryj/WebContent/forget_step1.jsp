<%@ page language="java" contentType="text/html; charset=utf-8"
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
<%String msg=(String)session.getAttribute("msgs")==null?" ":(String)session.getAttribute("msgs"); %>
<body >
<div id="floater">
</div>
<div id="content">
	<div style="display:table-cell;vertical-align:middle;">
		<div class="container">
		<form id="defaultForm" method="post" action="sendEmail.action" >
				<div class='col-lg-4 col-lg-offset-4'> <div class="form-group" ><input type="text" id="name" name="name" class="form-control" placeholder="请输入用户名" onchange="changemsg(this)"/></div></div>
				<div class='col-lg-4 col-lg-offset-4'> <div class="form-group" ><input type="text" id="email" name="email" class="form-control" placeholder="请输入注册用的邮箱" onchange="changemsg(this)"/></div></div>
				<div class='col-lg-4 col-lg-offset-4'><h5 style="color:red;" id="msgs"><%=msg %></h5></div>
				<div class="col-lg-4 col-lg-offset-7" style="right:5px;" > <div class="form-group" ><button type="submit" class="btn btn-primary">下一步</button></div></div>
		</form>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	function changemsg(obj){
		$("#msgs").html(" ");
	}
	window.onload =function onload(){
		$("#msgs").html('<%=msg %>');
	}
	</script>
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
        }
    });
});
</script>
</html>