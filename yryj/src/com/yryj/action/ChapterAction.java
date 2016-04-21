package com.yryj.action;

import java.io.FileOutputStream;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.yryj.model.Chapter;
import com.yryj.model.User;
import com.yryj.sercvice.ChapterManager;

public class ChapterAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private ChapterManager chapterManager;
	private Chapter chapter;
	private String filePath;
	private String content;
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
			filePath = chapterManager.write(content);
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

}