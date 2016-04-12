package com.yryj.dao;

import com.yryj.model.User;

public interface UserDao {
	public void save(User user);

	public void delete(User user);

	public void update(User user);

	public User find(User user);
}
