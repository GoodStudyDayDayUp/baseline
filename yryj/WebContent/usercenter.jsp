<%@ page language="java" contentType="text/html; charset=utf-8"
import="com.yryj.model.*"
import="java.util.*"
import="com.yryj.pub.*"
import="java.util.Date"
import="com.yryj.serviceImpl.*"
%>
<!DOCTYPE html>
<html>
<head>
		<title>个人中心</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" href="css/style.css"/>
		<link rel="stylesheet" href="css/bootstrap.min.css"/>
		<link rel="stylesheet" href="css/bootstrapValidator.min.css"/>
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/bootstrap.js"></script>
		<script src="js/bootstrapValidator.min.js"></script>
		<script src="js/bootstrapValidator_zh_CN.js"></script>
		<script type="text/javascript">
        $(document).ready(function () {
            $('.dropdown-toggle').dropdown();
        });
		</script>
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
//获取用户信息
User user=(User)session.getAttribute("user");
if(user==null)
	user=new User();
String phone = user.getPhone();
String msg=(String)session.getAttribute("msg")==null?"":(String)session.getAttribute("msg");

//获取草稿箱信息
List<Draft> dfs=new ArrayList<Draft>();
dfs=(List<Draft>)session.getAttribute("drafts");

List<Chapter> chs=(List<Chapter>)session.getAttribute("chapters");
List<Chapter> store=(List<Chapter>)session.getAttribute("store");
String[][] i2uArray=(String[][])session.getAttribute("i2uArray");
String[][] u2iArray=(String[][])session.getAttribute("u2iArray");
Relations relation=null;
if(user!=null){
	//获得所有的关系
	relation=new RelationsML().findByUserId(user.getId());
	session.setAttribute("relation", relation);
}
%>
<script type="text/javascript">
window.onload = function() {
	var m="<%=msg%>";
	if(m!="")
		alert(m);
	}
</script>

