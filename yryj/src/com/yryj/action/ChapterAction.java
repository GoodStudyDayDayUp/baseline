package com.yryj.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.yryj.model.Chapter;
import com.yryj.model.Story;
import com.yryj.model.User;
import com.yryj.sercvice.ChapterManager;
import com.yryj.sercvice.StoryManager;

public class ChapterAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private ChapterManager chapterManager;
	private StoryManager storyManager;
	private Chapter chapter;
	private String filePath;
	private String content;
	private Story story;
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
			User user = (User)session.getAttribute("user");
			Chapter parent = (Chapter)session.getAttribute("chapter");
			String keyword = (String)session.getAttribute("keyword");
			Chapter chapter = new Chapter();
			filePath = chapterManager.write(content,parent);
			chapter.setContent(filePath);
			chapter.setPraise(0);
			if(user!=null)
				chapter.setUser(user);
			if(parent!=null)
				chapter.setChapter(parent);
			chapter.setIsEnd(false);
			if(keyword!=null)
				chapter.setKey(keyword);
			chapterManager.save(chapter);
			if(chapter.getChapter()==null)
			{
				story.setChapter(chapter);
				story.setType("type");
				storyManager.save(story);
			}
			return SUCCESS;
		
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	public String read()
	{
		try {
			System.out.println(chapterManager.read(1));
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String getJson() throws IOException
	{
		String urlPath="http://localhost:8080/yryj/JsonServlet.do";

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
	public Story getStory() {
		return story;
	}
	public void setStory(Story story) {
		this.story = story;
	}
	public StoryManager getStoryManager() {
		return storyManager;
	}
	public void setStoryManager(StoryManager storyManager) {
		this.storyManager = storyManager;
	}

}