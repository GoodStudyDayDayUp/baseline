package com.yryj.dao;
import java.util.List;

import com.google.code.morphia.Key;
import com.yryj.model.Chapter;

public interface ChapterDao {
	public Key<Chapter> save(Chapter chapter);

	public void delete(long id);

	public void update(Chapter chapter);

	public Chapter find(long id);
	//��ȡĳ���½ڵ��������½�
	@SuppressWarnings("rawtypes")
	public List getChildren(Chapter parent);
}
