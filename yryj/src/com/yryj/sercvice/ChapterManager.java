package com.yryj.sercvice;

import com.yryj.model.Chapter;

public interface ChapterManager {
	public void save(Chapter chapter);

	public void delete(int id);

	public void update(Chapter chapter);

	public Chapter find(int id);

	public String write(String content);
	
	public String read(int id);
}
