package com.yryj.dao;

import com.yryj.model.Story;

public interface StoryDao {
	public void save(Story story);

	public void delete(int id);

	public void update(Story story);

	public Story find(int id);
}
