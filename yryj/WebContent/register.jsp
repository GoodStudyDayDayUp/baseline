<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>登录</title> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<link href="css/login2.css" rel="stylesheet" type="text/css" />
<link href="css/personal.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="header">
		<div class="header-top">
			<div class="container">
				<div class="logo">
						<font class="login_font_title">一人一句</font>
				</div>
				<div class="header-right">
					<div class="menu">
						<ul class="navigatoin">
							<li><a href="#" class="active">了解</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

<div class="login a-fadeinB" style="margin-top:100px;">
    
    <div class="header">
        <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">注册账号</a>
			
        </div>
    </div>    
  
    
    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 280px;">    

            <!--登录-->
            <div class="web_login" id="web_login">
               
               
               <div class="login-box">
    
            
			<div class="login_form">
				<form action="Choose.jsp" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm" method="post">
                <div class="uinArea" id="uinArea">
                <label class="input-tips" for="u">用户:</label>
                <div class="inputOuter" id="uArea">                   
                    <input type="text" id="name" name="name" class="inputstyle"/>
                </div>
                </div>
                <div class="pwdArea">
                 <label class="input-tips" for="u">密码:</label>
                <div class="inputOuter" id="pArea">                   
                    <input type="password" id="password" name="password" class="inputstyle"/>
                </div>
                </div>
                 <div class="pwdArea">
                 <label class="input-tips" for="u">确认密码:</label>
                <div class="inputOuter" id="pArea">                   
                    <input type="password" id="password" name="password" class="inputstyle"/>
                </div>
                </div>
                <div class="inputOuter2" id="bArea"> 
                <input type="submit" value="注   册" style="height:42px;width:100px; float:left" class="button_blue"/>
                <input type="reset" value="重  置" style="	height:42px;width:100px;float:right" class="button_blue"/>
                
                </div>
              </form>
              
           </div>
           
            	</div>
               
            </div>
            <!--登录end-->
  </div>

  
</div>
<div class="jianyi">*推荐使用ie8或以上版本ie浏览器或Chrome内核浏览器访问本站</div>
<!-- <div id="animate" class="a-fadein">淡入</div> -->
</body></html>