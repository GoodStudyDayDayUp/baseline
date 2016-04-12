package com.yryj.action;

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
			regUser=user;
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
}
