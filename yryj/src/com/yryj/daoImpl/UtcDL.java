package com.yryj.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.yryj.dao.UtcDao;
import com.yryj.model.Utc;

public class UtcDL extends HibernateDaoSupport implements UtcDao{

	@Override
	public void save(Utc utc) {
		// TODO Auto-generated method stub
		getHibernateTemplate().setCheckWriteOperations(false);
		getHibernateTemplate().save(utc);
	}

	@Override
	public void delete(Utc utc) {
		// TODO Auto-generated method stub
		try{
			Session session=getHibernateTemplate().getSessionFactory().openSession();
			Transaction ts=session.beginTransaction();
			session.delete(utc);
			ts.commit();
			session.close();
			session=null;
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public void update(Utc utc) {
		// TODO Auto-generated method stub
		getHibernateTemplate().update(utc);
	}
	
	// 从用户名查找所有的chapter
	@Override
	public List<?> find(int id) {
		// TODO Auto-generated method stub
		List<?> list=getHibernateTemplate().find("from utc where uId=?",id);
		if(list.size()>0)
			return list;
		else
			return null;
	}

}
