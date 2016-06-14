<%@ page language="java" contentType="text/html; charset=utf-8"
	import="com.yryj.model.*" import="java.util.*"%>
<%
	List<Chapter> storys=(List<Chapter>)session.getAttribute("storys");
	if(storys==null)
		storys=new ArrayList<Chapter>();
%>
<!--右侧故事开头-->


<%for(int i=0;i<storys.size();i++ ){%>
<%
					Chapter ch=storys.get(i);
					String length="短篇";
					String keys=ch.getKey();
					String key[]=keys.split("#");
					String key2[]=new String[3];
					switch((int)ch.getLength()){
					case 1:
						length="中篇";
						break;
					case 2:
						length="长篇";
						break;
					};					
					key2[0]=ch.getFormat();
					key2[1]=ch.getStyle();
					key2[2]=length;
					for(int index=0;index<key.length;index++){
						String k=key[index];
						if(index==3)
							break;
						if((!k.equals(""))&&k!=null)
							key2[2-index]=key[index];
					}
					
				%>
<div class="row storyofmain" style="padding-left: 10px;">

	<%if((i%4)==0){ %>
	<div class="col-lg-4 storyclass storycenter"
		style="background-color: #191970">
		<%} 
					if((i%4)==1){
					%>
		<div class="col-lg-4 storyclass storycenter"
			style="background-color: #DC143C">
			<%} 
					if((i%4)==2){
					%>
			<div class="col-lg-4 storyclass storycenter"
				style="background-color: #EEC900">
				<%} 
					if((i%4)==3){
					%>
				<div class="col-lg-4 storyclass storycenter"
					style="background-color: #458B74">
					<%} %>
					<h3>
						<a href="#1" style="color: #ffffff"><%=key2[0] %></a>
					</h3>
					<h4>
						<a href="#2" style="color: #ffffff"><%=key2[1] %></a>
					</h4>
					<h5>
						<a href="#3" style="color: #ffffff"><%=key2[2] %></a>
					</h5>
				</div>
				<div class="col-lg-8 storybegin">
					<p class="storycenter">
						<a href="readStory.action?index=<%=ch.getId() %>"
							style="color: #000000"><%=ch.getContent() %></a>
					</p>
				</div>
			</div>
			<%} %>
		</div>
	</div>