<%session.setAttribute("msg", ""); %>
<nav class="navbar navbar-default" role="navigation" style="background-color:#ededed; margin:0px 0px 0px 0px;">
	<div class="navbar-header">
      <a class="navbar-brand" href="readStart.action" style="font-family:SimHei;">一人一句</a>
   </div>
      <div>
      <ul class="nav navbar-nav navbar-right" style="margin-right: 20px;">
				<li class="dropdown" style="margin:0px 0px 0px 0px;font-family: SimHei  ;">
				<%if(user!=null){ %>
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" >
					<%=user.getName() %><b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
						<%if(user.getName().equals(Format.managerName)){ %>
						<li><a href="manage.jsp">管理</a></li>
						<%} %>
						<li><a href="logout.action">注销</a></li>
					</ul>
					<%}else{ %>
					<a href="beforelogin.action"  >
					登录
					</a>
					<%} %>
				</li>
			</ul>
			<p class="navbar-text navbar-right" style="font-family: SimHei;margin-right: 20px;" ><a href="creat_story.jsp"><span class="glyphicon glyphicon-plus" />添加故事 </a></p>
		</div>
	</nav>

	<div class="container">
	<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" style="margin-top:20px;">
	<ul class="nav nav-pills nav-stacked">
	<li class="active na"><a href="#" id="info">基本信息</a></li>
	<li class="na"><a href="#" id="mychpts">我的作品&nbsp;&nbsp;&nbsp;<span class="label label-default"><%=chs.size() %></span></a></li>
	<li class="na"><a href="#" id="mycol">我的收藏&nbsp;&nbsp;&nbsp;<span class="label label-default"><%=store.size()%></span></a></li>
	<li class="na"><a href="#" id="myfol">关注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="label label-default"><%if(i2uArray[0][0].equals("无"))%>0<%else %><%=i2uArray.length %></span></a></li>
	<li class="na"><a href="#" id="myfans">粉丝&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="label label-default"><%if(u2iArray[0][0].equals("无"))%>0<%else %><%=u2iArray.length %></span></a></li>
	<li class="na"><a href="#" id="mypoints">积分</a></li>
	</ul>
	</div>
	<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10" style="margin-top:20px;">
		<div id="basicInfo">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						基本信息
					</h3>
				</div>
				<div class="panel-body" >
					<table class="table">
						<tr><td>用户名</td><td><span class="label label-default"><%=user.getName()%></span></td></tr>
						<tr><td>邮箱</td><td><span class="label label-default"><%=user.getEmail() %></span></td></tr>
						<tr><td>联系方式</td>
						
						<td>
						<!--  ！！！！！！！这里是原有的手机号码form ！！！！
						<form action="updateUser.action?mood=1" method="post" onsubmit="return updatePhone()">
						    <%if(phone==null||phone=="") {%>
							<input type="text" class="form-control" id="phone" name="phone"  placeholder="绑定手机号 （格式为以13、15、18开头的11位电话号码）" onchange="changemsg(this)"/>
							<%}else{ %>
							<input type="text" class="form-control" id="phone" name="phone" value="<%=user.getPhone()%>" placeholder="绑定手机号 （格式为以13、15、18开头的11位电话号码）" onchange="changemsg(this)">
							<%} %>
							<p style="font-size:10px;color:red;display:none;" id="notphone">不是正确的格式</p>
							<button type="submit" class="btn btn-default" style="margin-top:5px;" >更新联系方式</button>
						</form>
						<!--                !!!!!!!!!这里是新的验证手机号的form !!!!!!!!    -->
						<form id="changePhone" action="updateUser.action?mood=1" method="post">
						 <%if(phone==null||phone=="") {%>
						 <div class="form-group"><input type="text" class="form-control" name="phone"  placeholder="11位手机号码"/></div>
						 <%}else{ %>
							<div class="form-group"><input type="text" class="form-control" name="phone" value="<%=user.getPhone()%>"  placeholder="11位手机号码"/></div>
						<%} %>
						<button type="submit" class="btn btn-default" style="margin-top:-10px;">更新联系方式</button>
						</form>
						</td>
						</tr>
						<!--               !!!!!!在此处添加了手机号码的验证 !!!!!!!!!            -->
						<script>
							$(document).ready(function() {
								$('#changePhone').bootstrapValidator({
									message: 'This value is not valid',
									feedbackIcons: {
										valid: 'glyphicon glyphicon-ok',
										invalid: 'glyphicon glyphicon-remove',
										validating: 'glyphicon glyphicon-refresh'
									},
									fields:{
										phone :{
											validators: {
												notEmpty: {
													message: '号码不能为空'
												},
												phone: {
													message: '这不是一个合法的手机号码',
													country: 'CN'
												}, //http://formvalidation.io/validators/phone/
											}
										}
									}
		
								})
							});
						</script> 
					</table>
					<hr/>
					<!--   这里是原有的！  被我注释掉了！！！
					<form action="updateUser.action?mood=2" method="post" onsubmit="return Confirm()">
						<p>原有密码</p>
						<input type="password" class="form-control"  id="oldpwd" placeholder="当前密码 " onchange="checkPass(this)"/>
						<p style="font-size:10px;color:red;display:none;"  id="oldpwd_wrong">密码错误</p>
						<p>新密码</p>
						<input type="password" name="password" class="form-control" id="newpwd" onchange="changepass(this)"  placeholder="3~10位"/>
						<p style="font-size:10px;color:red;display:none;" id="newpwd_empty">不能为空</p>
						<p style="font-size:10px;color:red;display:none;" id="newpwd_wrong">密码的长度应为3~10位</p>
						<p>确认新密码</p>
						<input type="password" name="password2" class="form-control" id="confirmpwd" onchange="changepass2(this)"  placeholder="3~10位"/>
						<p style="font-size:10px;color:red;display:none;" id="repwd_empty">不能为空</p>
						<p style="font-size:10px;color:red;display:none;" id="notconsist">两次密码不一致</p>
						<button type="submit" class="btn btn-default" style="margin-top:5px;" >更新密码</input>
					</form>
				<!--             !!!!!! 下面是新的修改密码的form！！！！！！    -->
				<form id="changePwd" action="updateUser.action?mood=2" method="post">
					<p>原有密码</p><div class="form-group" style="margin-top:-10px;"><input type="text" class="form-control"  name="oldpwd"  placeholder="原密码" onchange="checkPass(this)" /></div>
					<p style="font-size:10px;color:red;display:none;"  id="oldpwd_wrong">密码错误</p>
					<p>新密码</p><div class="form-group" style="margin-top:-10px;"><input type="password"  class="form-control" name="password"  placeholder="3-10位" /></div>
					<p>确认新密码</p><div class="form-group" style="margin-top:-10px;"><input type="password"  class="form-control" name="password2" placeholder="3-10位"/></div>
					<button type="button" class="btn btn-default" style="">更新密码</button>
				</form> 
				
				</div>
			</div>
					<!--        ！！！！！！！在此处添加了密码验证 ！！！！！！！！！！！！                            -->
					<script>
							$(document).ready(function() {
								$('#changePwd').bootstrapValidator({
									message: 'This value is not valid',
									feedbackIcons: {
										valid: 'glyphicon glyphicon-ok',
										invalid: 'glyphicon glyphicon-remove',
										validating: 'glyphicon glyphicon-refresh'
									},
									fields:{
										oldpwd:{
											validators: {
												stringLength: {
													min: 3,
													max: 10,
													message: '用户名不能短于3位长于10位'
												},
												notEmpty: {
													message: '号码不能为空'
												},
											}
										},
										password:{
											validators:{
												stringLength: {
													min: 3,
													max: 10,
													message: '用户名不能短于3位长于10位'
												},
												notEmpty: {
													message: '不能为空'
												},
											},
										},
										password2:{
											validators:{
												stringLength: {
													min: 3,
													max: 10,
													message: '用户名不能短于3位长于10位'
												},
												identical: {
													field: 'newpwd',
													message: '两次密码不一致'
												},
											},
										}
									}
								})
							})
						</script>
		</div>
		<div id="chpts" style="display:none;">
			<ul id="myTab" class="nav nav-tabs">
				<li class="active">
					<a href="#pub" data-toggle="tab">已发布的 </a>
				</li>
				<li><a href="#draft" data-toggle="tab">草稿箱</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active" id="pub">
						<% for(int i=0;i<chs.size();i++){ %>	
						<%String a[]=chs.get(i).getKey().split("#"); %>
					<div class="panel panel-default">
								<div class="panel-body">
								<div style="display:inline;">
								<%for(String s:a){ %>
									<span class="label label-primary chptlabel" ><%=s%></span>
									<%} %>
								</div>
								<p class="everychpt"><%=chs.get(i).getContent() %></p>
								<div class="row" >
									<div class="user" >
									<a href="viewPerson.action?name=<%=chs.get(i).getUserName() %>"><%=chs.get(i).getUserName() %></a>
										<span><%=Format.sdf.format(new Date(chs.get(i).getDate())) %></span>
										<span>点赞数：<%=chs.get(i).getZan() %></span>
									</div>
									<div class="functs check">
										<a href="readStory.action?index=<%=chs.get(i).getId()%>">查看前后文</a>
									</div>
								</div>
								</div>
							</div>
							<%} %>
				</div>
				
				<div class="tab-pane fade" id="draft"> <!-- 草稿箱 --> 
					<table class="table">
					<%if(dfs.size()>0)
					for(int i=0;i<dfs.size();i++){ %>
					<tr><td><%=dfs.get(i).getContent() %></td><td><a href="readDraft.action?index=<%=i%>"><button type="button" class="btn btn-default" style="float:right;">查看</button></a></td></tr>
					<%} %>
					</table>
				</div>
			</div>
		</div>
		
		
		<div id="collects" style="display:none;">
		<% for(int i=0;i<store.size();i++){ %>	
		<%String a[]=store.get(i).getKey().split("#"); %>
			<div class="panel panel-default">
								<div class="panel-body">
								<div style="display:inline;">
								<%for(String s:a){ %>
									<span class="label label-primary chptlabel" ><%=s%></span>
									<%} %>
								</div>
								<p class="everychpt"><%=store.get(i).getContent() %></p>
								<div class="row" >
									<div class="user" >
										<a href="viewPerson.action?name=<%=store.get(i).getUserName() %>"><%=store.get(i).getUserName() %></a>
										<span><%=Format.sdf.format(new Date(store.get(i).getDate())) %></span>
										<span>点赞数：<%=store.get(i).getZan() %></span>
									</div>
									<div class="functs check">
										<%
					boolean isFind=false;
					if(relation!=null){
						String love=relation.getU2cZan();
						isFind=Format.findInArray(love.split("#"), String.valueOf(store.get(i).getId()));
					}
					if(isFind){
					%>
						<button id=<%="zan"+store.get(i).getId()%> type="button" class="btn btn-default chptbtn glyphicon glyphicon-heart" style="border:none;padding:3px 7px 2px 7px;color:red"  value="1" onclick="LoveShow(this)"></button>
					<%} else{%>
						<button id=<%="zan"+store.get(i).getId()%> type="button" class="btn btn-default chptbtn glyphicon glyphicon-heart" style="border:none;padding:3px 7px 2px 7px;"  value="0" onclick="LoveShow(this)"></button>
					<%}%>
										<a href="readStory.action?index=<%=store.get(i).getId()%>">查看前后文</a>
									</div>
								</div>
								</div>
							</div>
		<%} %>
		</div>
		<div id="follow" style="display:none">
			<div class="panel panel-default">
				<div class="panel-heading">我关注的人</div>
					<ul class="list-group">
						<%if(i2uArray[0][0].equals("无")){ %>
						<li class="list-group-item">无</a></li><%} 
						else {%>
						<%for(int i=0;i<i2uArray.length;i++){ %>
						<li class="list-group-item"><a href="viewPerson.action?name=<%=i2uArray[i][0]%>"><%=i2uArray[i][0] %></a>
						<a href="setAttention.action?id=<%=i2uArray[i][1] %>&mood=1"><button class="btn btn-info" style="float:right;margin-top:-7px;"> 取消关注 </button></a></li>
						<%}} %>
					</ul>
				</div>
		</div>
		<div id="fans" style="display:none">
			<div class="panel panel-default">
				<div class="panel-heading">关注我的人</div>
					<ul class="list-group">
						<%if(u2iArray[0][0].equals("无")){ %>
						<li class="list-group-item">无</a></li><%} 
						else {%>
						<%for(int i=0;i<u2iArray.length;i++){ %>
						<li class="list-group-item"><a href="viewPerson.action?name=<%=u2iArray[i][0]%>"><%=u2iArray[i][0] %></a></li><%}} %>
					</ul>
				</div>
		</div>
		<div id="points" style="display:none">
			<div class="panel panel-default">
				<div class="panel-heading">积分</div>
				<div class="panel-body">
					积分余额<span class="label label-default" style="margin-left:20px;"><%=user.getPoint() %></span>
				</div>
				<table class="table">
					<th>时间</th><th>积分</th>
					<tr><td>2016-04-12</td><td>200</td></tr>
					<tr><td>2016-03-12</td><td>400</td></tr>
				</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		$(".na").click(function(){
			$(this).addClass("active");
			$(this).siblings().removeClass("active");
		});
	});
