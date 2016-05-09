package com.yryj.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.yryj.model.Chapter;
import com.yryj.model.Draft;
import com.yryj.model.User;
import com.yryj.pub.Format;
import com.yryj.sercvice.UserManager;
import com.yryj.serviceImpl.ChapterML;
import com.yryj.serviceImpl.DraftML;


public class UserAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private String name;
	private String password;
	private String email;
	private String phone;
	private User user;
	private User regUser;
	private String password2;
	private UserManager userManager;
	private User thisUser;


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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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
		user.setPhone(phone);
		if(email!=null)
			user.setEmail(email);
		//		if(phone!=null)
		//			user.setPhone(phone);
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
			return Format.WRONG;
		}
	}

	//����ת��ע�����֮ǰҪ���еĲ���
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
				session.setAttribute("regmsg", "�û��Ѵ���");
				return ERROR;
			}
			if(userManager.findUserByEmail(user)!=null){
				session.setAttribute("regmsg", "�����Ѿ���ע���");
				return ERROR;
			}
			userManager.save(regUser);
			session.setAttribute("webuser", regUser);
			session.setAttribute("msg", "");
			session.setAttribute("regmsg", "");
			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
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
			user=this.getUser();
			if(user.getName()!=null&&user.getName()!=""){
				HttpSession session=ServletActionContext.getRequest().getSession();
				session.setAttribute("msg", "");
				session.setAttribute("webuser", user);
				User theUser =userManager.checkLogin(user);
				if(theUser!=null)
				{
					if(theUser.getPassword().equals(user.getPassword())){
						session.setAttribute("user", theUser);
						session.setAttribute("msg", "");
						session.setAttribute("webuser", user);
						
						
						return SUCCESS;
					}
					else{
						session.setAttribute("msg", "�������");
						return ERROR;
					}
				}
				else{
					session.setAttribute("msg", "���û�������");
					return ERROR;
				}
			}
			return ERROR;
		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}

	public String logout(){
		try {
			HttpSession session=ServletActionContext.getRequest().getSession();
			session.setAttribute("msg", "");
			if(userManager.checkLogin(user)!=null)
			{
				session.setAttribute("user", null);
				session.setAttribute("webuser", null);
				session.setAttribute("msg", "�ɹ��ǳ�");
				return SUCCESS;
			}
			else
				return ERROR;
		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}

	//webUser����Ϊ�޸�ǰ��user����userΪ�޸ĺ��user
	public String updateUser(){
		try {
			HttpSession session=ServletActionContext.getRequest().getSession();
			User lastUser=(User) session.getAttribute("webuser");
			user=(User) session.getAttribute("user");
			//�޸�����
			if(user.getPassword()!=password&&password!=null&&password!=""){
				user.setPassword(password);
			}
			//�޸ĵ绰
			if(user.getPhone()!=phone&&phone!=null&&phone!=""){
				user.setPhone(phone);
			}
			//�Ƿ�Ϊ�����������
			if(!user.getPassword().equals(lastUser.getPassword())||!user.getPhone().equals(lastUser.getPhone())){
				userManager.update(user);
				lastUser.setPassword(user.getPassword());
				lastUser.setPhone(user.getPhone());
				session.setAttribute("webuser", lastUser);
				session.setAttribute("user", user);
				session.setAttribute("msg", "�޸ĳɹ�");
				return SUCCESS;
			}else{
				session.setAttribute("msg", "�޸����޸�ǰ����ͬ");
				return ERROR;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}

	}
	
	//����ת���û�����֮ǰ����ȡ�û���������Ϣ
	public String getAllUserData(){
		try {
			//��ȡ�û��ݸ���
			HttpSession session=ServletActionContext.getRequest().getSession();
			user=(User) session.getAttribute("user");
			List<Draft> dfs=new DraftML().findByUserId(user.getId());
			session.setAttribute("drafts", dfs);
			
			List<Chapter> chs=new ChapterML().getChapterByUName(name);
			session.setAttribute("chapters", chs);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}

}
