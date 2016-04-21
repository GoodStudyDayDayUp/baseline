package com.yryj.sercvice;

import com.yryj.model.User;

public interface UserManager {
	public void save(User user);

	public void delete(int id);

	public void update(User user);

	public User find(int id);
	
	public User checkLogin(User user);
}
