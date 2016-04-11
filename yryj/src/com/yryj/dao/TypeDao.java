package com.yryj.dao;

import com.yryj.model.Type;

public interface TypeDao {
	public void save(Type type);

	public void delete(Type type);

	public void update(Type type);

	public Type find(Type type);
}
