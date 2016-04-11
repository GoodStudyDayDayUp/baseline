package com.yryj.serviceImpl;

import com.yryj.dao.UtsDao;
import com.yryj.model.Uts;
import com.yryj.sercvice.UtsManager;

public class UtsML implements UtsManager{
private UtsDao utsDao=null;
	
	public void setUtsDao(UtsDao utsDao) {
		this.utsDao = utsDao;
	}

	public void save(Uts uts) {
		// TODO Auto-generated method stub
		utsDao.save(uts);
	}

	@Override
	public void delete(Uts uts) {
		// TODO Auto-generated method stub
		utsDao.delete(uts);
	}

	@Override
	public void update(Uts uts) {
		// TODO Auto-generated method stub
		utsDao.update(uts);
	}

	@Override
	public Uts find(Uts uts) {
		// TODO Auto-generated method stub
		return utsDao.find(uts);
	}

}
