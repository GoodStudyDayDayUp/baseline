package com.yryj.sercvice;

import java.util.List;

import com.yryj.model.Chapter;

@SuppressWarnings("rawtypes")
public interface ChapterManager {
	public void save(Chapter chapter);

	public void delete(long id);

	public void update(Chapter chapter);

	public Chapter find(long id);
	
	public List getChildren(long parentId);
	
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
