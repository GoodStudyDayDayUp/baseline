package com.yryj.sercvice;

import com.yryj.model.User;

public interface UserManager {
	public void save(User user);

	public void delete(long id);

	public void update(User user);

	public User find(long id);
	
	public User checkLogin(User user);
	
	public User findUserByEmail(User user);
	
	public User findUserByPhone(User user);
	
	public void sendEmail(User user);
}
