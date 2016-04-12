package com.yryj.serviceImpl;

import com.yryj.dao.UserDao;
import com.yryj.model.User;
import com.yryj.sercvice.UserManager;

public class UserML implements UserManager{
private UserDao userDao=null;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void save(User user) {
		// TODO Auto-generated method stub
		userDao.save(user);
	}

	@Override
	public void delete(User user) {
		// TODO Auto-generated method stub
		userDao.delete(user);
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		userDao.update(user);
	}

	@Override
	public User find(User user) {
		// TODO Auto-generated method stub
		return userDao.find(user);
	}

}
