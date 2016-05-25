<%@ page language="java" contentType="text/html; charset=utf-8" import="com.yryj.model.*"
import="java.util.*"
import="com.yryj.pub.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<title>管理页面</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" href="css/style.css"/>
		<link rel="stylesheet" href="css/bootstrap.min.css"/>
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
td{
display:middle;
}
#category ul{
list-style:none;
}
#category li{
float:left;}
</style>
</head>
<body >

<%
	User user=(User)session.getAttribute("user"); 
	ArrayList<ArrayList<Type>> types=(ArrayList<ArrayList<Type>>)session.getAttribute("types");
	if(types==null){
		types=new ArrayList<ArrayList<Type>>();
	}
	%>
	<nav class="navbar navbar-default" role="navigation" style=" margin:0px 0px 0px 0px;">
	<div class="navbar-header">
      <a class="navbar-brand" href="main.jsp" style="font-family:SimHei;">一人一句</a>
    </div>
		<div>
			<ul class="nav navbar-nav navbar-right" style="margin-right: 20px;">
				<li class="dropdown" style="margin:0px 0px 0px 0px;font-family: SimHei  ;">
				<%if(user!=null){ %>
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" >
					<%=user.getName() %><b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
						<li><a href="getInfo.action">个人主页</a></li>
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
			<p class="navbar-text navbar-right" style="font-family: SimHei  ;"><a href="creat_story.jsp"><span class="glyphicon glyphicon-plus" />添加故事</a></p>
		</div>
	</nav>
	
	<div class="container">
		<div class="col-lg-2" style="margin-top:20px;">
		<ul class="nav nav-pills nav-stacked">
			<li class="active ma"><a href="#" id="category">管理分类</a></li>
			<li class="ma" ><a href="#" id="activity">管理活动</a></li>
		</ul>
		</div>
		
		<div class="col-lg-10" style="margin-top:20px;">
			<!--一级分类，二级分类-->
		<div id="categoryShow" >				
				<ul id="myTab" class="nav nav-tabs">
					<li class="active na xiaoshuo" style="display:inline;">	<a href="#xiaoshuo" data-toggle="tab">小说</a> </li>
					<li class="na shige"><a href="#shige" data-toggle="tab">诗歌</a></li>
					<li class="na"><button class="btn btn-primary" style="margin-bottom:5px; margin-top:5px; height:30px;" id="add1lCategory">添加一级分类</button></li>
				</ul>
			<div id="myTabContent" class="tab-content" style="font-family:;">
				<div class="tab-pane fade in active" id="xiaoshuo">
					<div class="row">
						<div class="col-lg-4">
							<div style="margin-top:15px; "><a link="color:#000000;"><b>科幻</b></a><a href="javascript:;"style="float:right;color:#a4c2f4" id="2lConfirmDel">删除</a></div>
							<p style="margin-top:5px;margin-bottom:0px;padding-bottom:0px;height:40px;overflow: hidden;text-overflow: ellipsis;">
							用幻想艺术的形式，表现科学技术远景或者社会发展对人类影响。</p>
						</div>
						
						<div class="col-lg-4">
							<div style="margin-top:15px; "><a link="color:#000000;"><b>科幻</b></a><a href="javascript:;"style="float:right;color:#a4c2f4" id="2lConfirmDel">删除</a></div>
							<p style="margin-top:5px;margin-bottom:0px;padding-bottom:0px;height:40px;overflow: hidden;text-overflow: ellipsis;">
							用幻想艺术的形式，表现科学技术远景或者社会发展对人类影响。</p>
						</div>
						
						<div class="col-lg-4" style="text-align:center; padding-top:40px;">
							<a href="javascript:;" id="add2lCategory"><span class="glyphicon glyphicon-plus" style="color:#a4c2f4"></span>   添加一个二级分类</a>
						</div>
					</div>
					<hr style="margin-bottom:0px;"/>
				</div>
				<div class="tab-pane fade" id="shige">
					<div class="row">
						<div class="col-lg-4" style="text-align:center; padding-top:40px;">
							<a href="javascript:;" id="add2lCategory"><span class="glyphicon glyphicon-plus" style="color:#a4c2f4"></span>   添加一个二级分类</a>
						</div>
					</div>
					<br/>
				</div>
			</div>
			
			<button class="btn btn-danger" id="1lConfirmDelBtn" style="margin-top:10px;" data-toggle="modal" data-target="#delete1lModal" >删除当前一级分类</button>
				<div class="modal fade" id="delete1lModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">  
						<div class="modal-content 1lConfirmDel">   <div class="modal-body"> 确定删除此一级分类？这个操作是不可撤销的 </div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
								<button type="button" class="btn btn-default" data-dismiss="modal" id="1lConfirmDel"> 确定删除  </button>
							</div>
						</div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
		</div>
		<div id="activityShow" style="display:none">
			<button class="btn btn-primary" data-toggle="button" id="addActivity">添加活动</button>
				<!--序号，名称(变文本框)，图片（加上传图片按钮），链接（变文本框），主办方（变文本框），时间（时间选择器）-->
			<table class="table table-bordered" id="myTable" style="">
					<thead>	<tr><th>序号</th>   <th>名称</th>    <th>图片</th>  <th>主办方</th>  <th>链接</th> <th>状态</th> <th>操作</th>  </tr></thead>
					<tbody>
						<tr> <td><p id="id">2</p></td>
							<td><p id="name" value="1">暴走大事件接龙</p></td>   
							<td><a href="pics/main_pic2.jpeg" value="1">baozou.jpg</a></td>  
							<td><p value="1">暴走漫画</p></td>  
							<td><a href="http://www.qxnic.com" name="urlpath">www.qxnic.com</a></td> 
							<td><p id="status">进行中</p></td>
							<td><button class="btn btn-sm btn-primary edit">编辑 </button>  	<button class="btn btn-sm btn-danger delete" >关闭</button></td> 
						</tr>
					</tbody>
			</table>
		</div>
		</div>
	</div>
</body>
 <script >
 // 添加一级分类
 $(document).on("click","#add1lCategory",function(){
							$(this).parent().html('<input type="text" id="new1lName"  size="10" placeholder="输入分类名称"/><button class="btn btn-primary" style="margin-bottom:5px; margin-top:5px; margin-left:2px; height:30px;" id="confirmAdd1lCategory">确认</button><button class="btn btn-info" style="margin-bottom:5px; margin-top:5px; height:30px;" id="cancelAdd1lCategory" >取消</button>');
						});
						
						// 确认新的一级分类信息
$(document).on("click","#confirmAdd1lCategory",function(){
alert(codefans_net_CC2PY("戏剧"));
							var n = $("#new1lName").val();
							$(this).parent().remove();
							$("#myTab").append('<li class="na '+codefans_net_CC2PY(n)+'"><a href="#'+codefans_net_CC2PY(n)+'" data-toggle="tab">'+n+'</a></li><li class="na"><button class="btn btn-primary" style="margin-bottom:5px; margin-top:5px; height:30px;" id="add1lCategory">添加一级分类</button></li>');
							$("#myTabContent").append('<div class="tab-pane fade" id="'+codefans_net_CC2PY(n)+'"><div class="row"><div class="col-lg-4" style="text-align:center; padding-top:40px;"><a href="javascript:;" id="add2lCategory"><span class="glyphicon glyphicon-plus" style="color:#a4c2f4"></span>   添加一个二级分类</a></div></div></div>');
						});
						
						// 取消添加一级分类
$(document).on("click","#cancelAdd1lCategory",function(){
							$(this).parent().html('<button class="btn btn-primary" style="margin-bottom:5px; margin-top:5px; height:30px;" id="add1lCategory">添加一级分类</button>');
						});
						
 // 删除二级分类/撤销
 $(document).on("click","#2lConfirmDel",function(){
								$(this).text()=="删除"?$(this).text("撤销"):$(this).text("删除");
							});
// 添加二级分类
$(document).on("click","#add2lCategory",function(){
								$(this).parent().html('<div><input type="text" class="form-control" style="width:50%; margin-top:-20px; float:left;" id="new2lName" placeholder="输入分类名称"/></div><div style="width:50%;float:right;margin-top:-20px;"><button class="btn btn-sm btn-primary" style="margin-left:0px;" id="confirmAdd2lCategory">确认</button><button class="btn btn-sm btn-info" id="cancelAdd2lCategory">取消</button></div><input type="textarea" class="form-control" style="margin-top:5px;" id="new2lDescp"  placeholder="输入分类描述，不超过40字" />');
							});
							// 取消添加
$(document).on("click","#cancelAdd2lCategory",function(){ 
								$(this).parent().parent().html('<a href="javascript:;" id="add2lCategory"><span class="glyphicon glyphicon-plus" style="color:#a4c2f4"></span>   添加一个二级分类</a>');
							});
							
							// 确认新的二级分类信息
$(document).on("click","#confirmAdd2lCategory",function(){
								var n = $("#new2lName").val();
								var d = $("#new2lDescp").val();
								var num = $(".active .col-lg-4").length;								
								$(this).parent().parent().parent().append('<div class="col-lg-4"><div style="margin-top:15px; "><a link="color:#000000;"><b>'+n+'</b></a><a href="javascript:;"style="float:right;color:#a4c2f4" id="2lConfirmDel">删除</a></div>'+
								'<p style="margin-top:5px;margin-bottom:0px;padding-bottom:0px;height:40px;overflow: hidden;text-overflow: ellipsis;">'+
								d+'</p></div>');
								if(num%3==0){ //新起一行
									$(this).parent().parent().parent().after('<hr /><div class="row"><div class="col-lg-4" style="text-align:center; padding-top:40px;"><a href="javascript:;" id="add2lCategory"><span class="glyphicon glyphicon-plus" style="color:#a4c2f4"></span>   添加一个二级分类</a></div></div>');
								}
								else{
									$(this).parent().parent().parent().append('<div class="col-lg-4" style="text-align:center; padding-top:40px;"><a href="javascript:;" id="add2lCategory"><span class="glyphicon glyphicon-plus" style="color:#a4c2f4"></span>   添加一个二级分类</a></div>');
								}
								$(this).parent().parent().remove();
							});
// 确认删除一级分类
$(document).on("click","#1lConfirmDel",function(){
						var head=$("#myTabContent .active"); //获取tab内容 对象
						alert(head.attr("id"));
						var liObj = $("#myTab .active"); // 获取tab头对象
						alert(liObj.html());
						
						if(!liObj.next().find("button")){ //有下一个sibling
							alert(liObj.next().html());
							liObj.next().addClass("active");
							head.next().addClass("active in");
						}
						else{
							alert(head.html());
							alert(head.prev().html());
							
							liObj.prev().addClass("active");
							head.prev().addClass("active in");
						}
						head.remove();
						liObj.remove();
					});
							
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