package com.yryj.serviceImpl;

import com.yryj.dao.StoryDao;
import com.yryj.model.Story;
import com.yryj.sercvice.StoryManager;

public class StoryML implements StoryManager{
private StoryDao storyDao=null;
	
	public void setStoryDao(StoryDao storyDao) {
		this.storyDao = storyDao;
	}

	public void save(Story story) {
		// TODO Auto-generated method stub
		storyDao.save(story);
	}

	@Override
	public void delete(Story story) {
		// TODO Auto-generated method stub
		storyDao.delete(story);
	}

	@Override
	public void update(Story story) {
		// TODO Auto-generated method stub
		storyDao.update(story);
	}

	@Override
	public Story find(Story story) {
		// TODO Auto-generated method stub
		return storyDao.find(story);
	}

}
