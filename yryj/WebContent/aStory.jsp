<%@ page language="java" contentType="text/html; charset=utf-8" 
	import="com.yryj.model.*"
	import="java.util.*"
    import="com.yryj.pub.*"
    import="com.yryj.sercvice.*"
    import="com.yryj.serviceImpl.*"
%>
<%
User user=(User)session.getAttribute("user"); 
List<Chapter> story=(List<Chapter>) session.getAttribute("story");
Relations relation=null;
if(user!=null){
	//获得所有的关系
	relation=new RelationsML().findByUserId(user.getId());
	session.setAttribute("relation", relation);
}
ChapterManager cm=new ChapterML();
%>

<!-- 正文 -->
		<%for(int i=1;i<story.size();i++){ 
			long left=story.get(i).getLeftStory();
		%>
		<div class="row " > <!--onmouseover="DivShow()" onmouseout="DivHide()" -->
			<div class="col-lg-1 col-lg-offset-1" style="display:table;position:relative;">
				<div style="margin-top:50px;display:table-cell;vertical-align:middle; position:absolute;height:100%; top:0px;bottom:0px;right:10px;">
					<a href="" id=<%="ToLeft"+story.get(i).getId()%> onclick="LeftChpt();" title="可以查看<%=left %> 条内容"> <span class="glyphicon glyphicon-chevron-left"/></a>
				</div>
			</div>
			<div class="col-lg-8  chptbox" >
			<div style="display:inline;">
				<%String a=story.get(i).getKey();
				String ks[];
				  if(a.indexOf("#")!=-1){
					  ks=a.split("#");
					  for(int j=0;j<ks.length;j++){
				%>
					<span class="label label-danger chptlabel" ><%=ks[j] %></span>
				<%}}
				  else
					  if(a!=""&&a!=null){
				  %>
				  <span class="label label-danger chptlabel" ><%=a %></span>
				  <%} %>
				</div>
				<div>
				<p class="everychpt" id=<%="content"+story.get(i).getId() %>><%=story.get(i).getContent() %></p></div>
				<div class="row" >
					<div class="user" id="chptuser">
						<a href="viewPerson.action?name=<%=story.get(i).getUserName() %>"><%=story.get(i).getUserName() %></a>
						<span><%=Format.sdf.format(new Date(story.get(i).getDate())) %></span>
						
						<span>点赞数：</span><span id=<%="zanNum"+story.get(i).getId()%>><%=story.get(i).getZan() %></span>
					</div>
					<div class="functs" id="funct">
					<%
					if(user!=null){
					boolean isFind=false;
					if(relation!=null){
						String love=relation.getU2cZan();
						isFind=Format.findInArray(love.split("#"), String.valueOf(story.get(i).getId()));
					}
					if(isFind){
					%>
						<button id=<%="zan"+story.get(i).getId()%> type="button" class="btn btn-default chptbtn glyphicon glyphicon-heart" style="border:none;padding:3px 7px 2px 7px;color:red"  value="1" onclick="LoveShow(this)"></button>
					<%} else{%>
						<button id=<%="zan"+story.get(i).getId()%> type="button" class="btn btn-default chptbtn glyphicon glyphicon-heart" style="border:none;padding:3px 7px 2px 7px;"  value="0" onclick="LoveShow(this)"></button>
					<%}
					}else{%>
						<a href="setLove.action"><button  type="button" class="btn btn-default chptbtn glyphicon glyphicon-heart" style="border:none;padding:3px 7px 2px 7px;"  value="0" onclick="LoveShow(this)"></button></a>
					<%} %>
					
					<%
					if(user!=null){
					boolean isFind=false;
					if(relation!=null){
						String love=relation.getU2cStore();
						isFind=Format.findInArray(love.split("#"), String.valueOf(story.get(i).getId()));
					}
					if(isFind){
					%>
						<button id=<%="store"+story.get(i).getId()%> type="button" class="btn btn-default glyphicon glyphicon-star"  style="border:none;padding:3px 7px 2px 7px;color:#f1c232"  value="1" onclick="CollectShow(this)"></button>
					<%} else{%>
						<button id=<%="store"+story.get(i).getId()%> type="button" class="btn btn-default glyphicon glyphicon-star"  style="border:none;padding:3px 7px 2px 7px;"  value="0" onclick="CollectShow(this)"></button>
					<%}
					}else{%>
						<a href="setStore.action"><button type="button" class="btn btn-default glyphicon glyphicon-star" style="border:none;padding:3px 7px 2px 7px;" id="e" value="0" onclick="CollectShow(this)"></button></a>
						
					<%} %>	
						
						<a href="prepareWrite.action?parentId=<%=story.get(i).getId() %>"><button type="button" class="btn btn-default glyphicon glyphicon-plus" style="border:none;padding:3px 7px 2px 7px;" id="f" ></button></a>
					</div>
				</div>
			</div>
			<%
			List<Chapter> siblings=cm.getChildren(story.get(i).getParentId());
		    long total=siblings.size();
		    long right=total-left-1;
			%>
			<div class="col-lg-1" style="display:table;position:relative;">
				<div style="margin-top:50px;display:table-cell;vertical-align:middle; position:absolute;height:100%; top:0px;bottom:0px;left:10px;">
					<a href="" id=<%="ToRight"+story.get(i).getId()%> title="还可以查看<%=right %>条内容" > <span class="glyphicon glyphicon-chevron-right"/></a>
				</div>
			</div>
		</div>
		<%} %>