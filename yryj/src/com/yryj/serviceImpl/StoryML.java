package com.yryj.serviceImpl;

import java.util.List;

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
	public void delete(int id) {
		// TODO Auto-generated method stub
		storyDao.delete(id);
	}

	@Override
	public void update(Story story) {
		// TODO Auto-generated method stub
		storyDao.update(story);
	}

	@Override
	public Story find(int id) {
		// TODO Auto-generated method stub
		return storyDao.find(id);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return storyDao.findAll();
	}

}
