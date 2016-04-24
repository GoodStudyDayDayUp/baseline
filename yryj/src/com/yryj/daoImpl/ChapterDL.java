package com.yryj.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.yryj.dao.ChapterDao;
import com.yryj.model.Chapter;

public class ChapterDL extends HibernateDaoSupport implements ChapterDao{

	@Override
	public void save(Chapter chapter) {
		// TODO Auto-generated method stub
		getHibernateTemplate().setCheckWriteOperations(false);
		getHibernateTemplate().save(chapter);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Chapter chapter=find(id);
		try{
			Session session=getHibernateTemplate().getSessionFactory().openSession();
			Transaction ts=session.beginTransaction();
			session.delete(chapter);
			ts.commit();
			session.close();
			session=null;
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public void update(Chapter chapter) {
		// TODO Auto-generated method stub
		getHibernateTemplate().update(chapter);
	}

	@Override
	public Chapter find(int id) {
		// TODO Auto-generated method stub
		@SuppressWarnings("rawtypes")
		List list=getHibernateTemplate().find("from Chapter where id=?",id);
		if(list.size()>0)
			return (Chapter) list.get(0);
		else
			return null;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List getChildren(Chapter parent) {
		// TODO Auto-generated method stub
		List list=getHibernateTemplate().find("from Chapter where parentId=?", parent.getId());
		if(list.size()>0)
			return list;
		else
			return null;
	}

}
