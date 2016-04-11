package com.yryj.sercvice;

import com.yryj.model.Type;

public interface TypeManager {
	public void save(Type type);

	public void delete(Type type);

	public void update(Type type);

	public Type find(Type type);
}
