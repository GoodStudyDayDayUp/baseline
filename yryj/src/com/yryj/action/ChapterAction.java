package com.yryj.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.yryj.daoImpl.ChapterDL;
import com.yryj.model.Chapter;
import com.yryj.model.Draft;
import com.yryj.model.Story;
import com.yryj.model.Type;
import com.yryj.model.User;
import com.yryj.sercvice.ChapterManager;
import com.yryj.sercvice.StoryManager;
import com.yryj.sercvice.TypeManager;
import com.yryj.serviceImpl.ChapterML;
import com.yryj.serviceImpl.DraftML;
import com.yryj.serviceImpl.StoryML;

public class ChapterAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private Chapter chapter;
	private ChapterManager chapterManager;
	private String content;
	private String key;
	private String format;
	private String style;

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

	void getWebChapter(){
		chapter=new Chapter();
		chapter.setContent(content);
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
			getWebChapter();
			if(user==null){
				Draft df=new Draft();
				df.setContent(content);
				session.setAttribute("draft", df);
				return "login";
			}
			
			//如果是草稿箱里面的，从草稿箱中删除对应草稿
			Draft df=(Draft) session.getAttribute("draft");
			if(df!=null){
				DraftML dm =new DraftML();
				if(df.getId()>=0L){
					dm.delete(df.getId());
					chapter.setParentId(df.getParentId());
					session.setAttribute("draft", null);
				}
			}
			chapter.setUserName(user.getName());
			chapterManager=new ChapterML();
			chapterManager.save(chapter);
//			if(chapter.getParentId()==-1){
//				StoryManager sm=new StoryML();
//				Story story=new Story(new Type(format,style,"短篇"),chapter,new Date(chapter.getDate()));
//				sm.save(story);
//			}
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return "wrong";
		}
	}
	
	
	public String readStart()
	{
		try {			
			chapterManager=new ChapterML();
			//获取所有的开头
			List<Chapter> storys=chapterManager.getChildren(-1);
			HttpSession session=ServletActionContext.getRequest().getSession();
			session.setAttribute("storys", storys);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String readStory(){
		try {			
			chapterManager=new ChapterML();
			//获取开头
			HttpServletRequest request=ServletActionContext.getRequest();
			String is=request.getParameter("index");
			long index=Long.valueOf(is);	
			
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
}