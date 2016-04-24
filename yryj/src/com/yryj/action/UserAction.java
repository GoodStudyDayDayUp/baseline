package com.yryj.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.yryj.model.User;
import com.yryj.sercvice.UserManager;

public class UserAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private String name;
	private String password;
	private String email;
	private User user;
	private User regUser;
	private String password2;
	private UserManager userManager;
	private User thisUser;
	String WRONG = "wrong";


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

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
		if(user==null)
			user=new User();
		user.setName(name);
		user.setPassword(password);
		if(email!=null)
			user.setEmail(email);
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
			return WRONG;
		}
	}
	
	//在跳转到注册界面之前要进行的操作
	public String beforeRegister(){
		HttpSession session=ServletActionContext.getRequest().getSession();
		session.setAttribute("regmsg", "");
		session.setAttribute("webreguser", null);
		session.setAttribute("webpass2", null);
		return SUCCESS;
	}
	
	public String registerUser()
	{
		HttpSession session=ServletActionContext.getRequest().getSession();
		session.setAttribute("regmsg", "");
		user=this.getUser();
		session.setAttribute("webreguser", user);
		session.setAttribute("webpass2", password2);
		try {
			regUser=user;
			User theUser =userManager.checkLogin(user);
			if(theUser!=null){
				session.setAttribute("regmsg", "用户已存在");
				return ERROR;
			}
			if(userManager.findUserByEmail(user)!=null){
				session.setAttribute("regmsg", "邮箱已经被注册过");
				return ERROR;
			}
			userManager.save(regUser);
			session.setAttribute("webuser", regUser);
			session.setAttribute("msg", "");
			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			return WRONG;
		}
	}
	
	public String beforeLogin(){
		HttpSession session=ServletActionContext.getRequest().getSession();
		session.setAttribute("msg", "");
		session.setAttribute("webuser", null);
		return SUCCESS;
	}
	
	public String loginUser()
	{
		try {
			HttpSession session=ServletActionContext.getRequest().getSession();
			session.setAttribute("msg", "");
			user=this.getUser();
			session.setAttribute("webuser", user);
			User theUser =userManager.checkLogin(user);
			if(theUser!=null)
			{
				if(theUser.getPassword().equals(user.getPassword())){
					session.setAttribute("user", user);
					return SUCCESS;
				}
				else{
					session.setAttribute("msg", "密码错误");
					return ERROR;
				}
			}
			else{
				session.setAttribute("msg", "该用户不存在");
				return ERROR;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return WRONG;
		}
	}

	public String logout(){
		try {
			HttpSession session=ServletActionContext.getRequest().getSession();
			session.setAttribute("msg", "");
			if(userManager.checkLogin(user)!=null)
			{
				session.setAttribute("user", null);
				session.setAttribute("msg", "成功登出");
				return SUCCESS;
			}
			else
				return ERROR;
		} catch (Exception e) {
			e.printStackTrace();
			return WRONG;
		}
	}

	public String updateUser(){
		try {
			userManager.update(user);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return WRONG;
		}

	}

}
