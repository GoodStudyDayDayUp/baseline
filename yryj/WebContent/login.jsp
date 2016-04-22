<!DOCTYPE html>
<html>
<head>
		<title>登陆</title>
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
</head>
<body style="background-color:#EDEDED ">
    <div class="container">
        <div class="row">
			
				<p style="text-align:center; margin:auto"><img src="pics\logopic.png" /></p>
			
            <section>
                <div class="col-lg-6 col-lg-offset-3" >
                    <form id="defaultForm" method="post" action="">
                            
							<div class="form-group row" >
								<div class="col-lg-8 col-lg-offset-1"> <input type="text" id="name" name="username" class="form-control col-lg-5" placeholder="用户名"/></div>
								<a href="register.html" >还没有账号？</a>
							</div>
							
                            <div class="form-group row">
                                <div class="col-lg-8 col-lg-offset-1"> <input type="password" id="password" name="password" class="form-control" placeholder="密码"/></div>
								<a href="register.html" class="display:block">忘记密码</a>
                            </div>
							
                        <div class="form-group ">
								<p class="col-lg-offset-1"/>
                                <input type="checkbox" name="rememberme" class="col-lg-offset-1"/>记住我
								<button type="submit" class="btn btn-primary col-lg-offset-3">登录</button>
                        </div>
						
                    </form>
                </div>
            </section>
        </div>
    </div>

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
            username: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    }
                }
            }			,
            password: {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    }
                }
            }
        }
    });
});
</script>
</body>
</html>