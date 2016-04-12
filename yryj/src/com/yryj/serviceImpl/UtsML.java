package com.yryj.serviceImpl;

import java.util.List;

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
	public List<?>  find(int id) {
		// TODO Auto-generated method stub
		return utsDao.find(id);
	}

}
