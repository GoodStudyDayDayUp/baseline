package com.yryj.dao;
import java.util.List;

import com.google.code.morphia.Key;
import com.yryj.model.Chapter;

public interface ChapterDao {
	public Key<Chapter> save(Chapter chapter);

//	public void delete(long id);

	public void update(Chapter chapter);

	public Chapter find(long id);
	//��ȡĳ���½ڵ��������½�
	@SuppressWarnings("rawtypes")
	public List getChildren(long parentId);
	
	//��ȡ���û��������½�
	public List getChapterByUName(String name);
	
	//���ݸ��½ڵ�id��ȡһ�����ܻ�ӭ�Ĺ��·�֧
	public List getAStoryByTop(long id);
	
	//��ȡ�½ڵ����߶�
	public long getMaxLevel(long rootId);
	
	//��ȡ��߻��ұߵĹ���
	public List getStory(Chapter chapter,boolean left);
	
	public List getStoryBySF(String format,String style);
	
	public List getStoryByLength(long mood);
	 
}
