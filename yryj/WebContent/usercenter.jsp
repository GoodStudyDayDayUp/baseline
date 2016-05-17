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
<nav class="navbar navbar-default" role="navigation" style=" margin:0px 0px 0px 0px;">
	<div class="navbar-header">
      <a class="navbar-brand" href="readStart.action" style="font-family:SimHei;">一人一句</a>
   </div>
      <div>
			<p class="navbar-text navbar-right" style="font-family: SimHei;margin-right: 20px;" ><a href="creat_story.jsp"><span class="glyphicon glyphicon-plus" />添加故事 </a></p>
		</div>
	</nav>

	<div class="container">
	<div class="col-lg-2" style="margin-top:20px;">
	<ul class="nav nav-pills nav-stacked">
	<li class="active na"><a href="#" id="info">基本信息</a></li>
	<li class="na"><a href="#" id="mychpts">我的作品</a></li>
	<li class="na"><a href="#" id="mycol">我的收藏</a></li>
	<li class="na"><a href="#" id="myfol">关注</a></li>
	<li class="na"><a href="#" id="myfans">粉丝</a></li>
	<li class="na"><a href="#" id="mypoints">积分</a></li>
	</ul>
	</div>
	<div class="col-lg-10" style="margin-top:20px;">
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
						<form action="updateUser.action?mood=1" method="post" onsubmit="return updatePhone()">
						    <%if(phone==null||phone=="") {%>
							<input type="text" class="form-control" id="phone" name="phone"  placeholder="绑定手机号 （格式为以13、15、18开头的11位电话号码）" onchange="changemsg(this)"/>
							<%}else{ %>
							<input type="text" class="form-control" id="phone" name="phone" value="<%=user.getPhone()%>" placeholder="绑定手机号 （格式为以13、15、18开头的11位电话号码）" onchange="changemsg(this)">
							<%} %>
							<p style="font-size:10px;color:red;display:none;" id="notphone">不是正确的格式</p>
							<button type="submit" class="btn btn-default" style="margin-top:5px;" >更新联系方式</button>
						</form>
						</td>
						
						</tr>
					</table>
					<hr/>
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
				
				</div>
			</div>
			<script type="text/javascript">
			function checkPass(obj){
				var w = document.getElementById("oldpwd_wrong");
			    if(obj.value!="<%=user.getPassword() %>"){
					w.style.display = "block";
			    }else{
			    	w.style.display = "none";
			    }
			}
			
			function changemsg(obj){
				var myreg = /^[1][358][0-9]{9}$/; 
				var w = document.getElementById("notphone");
				//验证130-139,150-159,180-189号码段的手机号码
				if(!myreg.test($("#phone").val())) 
				{ 
					w.style.display = "block";
				} else
					w.style.display = "none";
			}
			
			function changepass2(obj){
				var value=obj.value;
				var w = document.getElementById("notconsist");
				var n = document.getElementById("repwd_empty");
				var p=document.getElementById("newpwd");
				if(value.length==0)
					n.style.dispaly="block";
				else{
					n.style.dispaly="none";
					if(value!=p.value){
						w.style.dispaly="block";
					}else
						w.style.dispaly="none";
				}
			}
			
			function changepass(obj){
				var value=obj.value;
				var w = document.getElementById("newpwd_wrong");
				var n = document.getElementById("newpwd_empty");
				if(value.length==0)
					n.style.dispaly="block";
				else{
					n.style.dispaly="none";
					if(value.length<3||value.length>10 ){
						w.style.dispaly="block";
					}else
						w.style.dispaly="none";
				}
			}
			</script>
			
			<script language="javascript">	
			
			function updatePhone(){
				var myreg = /^[1][358][0-9]{9}$/; 
				var w = document.getElementById("notphone");
				//验证130-139,150-159,180-189号码段的手机号码
				if(!myreg.test($("#phone").val())) 
				{ 
					w.style.display = "block";
					return false;
				} else
					w.style.display = "none";
				return true;
			}
			
					function Confirm(){
						var oldpwd = document.getElementById("oldpwd");
						var newpwd = document.getElementById("newpwd");
						var repwd = document.getElementById("confirmpwd");
						var m = /^[a-zA-Z0-9_\.]+$/;
						if (oldpwd){//检验旧密码
							var oldpwd = document.getElementById("oldpwd");
							var w = document.getElementById("oldpwd_wrong");
						    if(oldpwd.value!="<%=user.getPassword() %>"){
								w.style.display = "block";
								return false;
						    }
						}

						if((newpwd.value)==""){
							var w = document.getElementById("newpwd_empty");
							w.style.display = "block";
							return false;
						}else{
							var w = document.getElementById("newpwd_empty");
							w.style.display = "none";
						}
						if(!m.test($("#newpwd").val()) | newpwd.value.length<6 | newpwd.value.length>18){
							var w = document.getElementById("newpwd_wrong");
							w.style.display = "block";
							return false;
						}else{
							var w = document.getElementById("newpwd_wrong");
							w.style.display = "none";
						}
						if ((repwd.value)==""){
							var w = document.getElementById("repwd_empty");
							w.style.display = "block";
							return false;
						}else{
							var w = document.getElementById("repwd_empty");
							w.style.display = "none";
						}
						if((newpwd.value)!=(repwd.value)){
							var w = document.getElementById("notconsist");
							w.style.display = "block";
							return false;
						}else{
							var w = document.getElementById("notconsist");
							w.style.display = "none";
						}
						return true;
					}

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
						<li class="list-group-item"><a href="x">张兵</a></li>
						<li class="list-group-item"><a href="x">何明</a></li>
						<li class="list-group-item"><a href="x">李子康</a></li>
						<li class="list-group-item"><a href="x">交大吴彦祖</a></li>
						<li class="list-group-item"><a href="x">刘烨</a></li>
						<li class="list-group-item"><a href="x">bear4515</a></li>
						<li class="list-group-item"><a href="x">vegetchichen</a></li>
						<li class="list-group-item"><a href="x">炸炸</a></li>
						<li class="list-group-item"><a href="x">TaylorSwift</a></li>
						<li class="list-group-item"><a href="x">LadyGaga</a></li>
						<li class="list-group-item"><a href="x">CharseDikense</a></li>
						<li class="list-group-item"><a href="x">MarkTowan</a></li>
					</ul>
				</div>
		</div>
		<div id="fans" style="display:none">
			<div class="panel panel-default">
				<div class="panel-heading">关注我的人</div>
					<ul class="list-group">
						<li class="list-group-item"><a href="x">张兵</a></li>
						<li class="list-group-item"><a href="x">何明</a></li>
						<li class="list-group-item"><a href="x">李子康</a></li>
						<li class="list-group-item"><a href="x">交大吴彦祖</a></li>
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