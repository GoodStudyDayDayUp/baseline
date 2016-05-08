package com.yryj.serviceImpl;

import java.util.List;

import com.yryj.dao.DraftDao;
import com.yryj.daoImpl.DraftDL;
import com.yryj.model.Draft;
import com.yryj.sercvice.DraftManager;

public class DraftML implements DraftManager{
private DraftDao draftDao=null;


	public void save(Draft draft) {
		// TODO Auto-generated method stub
		draftDao = new DraftDL();
		draftDao.save(draft);
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		draftDao = new DraftDL();
		draftDao.delete(id);
	}

	@Override
	public void update(Draft draft) {
		// TODO Auto-generated method stub
		draftDao = new DraftDL();
		draftDao.update(draft);
	}

	@Override
	public Draft findById(long id) {
		// TODO Auto-generated method stub
		draftDao = new DraftDL();
		return draftDao.findById(id);
	}

	@Override
	public List findByUserId(long id) {
		// TODO Auto-generated method stub
		draftDao = new DraftDL();
		return draftDao.findByUserId(id);
	}
	
	

}
