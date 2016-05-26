package com.yryj.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.yryj.model.Draft;
import com.yryj.model.User;
import com.yryj.pub.Format;
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
			
			dm =new DraftML();
			draft=new Draft();
			draft.setContent(content);			
			if(user==null){
				session.setAttribute("draft", draft);
				return ERROR;
			}
			
			//¸üÐÂ²Ý¸åÏä
			if(draft.getUserId()!=-1){
				dm.update(draft);
				return SUCCESS;
			}
			draft.setUserId(user.getId());
			dm.save(draft);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}
	
	public String readDraft(){
		try {
			HttpSession session=ServletActionContext.getRequest().getSession();
			User user =(User) session.getAttribute("user");
			HttpServletRequest request=ServletActionContext.getRequest();
			String is=request.getParameter("index");
			int index=Integer.valueOf(is);		
			if(user==null)
				return ERROR;
			List<Draft> dfs=(List<Draft>) session.getAttribute("drafts");
			draft=dfs.get(index);
			session.setAttribute("draft", draft);
			if(draft.getParentId()==-1)
				return "create";
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}
	
	public String deleteDraft(){
		try {
			HttpSession session=ServletActionContext.getRequest().getSession();
			draft=(Draft) session.getAttribute("draft");
			if(draft!=null){
				if(draft.getId()>=0L){
					dm =new DraftML();
					dm.delete(draft.getId());
					session.setAttribute("draft", null);
					session.setAttribute("drafts", dm.findByUserId(draft.getUserId()));
				}
			}
			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}
	

}
