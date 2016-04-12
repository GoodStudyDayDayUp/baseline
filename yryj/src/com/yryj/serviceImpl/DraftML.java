package com.yryj.serviceImpl;

import com.yryj.dao.DraftDao;
import com.yryj.model.Draft;
import com.yryj.sercvice.DraftManager;

public class DraftML implements DraftManager{
private DraftDao draftDao=null;
	
	public void setDraftDao(DraftDao draftDao) {
		this.draftDao = draftDao;
	}

	public void save(Draft draft) {
		// TODO Auto-generated method stub
		draftDao.save(draft);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		draftDao.delete(id);
	}

	@Override
	public void update(Draft draft) {
		// TODO Auto-generated method stub
		draftDao.update(draft);
	}

	@Override
	public Draft find(int id) {
		// TODO Auto-generated method stub
		return draftDao.find(id);
	}

}
