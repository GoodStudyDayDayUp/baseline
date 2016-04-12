package com.yryj.dao;

import com.yryj.model.Type;

public interface TypeDao {
	public void save(Type type);

	public void delete(int id);

	public void update(Type type);

	public Type find(int id);
}
