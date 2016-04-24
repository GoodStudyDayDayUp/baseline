package com.yryj.dao;
import java.util.List;

import com.yryj.model.Chapter;

public interface ChapterDao {
	public void save(Chapter chapter);

	public void delete(int id);

	public void update(Chapter chapter);

	public Chapter find(int id);
	//获取某父章节的所有子章节
	@SuppressWarnings("rawtypes")
	public List getChildren(Chapter parent);
}
