package com.yryj.serviceImpl;

import java.util.List;

import com.yryj.dao.UtuDao;
import com.yryj.model.Utu;
import com.yryj.sercvice.UtuManager;

public class UtuML implements UtuManager{
private UtuDao utuDao=null;
	
	public void setUtuDao(UtuDao utuDao) {
		this.utuDao = utuDao;
	}

	public void save(Utu utu) {
		// TODO Auto-generated method stub
		utuDao.save(utu);
	}

	@Override
	public void delete(Utu utu) {
		// TODO Auto-generated method stub
		utuDao.delete(utu);
	}

	@Override
	public void update(Utu utu) {
		// TODO Auto-generated method stub
		utuDao.update(utu);
	}
	
	@Override
	public List<?> find(int id, boolean direct) {
		// TODO Auto-generated method stub
		return utuDao.find(id,direct);
	}

}
