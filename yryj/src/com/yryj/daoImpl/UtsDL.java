package com.yryj.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.yryj.dao.UtsDao;
import com.yryj.model.Uts;

public class UtsDL extends HibernateDaoSupport implements UtsDao{

	@Override
	public void save(Uts uts) {
		// TODO Auto-generated method stub
		getHibernateTemplate().setCheckWriteOperations(false);
		getHibernateTemplate().save(uts);
	}

	@Override
	public void delete(Uts uts) {
		// TODO Auto-generated method stub
		try{
			Session session=getHibernateTemplate().getSessionFactory().openSession();
			Transaction ts=session.beginTransaction();
			session.delete(uts);
			ts.commit();
			session.close();
			session=null;
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public void update(Uts uts) {
		// TODO Auto-generated method stub
		getHibernateTemplate().update(uts);
	}

	// 从用户名找所有的storyId
	@Override
	public List<?> find(int id) {
		// TODO Auto-generated method stub
		List<?> list=getHibernateTemplate().find("from uts where uId=?",id);
		if(list.size()>0)
			return list;
		else
			return null;
	}

}
