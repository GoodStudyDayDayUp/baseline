package com.yryj.serviceImpl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import com.yryj.action.ChapterAction;
import com.yryj.dao.ChapterDao;
import com.yryj.daoImpl.ChapterDL;
import com.yryj.model.Chapter;
import com.yryj.sercvice.ChapterManager;
@SuppressWarnings("rawtypes")
public class ChapterML implements ChapterManager{
	private ChapterDao chapterDao=null;
	
	public void save(Chapter chapter) {
		// TODO Auto-generated method stub
		chapterDao = new ChapterDL();
		chapterDao.save(chapter);
	}

//	@Override
//	public void delete(long id) {
//		// TODO Auto-generated method stub
//		chapterDao = new ChapterDL();
//		chapterDao.delete(id);
//	}

	@Override
	public void update(Chapter chapter) {
		// TODO Auto-generated method stub
		chapterDao = new ChapterDL();
		chapterDao.update(chapter);
	}

	@Override
	public Chapter find(long id) {
		// TODO Auto-generated method stub
		chapterDao = new ChapterDL();
		return chapterDao.find(id);
	}
	

	@Override
	public List getChildren(long parentId) {
		// TODO Auto-generated method stub
		chapterDao = new ChapterDL();
		return chapterDao.getChildren(parentId);
	}

	@Override
	public List getChapterByUName(String name) {
		// TODO Auto-generated method stub
		chapterDao = new ChapterDL();
		return chapterDao.getChapterByUName(name);
	}

	@Override
	public List getAStoryByTop(long id) {
		// TODO Auto-generated method stub
		chapterDao = new ChapterDL();
		return chapterDao.getAStoryByTop(id);
	}

	@Override
	public long getMaxLevel(long rootId) {
		// TODO Auto-generated method stub
		chapterDao = new ChapterDL();
		return chapterDao.getMaxLevel(rootId);
	}


	@Override
	public List getStory(Chapter chapter, boolean left) {
		// TODO Auto-generated method stub
		chapterDao = new ChapterDL();
		return chapterDao.getStory(chapter, left);
	}

	@Override
	public List getStoryBySF(String format, String style) {
		// TODO Auto-generated method stub
		chapterDao = new ChapterDL();
		return chapterDao.getStoryBySF(format, style);
	}

	@Override
	public List getStoryByLength(long mood) {
		// TODO Auto-generated method stub
		chapterDao = new ChapterDL();
		return chapterDao.getStoryByLength(mood);
	}
	
}
