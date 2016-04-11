package com.yryj.serviceImpl;

import com.yryj.dao.ChapterDao;
import com.yryj.model.Chapter;
import com.yryj.sercvice.ChapterManager;

public class ChapterML implements ChapterManager{
private ChapterDao chapterDao=null;
	
	public void setChapterDao(ChapterDao chapterDao) {
		this.chapterDao = chapterDao;
	}

	public void save(Chapter chapter) {
		// TODO Auto-generated method stub
		chapterDao.save(chapter);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		chapterDao.delete(id);
	}

	@Override
	public void update(Chapter chapter) {
		// TODO Auto-generated method stub
		chapterDao.update(chapter);
	}

	@Override
	public Chapter find(int id) {
		// TODO Auto-generated method stub
		return chapterDao.find(id);
	}

}
