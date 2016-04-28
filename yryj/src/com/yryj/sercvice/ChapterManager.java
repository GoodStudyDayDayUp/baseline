package com.yryj.sercvice;

import java.util.List;

import com.yryj.model.Chapter;
import com.yryj.model.Story;
@SuppressWarnings("rawtypes")
public interface ChapterManager {
	public void save(Chapter chapter);

	public void delete(int id);

	public void update(Chapter chapter);

	public Chapter find(int id);

	public String write(String content,Chapter parent);
	
	public String read(int id);
	
	public List getTree(Story story);
	
	public List getChildren(Chapter chapter);
}
