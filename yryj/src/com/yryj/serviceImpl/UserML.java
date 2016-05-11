package com.yryj.serviceImpl;

import com.yryj.dao.UserDao;
import com.yryj.daoImpl.UserDL;
import com.yryj.model.User;
import com.yryj.sercvice.UserManager;

public class UserML implements UserManager{
private UserDao userDao=null;

	public void save(User user) {
		// TODO Auto-generated method stub
		userDao=new UserDL();
		userDao.save(user);
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		userDao=new UserDL();
		userDao.delete(id);
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		userDao=new UserDL();
		userDao.update(user);
	}

	@Override
	public User find(long id) {
		// TODO Auto-generated method stub
		userDao=new UserDL();
		return userDao.find(id);
	}

	@Override
	public User checkLogin(User user) {
		// TODO Auto-generated method stub
		userDao=new UserDL();
		return userDao.findByName(user.getName());
	}

	@Override
	public User findUserByEmail(User user) {
		// TODO Auto-generated method stub
		userDao=new UserDL();
		return userDao.findByEmail(user.getEmail());
	}

	@Override
	public User findUserByPhone(User user) {
		// TODO Auto-generated method stub
		userDao=new UserDL();
		return userDao.findByPhone(user.getPhone());
	}


}
