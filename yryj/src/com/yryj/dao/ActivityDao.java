package com.yryj.dao;

import java.util.List;

import com.yryj.model.Activity;
import com.yryj.model.Type;

public interface ActivityDao {
	public void save(Activity act);

	public void delete(long id);

	public void update(Activity act);

	public List<Object> find(long id);
	
}
