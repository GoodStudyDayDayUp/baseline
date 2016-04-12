package com.yryj.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.yryj.dao.OrderDao;
import com.yryj.model.Order;

public class OrderDL extends HibernateDaoSupport implements OrderDao{

	public void save(Order order) {
		// TODO Auto-generated method stub
		getHibernateTemplate().setCheckWriteOperations(false);
		getHibernateTemplate().save(order);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Order order=find(id);
		try{
			Session session=getHibernateTemplate().getSessionFactory().openSession();
			Transaction ts=session.beginTransaction();
			session.delete(order);
			ts.commit();
			session.close();
			session=null;
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public void update(Order order) {
		// TODO Auto-generated method stub
		getHibernateTemplate().update(order);
	}

	@Override
	public Order find(int id) {
		// TODO Auto-generated method stub
		@SuppressWarnings("rawtypes")
		List list=getHibernateTemplate().find("from Order where id=?",id);
		if(list.size()>0)
			return (Order) list.get(0);
		else
			return null;
	}

}
