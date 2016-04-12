package com.yryj.sercvice;

import com.yryj.model.Type;

public interface TypeManager {
	public void save(Type type);

	public void delete(int id);

	public void update(Type type);

	public Type find(int id);
}
