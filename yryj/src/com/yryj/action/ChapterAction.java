package com.yryj.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.yryj.daoImpl.ChapterDL;
import com.yryj.model.Chapter;
import com.yryj.model.Story;
import com.yryj.model.Type;
import com.yryj.model.User;
import com.yryj.sercvice.ChapterManager;
import com.yryj.sercvice.StoryManager;
import com.yryj.sercvice.TypeManager;
import com.yryj.serviceImpl.ChapterML;

public class ChapterAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private Chapter chapter;
	private ChapterManager chapterManager;
	private String content;
	
	public ChapterManager getChapterManager() {
		return chapterManager;
	}
	public void setChapterManager(ChapterManager chapterManager) {
		this.chapterManager = chapterManager;
	}
	public Chapter getChapter() {
		return chapter;
	}
	public void setChapter(Chapter chapter) {
		this.chapter = chapter;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String execute() {
		try {
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	public String write()
	{
		try {
			HttpSession session=ServletActionContext.getRequest().getSession();
			User user =(User) session.getAttribute("user");
			if(user==null)
				return "error";
			chapter=new Chapter();
			chapter.setContent(content);
			chapter.setDate(System.currentTimeMillis());
			chapter.setLength("短篇");
			chapter.setUserName(user.getName());
			chapter.setViewNum(0);
			chapterManager=new ChapterML();
			chapterManager.save(chapter);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return "wrong";
		}
	}
	public String read()
	{
		try {
			chapterManager=new ChapterML();
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String getJson() throws IOException
	{
		String urlPath="getJSONList";

		 //ServerFactory.getServer(8080).start();
	    //列出原始数据
	    StringBuilder json = new StringBuilder();   
	    
	    
	    URL oracle = new URL(urlPath); 
	    URLConnection yc = oracle.openConnection(); 
	    BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream(),"UTF-8")); 
	    String inputLine = null; 
	    while ( (inputLine = in.readLine()) != null){ 
	      json.append(inputLine); 
	    } 
	    in.close(); 
	    String Strjson=json.toString();
	    System.out.println("原始数据:");
	    System.out.println(Strjson.toString());
		return SUCCESS; 

	}
	
}