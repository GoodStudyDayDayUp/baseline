package com.yryj.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.yryj.dao.ActivityDao;
import com.yryj.dao.TypeDao;
import com.yryj.dao.UserDao;
import com.yryj.daoImpl.ActivityDL;
import com.yryj.daoImpl.TypeDL;
import com.yryj.daoImpl.UserDL;
import com.yryj.model.Activity;
import com.yryj.model.Type;
import com.yryj.model.User;
import com.yryj.pub.Format;

public class ManageAction extends ActionSupport {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	public String execute() {
		try {
			TypeDao typeDao = new TypeDL();
			ActivityDao activityDao = new ActivityDL();
			UserDao userDao = new UserDL();
			HttpSession session = ServletActionContext.getRequest()
					.getSession();
			ArrayList<Type> types1 = (ArrayList<Type>) typeDao
					.getClassByMood(1);
			ArrayList<Type> types2 = (ArrayList<Type>) typeDao
					.getClassByMood(2);
			List<Activity> activities = activityDao.getAll();
			List<User> allUsers = userDao.getAll();
			session.setAttribute("allUsers", allUsers);
			session.setAttribute("activities", activities);
			session.setAttribute("types1", types1);
			session.setAttribute("types2", types2);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}

	public String addNewClass() {
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			TypeDao typeDao = new TypeDL();
			Type type = new Type();
			type.setContent(request.getParameter("className"));
			type.setMood(Long.parseLong(request.getParameter("mode")));
			typeDao.save(type);
			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}
	
	public String updateClass() {
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			TypeDao typeDao = new TypeDL();
			String location = request.getParameter("location");
			String[] str = location.split("_");
			Type type = typeDao.findByMoodAndIndex(Long.parseLong(str[0]), Integer.parseInt(str[1]));
			type.setContent(request.getParameter("className"));
			typeDao.update(type);
			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}
	
	public String updateActivity() {
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			ActivityDao activityDao = new ActivityDL();
			String name = request.getParameter("name");
			String pic = request.getParameter("pic");
			String host = request.getParameter("host");
			String url = request.getParameter("url");
			String id = request.getParameter("id");
			String status = request.getParameter("status");
			if(status!=null){
				Activity activity = activityDao.find(Long.parseLong(id));
				activity.setState(Integer.parseInt(status));
				activityDao.update(activity);
			}
			else if(activityDao.find(Long.parseLong(id))!=null){
				Activity activity =  activityDao.find(Long.parseLong(id));
				activity.setName(name);
				activity.setOwner(host);
				activity.setPic(pic);
				activity.setUrl(url);
				activityDao.update(activity);
			}
			else{
				Activity activity = new Activity();
				activity.setName(name);
				activity.setOwner(host);
				activity.setPic(pic);
				activity.setUrl(url);
				activity.setState(1);
				activityDao.save(activity);
			}	
			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}
	
	public String updateUserMg() {
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			UserDao userDao = new UserDL();
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			if(userDao.find(Long.parseLong(id))!=null){
				User user =  userDao.find(Long.parseLong(id));
				user.setName(name);
				user.setEmail(email);
				user.setPhone(phone);
				userDao.update(user);
			}
			else{
				User user = new User();
				user.setName(name);
				user.setEmail(email);
				user.setPhone(phone);
				userDao.save(user);
			}	
			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}
	
	public String deleteUserMg() {
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			UserDao userDao = new UserDL();
			String id = request.getParameter("id");
			userDao.delete(Long.parseLong(id));
			System.out.println(id);
			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}
}
