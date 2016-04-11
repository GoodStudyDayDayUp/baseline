package com.yryj.sercvice;

import com.yryj.model.Story;

public interface StoryManager {
	public void save(Story story);

	public void delete(Story story);

	public void update(Story story);

	public Story find(Story story);
}
