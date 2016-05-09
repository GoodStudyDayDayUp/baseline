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
	
	//���ݸ��½ڵ�id��ȡһ�����ܻ�ӭ�Ĺ��·�֧
	public List getAStoryByTop(long id);
	
	//��ȡ�½ڵ����߶�
	public long getMaxLevel(long rootId);
	
	//��ȡ��߻��ұߵĹ���
	public List getStory(Chapter chapter,boolean left);
	
	public List getStoryBySF(String format,String style);
	
	public List getStoryByLength(long mood);
}
