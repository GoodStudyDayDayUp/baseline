package com.yryj.dao;
import java.util.List;

import com.google.code.morphia.Key;
import com.yryj.model.Chapter;

public interface ChapterDao {
	public Key<Chapter> save(Chapter chapter);

//	public void delete(long id);

	public void update(Chapter chapter);

	public Chapter find(long id);
	//获取某父章节的所有子章节
	@SuppressWarnings("rawtypes")
	public List getChildren(long parentId);
	
	//获取该用户的所有章节
	public List getChapterByUName(String name);
	
	//根据根章节的id获取一个最受欢迎的故事分支
	public List getAStoryByTop(long id);
	
	//获取章节的最大高度
	public long getMaxLevel(long rootId);
	
	//获取左边或右边的故事
	public List getStory(Chapter chapter,boolean left);
	
	public List getStoryBySF(String format,String style);
	
	public List getStoryByLength(long mood);
	 
}
