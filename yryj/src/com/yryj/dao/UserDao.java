package com.yryj.dao;

import java.util.List;

import com.yryj.model.User;

public interface UserDao {
	public void save(User user);

	public void delete(long id);

	public void update(User user);

	public User find(long id);
	
	public User findByName(String name);
	
	public User findByEmail(String email);

	public User findByPhone(String phone);

	List<User> getAll();
}