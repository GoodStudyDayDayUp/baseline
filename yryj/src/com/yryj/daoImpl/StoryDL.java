package com.yryj.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
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
		@SuppressWarnings("rawtypes")
		List list=getHibernateTemplate().find("from Story where id=?",id);
		if(list.size()>0)
			return (Story) list.get(0);
		else
			return null;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		try{
			Session session=getHibernateTemplate().getSessionFactory().openSession();
			Transaction ts=session.beginTransaction();
			Query query=session.createQuery("from Story order by id desc");
			List list=query.list();
			ts.commit();
			session.close();
			session=null;
			return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
}
