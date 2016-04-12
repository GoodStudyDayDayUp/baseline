package com.yryj.daoImpl;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.yryj.dao.TypeDao;
import com.yryj.model.Type;

public class TypeDL extends HibernateDaoSupport implements TypeDao{

	@Override
	public void save(Type type) {
		// TODO Auto-generated method stub
		getHibernateTemplate().setCheckWriteOperations(false);
		getHibernateTemplate().save(type);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Type type=find(id);
		try{
			Session session=getHibernateTemplate().getSessionFactory().openSession();
			Transaction ts=session.beginTransaction();
			session.delete(type);
			ts.commit();
			session.close();
			session=null;
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public void update(Type type) {
		// TODO Auto-generated method stub
		getHibernateTemplate().update(type);
	}

	@Override
	public Type find(int id) {
		// TODO Auto-generated method stub
		List list=getHibernateTemplate().find("from Type where id=?",id);
		if(list.size()>0)
			return (Type) list.get(0);
		else
			return null;
	}

}
