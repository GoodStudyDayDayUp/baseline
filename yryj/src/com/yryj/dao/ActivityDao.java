package com.yryj.dao;

import java.util.List;
import java.util.Map;

import com.yryj.model.Activity;
import com.yryj.model.Type;

public interface ActivityDao {
	public void save(Activity act);

	public void delete(long id);

	public void update(Activity act);

	public Map<String,Object> find(long id);
	
	public List<Activity> getAll();
	
	
}
