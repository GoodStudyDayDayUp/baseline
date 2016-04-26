package com.yryj.sercvice;

import java.util.List;

import com.yryj.model.Story;

public interface StoryManager {
	public void save(Story story);

	public void delete(int id);

	public void update(Story story);

	public Story find(int id);
	
	@SuppressWarnings("rawtypes")
	public List findAll();
}
