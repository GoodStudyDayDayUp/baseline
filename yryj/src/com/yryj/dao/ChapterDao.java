package com.yryj.dao;
import com.yryj.model.Chapter;

public interface ChapterDao {
	public void save(Chapter chapter);

	public void delete(int id);

	public void update(Chapter chapter);

	public Chapter find(int id);
}