</script>

<script language="JavaScript">
<%for(int i=0;i<store.size();i++){%>
$("<%="#zan"+store.get(i).getId()%>").click(function(){
	$.ajax({
			url:"setLove.action?id=<%=store.get(i).getId() %>",
			type:"POST",
			data:{},
			dataType:"json",
			success:function(data){
				
			},
			error:function(){
			}
 });
 }); 
<%}%>
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
</script>


<script type="text/javascript">
$("#info").on("click",function(){
$("#basicInfo").show();//显示
$("#chpts").hide();
$("#collects").hide();
$("#follow").hide();
$("#fans").hide();
$("#points").hide();
});
$("#mychpts").on("click",function(){
$("#chpts").show();
$("#basicInfo").hide();
$("#collects").hide();
$("#follow").hide();
$("#fans").hide();
$("#points").hide();
});
$("#mycol").on("click",function(){
$("#collects").show();
$("#basicInfo").hide();
$("#chpts").hide();
$("#follow").hide();
$("#fans").hide();
$("#points").hide();
});
$("#myfol").on("click",function(){
$("#follow").show();
$("#basicInfo").hide();
$("#chpts").hide();
$("#collects").hide();
$("#fans").hide();
$("#points").hide();
});
$("#myfans").on("click",function(){
$("#fans").show();
$("#basicInfo").hide();
$("#chpts").hide();
$("#collects").hide();
$("#follow").hide();
$("#points").hide();
});
$("#mypoints").on("click",function(){
$("#points").show();
$("#basicInfo").hide();
$("#chpts").hide();
$("#collects").hide();
$("#follow").hide();
$("#fans").hide();
});
</script>
</html>