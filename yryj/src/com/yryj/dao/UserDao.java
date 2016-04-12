package com.yryj.dao;

import com.yryj.model.User;

public interface UserDao {
	public void save(User user);

	public void delete(int id);

	public void update(User user);

	public User find(int id);
}
