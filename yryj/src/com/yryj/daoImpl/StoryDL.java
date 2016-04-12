package com.yryj.daoImpl;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.yryj.dao.StoryDao;
import com.yryj.model.Story;

public class StoryDL extends HibernateDaoSupport implements StoryDao{

	@Override
	public void save(Story story) {
		// TODO Auto-generated method stub
		getHibernateTemplate().setCheckWriteOperations(false);
		getHibernateTemplate().save(story);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Story story=find(id);
		try{
			Session session=getHibernateTemplate().getSessionFactory().openSession();
			Transaction ts=session.beginTransaction();
			session.delete(story);
			ts.commit();
			session.close();
			session=null;
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public void update(Story story) {
		// TODO Auto-generated method stub
		getHibernateTemplate().update(story);
	}

	@Override
	public Story find(int id) {
		// TODO Auto-generated method stub
		List list=getHibernateTemplate().find("from Story where id=?",id);
		if(list.size()>0)
			return (Story) list.get(0);
		else
			return null;
	}

}
