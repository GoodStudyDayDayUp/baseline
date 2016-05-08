package com.yryj.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.yryj.model.Draft;
import com.yryj.model.User;
import com.yryj.sercvice.DraftManager;
import com.yryj.serviceImpl.ChapterML;
import com.yryj.serviceImpl.DraftML;

public class DraftAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	Draft draft;
	String content;
	DraftManager dm;
	
	public Draft getDraft() {
		return draft;
	}
	public void setDraft(Draft draft) {
		this.draft = draft;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String saveDraft(){
		try {
			HttpSession session=ServletActionContext.getRequest().getSession();
			User user =(User) session.getAttribute("user");
			if(user==null)
				return ERROR;
			
			dm =new DraftML();
			draft=new Draft();
			draft.setContent(content);
			draft.setUserId(user.getId());
			dm.save(draft);
			
			List<Draft> dfs=dm.findByUserId(user.getId());
			session.setAttribute("drafts", dfs);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return "wrong";
		}
	}
	
	public String readDraft(){
		try {
			HttpSession session=ServletActionContext.getRequest().getSession();
			User user =(User) session.getAttribute("user");
//			HttpRequest request=session.get
//			String 
			if(user==null)
				return ERROR;
			
			dm =new DraftML();
			draft=new Draft();
			draft.setContent(content);
			draft.setUserId(user.getId());
			dm.save(draft);
			
			List<Draft> dfs=dm.findByUserId(user.getId());
			session.setAttribute("drafts", dfs);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return "wrong";
		}
	}

}
