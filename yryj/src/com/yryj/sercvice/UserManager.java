package com.yryj.sercvice;

import com.yryj.model.User;

public interface UserManager {
	public void save(User user);

	public void delete(User user);

	public void update(User user);

	public User find(User user);
}
