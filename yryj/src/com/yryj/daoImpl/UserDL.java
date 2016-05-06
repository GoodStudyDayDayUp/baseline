package com.yryj.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.yryj.dao.UserDao;
import com.yryj.model.User;

public class UserDL extends HibernateDaoSupport implements UserDao{

	@Override
	public void save(User user) {
		// TODO Auto-generated method stub
		getHibernateTemplate().setCheckWriteOperations(false);
		getHibernateTemplate().save(user);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		User user=find(id);
		try{
			Session session=getHibernateTemplate().getSessionFactory().openSession();
			Transaction ts=session.beginTransaction();
			session.delete(user);
			ts.commit();
			session.close();
			session=null;
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		try{
			Session session=getHibernateTemplate().getSessionFactory().openSession();
			Transaction ts=session.beginTransaction();
			session.update(user);
			ts.commit();
			session.close();
			session=null;
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public User find(int id) {
		// TODO Auto-generated method stub
		@SuppressWarnings("rawtypes")
		List list=getHibernateTemplate().find("from User where id=?",id);
		if(list.size()>0)
			return (User) list.get(0);
		else
			return null;
	}

	public User findByName(String name)
	{
		@SuppressWarnings("rawtypes")
		List list=getHibernateTemplate().find("from User where name=?",name);
		if(list.size()>0)
			return (User) list.get(0);
		else
			return null;
	}

	@Override
	public User findByEmail(String email) {
		// TODO Auto-generated method stub
		@SuppressWarnings("rawtypes")
		List list=getHibernateTemplate().find("from User where email=?",email);
		if(list.size()>0)
			return (User) list.get(0);
		else
			return null;
	}

	@Override
	public User findByPhone(String phone) {
		// TODO Auto-generated method stub
		@SuppressWarnings("rawtypes")
		List list=getHibernateTemplate().find("from User where phone=?",phone);
		if(list.size()>0)
			return (User) list.get(0);
		else
			return null;
	}
}
