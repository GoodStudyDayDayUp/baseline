package com.yryj.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.yryj.dao.ActivityDao;
import com.yryj.daoImpl.ActivityDL;
import com.yryj.model.Activity;
import com.yryj.model.Chapter;
import com.yryj.model.Draft;
import com.yryj.model.Relations;
import com.yryj.model.User;
import com.yryj.pub.Format;
import com.yryj.pub.MD5;
import com.yryj.sercvice.ActivityManager;
import com.yryj.sercvice.ChapterManager;
import com.yryj.sercvice.RelationsManager;
import com.yryj.sercvice.UserManager;
import com.yryj.serviceImpl.ActivityML;
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
	private String oldpwd;

	
	public String getOldpwd(){
		return oldpwd;
	}
	
	public void setOldpwd(String oldpwd){
		this.oldpwd=oldpwd;
	}

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
		this.password = MD5.GetMD5Code(password);
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

	/**
	 * 在跳转到注册界面之前要进行的操作
	 * @return
	 */
	public String beforeRegister(){
		HttpSession session=ServletActionContext.getRequest().getSession();
		session.setAttribute("regmsg", "");
		session.setAttribute("webreguser", null);
		session.setAttribute("webpass2", null);
		return SUCCESS;
	}

	/**
	 * 用户注册
	 * @return
	 */
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

	/**
	 * 登陆之前先清楚上一个用户的登陆信息
	 * @return
	 */
	public String beforeLogin(){
		HttpSession session=ServletActionContext.getRequest().getSession();
		session.setAttribute("msg", "");
		session.setAttribute("webuser", null);
		return SUCCESS;
	}

	/**
	 * 登陆
	 * @return
	 */
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
						
						if(Format.initPage==1)
							return "write";
						if(Format.initPage==2)
							return "head";
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

	/**
	 * 注销，注销之前要清楚系统缓存数据
	 * @return
	 */
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

	/**
	 * 更新用户信息
	 * webUser看作为修改前的user，而user为修改后的user
	 * @return
	 */
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
				String oldPass=MD5.GetMD5Code(oldpwd);
				if(!oldPass.equals(user.getPassword())){
					session.setAttribute("msg", "原密码输入错误");
					return ERROR;
				}
				//修改密码
				if(user.getPassword()!=MD5.GetMD5Code(password)&&password!=null&&password!=""){
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
			case 3:
				//修改密码
				String id=request.getParameter("id");
				if(id==null)
					return ERROR;
				long userId=(long) Format.sendEmailTooken.get(id);
				user=userManager.find(userId);
				user.setPassword(MD5.GetMD5Code(password2));
				userManager.update(user);
				session.setAttribute("user", user);
				return "mainPage";
			}


			session.setAttribute("msg", "修改项修改前后相同");
			return ERROR;
		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}

	}
	
	/**
	 * 帮助用户找回密码
	 * @return
	 */
	public String sendEmail(){
		userManager=new UserML();
		
		User user=new User();
		user.setName(name);
		user=userManager.checkLogin(user);
		
		HttpSession session=ServletActionContext.getRequest().getSession();
		if(user!=null){
			if(user.getEmail().equals(email)){
				userManager.sendEmail(user);
				session.setAttribute("msgs", "信息发送成功，请登录邮箱验证！");
				return SUCCESS;
			}else{
				session.setAttribute("msgs", "用户名和邮箱不一致！");
				return SUCCESS;
			}
		}
		session.setAttribute("msgs", "用户名不存在！");
		return SUCCESS;
	}

	/**
	 * 再跳转到用户中心之前，获取用户的所有信息
	 * @return
	 */
	public String getAllUserData(){
		try {
			//获取用户草稿箱
			HttpSession session=ServletActionContext.getRequest().getSession();
			user=(User) session.getAttribute("user");
			if(user==null)
				return Format.NF;
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
			String[][] i2uArray=new String[1][2];
			String[][] u2iArray=new String[1][2];
			if(relation==null){
				i2uArray[0][0]="无";
				u2iArray[0][0]="无";
			}else{
			String i2u=relation.getI2u();
			String u2i=relation.getU2i();
			String[] i2uId=i2u.split("#");
			String[] u2iId=u2i.split("#");
			i2uArray=new String[i2uId.length][2];
			u2iArray=new String[u2iId.length][2];
			for(int i=0;i<i2uId.length;i++){
				if(i2uId[i].equals(""))
					i2uArray[i][0]="无";
				else{
					i2uArray[i][0]=um.find(Integer.parseInt(i2uId[i])).getName();
					i2uArray[i][1]=i2uId[i];}
			}
			for(int i=0;i<u2iId.length;i++){
				if(u2iId[i].equals(""))
					u2iArray[i][0]="无";
				else{
					u2iArray[i][0]=um.find(Integer.parseInt(u2iId[i])).getName();
					u2iArray[i][1]=u2iId[i];}
			}}
			session.setAttribute("i2uArray", i2uArray);
			session.setAttribute("u2iArray", u2iArray);

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}

	/**
	 * 查看其他人的信息
	 * @return
	 */
	public String viewOthers(){
		try {
			//获取用户草稿箱
			HttpSession session=ServletActionContext.getRequest().getSession();
			User onlineUser=(User)session.getAttribute("user"); 
			userManager=new UserML();
			RelationsManager rm=new RelationsML();
			UserManager um=new UserML();
			String index="";
			user=this.getUser();
			User person=userManager.checkLogin(user);
			if(onlineUser==null){
				session.setAttribute("msg", "请先登录");
				return Format.LOGIN;
			}
			if(person!=null&&person.getId()==onlineUser.getId())
				index="0";
			else{
				Relations userRelation1=rm.findByUserId(onlineUser.getId());
				if(userRelation1==null){
					index="2";
				}
				else if(userRelation1.getI2u()==null){
					index="2";
				}
				else{
				String[] array1=userRelation1.getI2u().split("#");
				if(person!=null&&Format.findInArray(array1,String.valueOf(person.getId()))==true)
					index="1";
				else
					index="2";
				}
			}
			
			//作品信息
			List<Chapter> chs=new ChapterML().getChapterByUName(person.getName());
			session.setAttribute("chapters", chs);

			session.setAttribute("person", person);

			//获得所有的关系
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
			i2uDArray=new String[i2uArray.length][5];       //最后一列值为0,1,2,分别代表与当前在线用户相同、已被当前用户关注、未被当前用户关注
			u2iDArray=new String[u2iArray.length][5];		//最后一列值为0,1,2,分别代表与当前在线用户相同、已被当前用户关注、未被当前用户关注
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
					if(i2uArray[i].equals(String.valueOf(onlineUser.getId()))){
						i2uDArray[i][4]="0";
					}
					else{
						Relations userRelation=rm.findByUserId(onlineUser.getId());
						if(userRelation==null){
							i2uDArray[i][4]="2";
						}
						else if(userRelation.getI2u()==null){
							i2uDArray[i][4]="2";
						}
						else{
						String[] array=userRelation.getI2u().split("#");
						if(Format.findInArray(array, i2uArray[i])==true)
							i2uDArray[i][4]="1";
						else
							i2uDArray[i][4]="2";
						}
					}
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
						u2iDArray[i][2]="0";
					}
					else{
						u2iDArray[i][2]=String.valueOf(rm.findByUserId(Integer.parseInt(u2iArray[i])).getU2i().split("#").length);   //粉丝数
					}
					u2iDArray[i][3]="10";
					if(u2iArray[i].equals(String.valueOf(onlineUser.getId()))){
						u2iDArray[i][4]="0";
					}
					else{
						Relations userRelation=rm.findByUserId(onlineUser.getId());
						if(userRelation==null){
							u2iDArray[i][4]="2";
						}
						else if(userRelation.getI2u()==null){
							u2iDArray[i][4]="2";
						}
						else{
						String[] array=userRelation.getI2u().split("#");
						if(Format.findInArray(array, u2iArray[i])==true)
							u2iDArray[i][4]="1";
						else
							u2iDArray[i][4]="2";
						}
					}
				}
			}}
			session.setAttribute("i2uDArray", i2uDArray);
			session.setAttribute("u2iDArray", u2iDArray);
			session.setAttribute("index", index);

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}

}
