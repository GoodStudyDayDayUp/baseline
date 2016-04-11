package com.yryj.dao;

import com.yryj.model.Story;

public interface StoryDao {
	public void save(Story story);

	public void delete(Story story);

	public void update(Story story);

	public Story find(Story story);
}
