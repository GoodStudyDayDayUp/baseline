package com.yryj.serviceImpl;

import com.yryj.dao.UtcDao;
import com.yryj.model.Utc;
import com.yryj.sercvice.UtcManager;

public class UtcML implements UtcManager{
private UtcDao utcDao=null;
	
	public void setUtcDao(UtcDao utcDao) {
		this.utcDao = utcDao;
	}

	public void save(Utc utc) {
		// TODO Auto-generated method stub
		utcDao.save(utc);
	}

	@Override
	public void delete(Utc utc) {
		// TODO Auto-generated method stub
		utcDao.delete(utc);
	}

	@Override
	public void update(Utc utc) {
		// TODO Auto-generated method stub
		utcDao.update(utc);
	}

	@Override
	public Utc find(Utc utc) {
		// TODO Auto-generated method stub
		return utcDao.find(utc);
	}

}
