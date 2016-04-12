package com.yryj.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.yryj.dao.UtuDao;
import com.yryj.model.Utu;

public class UtuDL extends HibernateDaoSupport implements UtuDao{

	@Override
	public void save(Utu utu) {
		// TODO Auto-generated method stub
		getHibernateTemplate().setCheckWriteOperations(false);
		getHibernateTemplate().save(utu);
	}

	@Override
	public void delete(Utu utu) {
		// TODO Auto-generated method stub
		try{
			Session session=getHibernateTemplate().getSessionFactory().openSession();
			Transaction ts=session.beginTransaction();
			session.delete(utu);
			ts.commit();
			session.close();
			session=null;
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public void update(Utu utu) {
		// TODO Auto-generated method stub
		getHibernateTemplate().update(utu);
	}

	@Override
	// ���������1. �ҵ����Լ����� 2. �ҵ��Լ��۵��ˡ� direct=true��1�� direct=false��2
	public List<?> find(int id, boolean direct) {
		// TODO Auto-generated method stub
		List<?> l;
		if (direct){
			 l = getHibernateTemplate().find("from utu where uId=?",id);
			 return l;
		}
		else{
			l = getHibernateTemplate().find("from utu where fanId=?",id);
			return l;
		}
	}

}
