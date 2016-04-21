package com.yryj.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.yryj.model.User;
import com.yryj.sercvice.UserManager;

public class UserAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private User user;
	private User regUser;
	private String password2;
	private UserManager userManager;
	private User thisUser;
	
	public User getThisUser() {
		return thisUser;
	}

	public void setThisUser(User thisUser) {
		this.thisUser = thisUser;
	}
	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public User getRegUser() {
		return regUser;
	}

	public void setRegUser(User regUser) {
		this.regUser = regUser;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}



	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}

	public String execute() {
		try {
			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	public String registerUser()
	{
		
		try {
			HttpSession session1=ServletActionContext.getRequest().getSession();
			session1.setAttribute("msg", "");
			regUser=user;
			if(userManager.checkLogin(user)!=null){
				HttpSession session=ServletActionContext.getRequest().getSession();
				session.setAttribute("msg", "用户已存在");
				return ERROR;
			}
			if(regUser.getPassword().equals(password2))
				userManager.save(regUser);
			else 
				return ERROR;
			return SUCCESS;
		
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	public String loginUser()
	{
		try {
			if(userManager.checkLogin(user)!=null)
			{
				HttpSession session=ServletActionContext.getRequest().getSession();
				session.setAttribute("user", user);
				return SUCCESS;
			}
			else
				return ERROR;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

}
