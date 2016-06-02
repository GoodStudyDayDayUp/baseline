package com.yryj.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.yryj.model.Chapter;
import com.yryj.model.Draft;
import com.yryj.model.Relations;
import com.yryj.model.User;
import com.yryj.pub.Format;
import com.yryj.sercvice.ChapterManager;
import com.yryj.sercvice.RelationsManager;
import com.yryj.sercvice.UserManager;
import com.yryj.serviceImpl.ChapterML;
import com.yryj.serviceImpl.DraftML;
import com.yryj.serviceImpl.RelationsML;
import com.yryj.serviceImpl.UserML;


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

	public void setUserManager() {
		userManager=new UserML();
	}

	public String execute() {
		try {
			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
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
			userManager=new UserML();
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
				userManager=new UserML();
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
						session.setAttribute("msg", "密码错误");
						return ERROR;
					}
				}
				else{
					session.setAttribute("msg", "该用户不存在");
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
			userManager=new UserML();
			user=(User) session.getAttribute("user");
			if(userManager.checkLogin(user)!=null)
			{
				session.setAttribute("user", null);
				session.setAttribute("webuser", null);
				session.setAttribute("msg", "成功登出");
				return SUCCESS;
			}
			else
				return ERROR;
		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}

	//webUser看作为修改前的user，而user为修改后的user
	public String updateUser(){
		try {
			HttpSession session=ServletActionContext.getRequest().getSession();
			User lastUser=(User) session.getAttribute("webuser");
			user=(User) session.getAttribute("user");

			HttpServletRequest request=ServletActionContext.getRequest();
			String mood=request.getParameter("mood");
			int updateItem=Integer.valueOf(mood);

			userManager=new UserML();
			switch(updateItem){
			case 1:
				//修改电话
				if(user.getPhone()!=phone){
					user.setPhone(phone);
				}
				if(!user.getPhone().equals(lastUser.getPhone())){
					userManager.update(user);
					lastUser.setPhone(user.getPhone());
					session.setAttribute("webuser", lastUser);
					session.setAttribute("user", user);
					session.setAttribute("msg", "修改成功");
					return SUCCESS;
				}
				break;
			case 2:
				//修改密码
				if(user.getPassword()!=password&&password!=null&&password!=""){
					user.setPassword(password);
				}

				if(!user.getPassword().equals(lastUser.getPassword())){
					userManager.update(user);
					lastUser.setPassword(user.getPassword());
					session.setAttribute("webuser", lastUser);
					session.setAttribute("user", user);
					session.setAttribute("msg", "修改成功");
					return SUCCESS;
				}
				break;
			}


			session.setAttribute("msg", "修改项修改前后相同");
			return ERROR;
		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}

	}

	//再跳转到用户中心之前，获取用户的所有信息
	public String getAllUserData(){
		try {
			//获取用户草稿箱
			HttpSession session=ServletActionContext.getRequest().getSession();
			user=(User) session.getAttribute("user");
			List<Draft> dfs=new DraftML().findByUserId(user.getId());
			session.setAttribute("drafts", dfs);

			//获得所有的章节
			List<Chapter> chs=new ChapterML().getChapterByUName(user.getName());
			session.setAttribute("chapters", chs);

			//获得所有的关系
			RelationsManager rm=new RelationsML();
			UserManager um=new UserML();
			ArrayList<Chapter> store=(ArrayList<Chapter>) rm.getStoreChapter(user.getId());
			session.setAttribute("store", store);
			Relations relation=rm.findByUserId(user.getId());
			String[] i2uArray=new String[1];
			String[] u2iArray=new String[1];
			if(relation==null){
				i2uArray[0]="无";
				u2iArray[0]="无";
			}else{
			String i2u=relation.getI2u();
			String u2i=relation.getU2i();
			String[] i2uId=i2u.split("#");
			String[] u2iId=u2i.split("#");
			i2uArray=new String[i2uId.length];
			u2iArray=new String[u2iId.length];
			for(int i=0;i<i2uId.length;i++){
				if(i2uId[i].equals(""))
					i2uArray[i]="无";
				else
					i2uArray[i]=um.find(Integer.parseInt(i2uId[i])).getName();
			}
			for(int i=0;i<u2iId.length;i++){
				if(u2iId[i].equals(""))
					u2iArray[i]="无";
				else
					u2iArray[i]=um.find(Integer.parseInt(u2iId[i])).getName();
			}}
			session.setAttribute("i2uArray", i2uArray);
			session.setAttribute("u2iArray", u2iArray);

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}

	public String viewOthers(){
		try {
			//获取用户草稿箱
			HttpSession session=ServletActionContext.getRequest().getSession();
			userManager=new UserML();
			user=this.getUser();
			User person=userManager.checkLogin(user);

			//作品信息
			List<Chapter> chs=new ChapterML().getChapterByUName(person.getName());
			session.setAttribute("chapters", chs);

			session.setAttribute("person", person);

			//获得所有的关系
			RelationsManager rm=new RelationsML();
			UserManager um=new UserML();
			ArrayList<Chapter> store=(ArrayList<Chapter>) rm.getStoreChapter(person.getId());
			session.setAttribute("store", store);
			Relations relation=rm.findByUserId(person.getId());
			String i2uDArray[][],u2iDArray[][];
			if(relation==null){
				i2uDArray=new String[2][2];
				u2iDArray=new String[2][2];
				i2uDArray[0][0]="无";
				u2iDArray[0][0]="无";
			}else{
			String i2u=relation.getI2u();
			String u2i=relation.getU2i();
			String[] i2uArray=i2u.split("#");
			String[] u2iArray=u2i.split("#");
			i2uDArray=new String[i2uArray.length][4];
			u2iDArray=new String[u2iArray.length][4];
			for(int i=0;i<i2uArray.length;i++){
				if(i2uArray[i].equals("")){
					i2uDArray[i][0]="无";
					i2uDArray[i][1]="";
					i2uDArray[i][2]="";
					i2uDArray[i][3]="";
				}
				else{
					i2uDArray[i][0]=i2uArray[i];
					i2uDArray[i][1]=um.find(Integer.parseInt(i2uArray[i])).getName();   //姓名
					if(rm.findByUserId(Integer.parseInt(i2uArray[i])).getU2i().equals("")){
						i2uDArray[i][2]="0";
					}
					else{
						i2uDArray[i][2]=String.valueOf(rm.findByUserId(Integer.parseInt(i2uArray[i])).getU2i().split("#").length);   //粉丝数
					}
					i2uDArray[i][3]="10";
				}
			}
			for(int i=0;i<u2iArray.length;i++){
				if(u2iArray[i].equals("")){
					u2iDArray[i][0]="无";
					u2iDArray[i][1]="";
					u2iDArray[i][2]="";
					u2iDArray[i][3]="";
				}
				else{
					u2iDArray[i][0]=u2iArray[i];
					u2iDArray[i][1]=um.find(Integer.parseInt(u2iArray[i])).getName();   //姓名	
					if(rm.findByUserId(Integer.parseInt(u2iArray[i])).getU2i().equals("")){
						u2iDArray[i][2]="";
					}
					else{
						u2iDArray[i][2]=String.valueOf(rm.findByUserId(Integer.parseInt(u2iArray[i])).getU2i().split("#").length);   //粉丝数
					}
					u2iDArray[i][3]="10";
				}
			}}
			session.setAttribute("i2uDArray", i2uDArray);
			session.setAttribute("u2iDArray", u2iDArray);

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}

}
