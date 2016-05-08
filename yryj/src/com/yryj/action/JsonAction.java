package com.yryj.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.yryj.model.Story;
import com.yryj.sercvice.ChapterManager;
import com.yryj.sercvice.StoryManager;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonBeanProcessor;
import net.sf.json.util.PropertyFilter;
public class JsonAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private StoryManager storyManager ;
	private ChapterManager chapterManager;
	private JSONArray JSONList;
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String writeJson() throws IOException
	{
		HttpServletResponse response=ServletActionContext.getResponse();  
		  response.setContentType("text/html");  
		  PrintWriter out;  
	      out = response.getWriter();  

		  //遍历所有的故事树
		  List chapterList = new ArrayList();
		  List storyList = storyManager.findAll();
		  List storyTree = new ArrayList();
		  for(int i=0;i<storyList.size();i++)
		  {
			//  storyTree = chapterManager.getTree((Story)storyList.get(i));
			  chapterList.addAll(storyTree);
		  }
		  JsonConfig jsonConfig = new JsonConfig();  //建立配置文件
		  jsonConfig.setIgnoreDefaultExcludes(false);  //设置默认忽略
		  jsonConfig.registerJsonBeanProcessor(java.sql.Date.class, new DateJsonValueProcessor());
		  jsonConfig.setExcludes(new String[]{"chapters","chapter","story","type","multipartRequestHandler","servletWrapper"});  
		  //此处是亮点，只要将所需忽略字段加到数组中即可，在上述案例中，所要忽略的是“libs”，那么将其添到数组中即可，在实际测试中，我发现在所返回数组中，存在大量无用属性，如“multipartRequestHandler”，“servletWrapper”，那么也可以将这两个加到忽略数组中.
		  JSONList = JSONArray.fromObject(chapterList,jsonConfig);
		  
		  out.write(JSONList.toString());
		  out.flush();
		  out.close();
		return null;
	    }
	public StoryManager getStoryManager() {
		return storyManager;
	}
	public void setStoryManager(StoryManager storyManager) {
		this.storyManager = storyManager;
	}
	public ChapterManager getChapterManager() {
		return chapterManager;
	}
	public void setChapterManager(ChapterManager chapterManager) {
		this.chapterManager = chapterManager;
	}
	public JSONArray getJSONList() {
		return JSONList;
	}
	class DateJsonValueProcessor implements JsonBeanProcessor { 

		 public JSONObject processBean(Object bean, JsonConfig arg1) { 
		 JSONObject jsonObject = null; 
		         if( bean instanceof java.sql.Date ){ 
		              bean = new Date( ((java.sql.Date) bean).getTime() ); 
		         } 
		         if( bean instanceof java.sql.Timestamp ){ 
		             bean = new Date( ((java.sql.Timestamp) bean).getTime() ); 
		         } 
		         if( bean instanceof Date ){ 
		              jsonObject = new JSONObject(); 
		              jsonObject.element("time", ( (Date) bean ).getTime()); 
		         }else{ 
		              jsonObject = new JSONObject( true ); 
		         } 
		           return jsonObject; 
		        } 
		 }	

}
