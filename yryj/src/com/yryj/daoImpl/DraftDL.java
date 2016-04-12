package com.yryj.daoImpl;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.yryj.dao.DraftDao;
import com.yryj.model.Draft;

public class DraftDL extends HibernateDaoSupport implements DraftDao{

	@Override
	public void save(Draft draft) {
		// TODO Auto-generated method stub
		getHibernateTemplate().setCheckWriteOperations(false);
		getHibernateTemplate().save(draft);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Draft draft=find(id);
		try{
			Session session=getHibernateTemplate().getSessionFactory().openSession();
			Transaction ts=session.beginTransaction();
			session.delete(draft);
			ts.commit();
			session.close();
			session=null;
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public void update(Draft draft) {
		// TODO Auto-generated method stub
		getHibernateTemplate().update(draft);
	}

	@Override
	public Draft find(int id) {
		// TODO Auto-generated method stub
		@SuppressWarnings("rawtypes")
		List list=getHibernateTemplate().find("from Draft where id=?",id);
		if(list.size()>0)
			return (Draft) list.get(0);
		else
			return null;
	}

}
