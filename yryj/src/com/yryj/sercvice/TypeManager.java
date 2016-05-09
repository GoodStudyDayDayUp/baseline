package com.yryj.sercvice;

import java.util.List;

import com.yryj.model.Type;

public interface TypeManager {
	public void save(Type type);

	public void delete(long id);

	public void update(Type type);

	public Type find(long id);
	
	public List getClassByMood(long mood);
}
