package com.yryj.serviceImpl;

import com.google.code.morphia.Key;
import com.yryj.dao.RelationsDao;
import com.yryj.daoImpl.RelationsDL;
import com.yryj.model.Relations;
import com.yryj.sercvice.RelationsManager;

public class RelationsML implements RelationsManager{
private RelationsDao relationsDao = null;
	@Override
	public Key<Relations> save(Relations relation) {
		// TODO Auto-generated method stub
		relationsDao=new RelationsDL();
		return relationsDao.save(relation);
	}

	@Override
	public void update(Relations relation) {
		// TODO Auto-generated method stub
		relationsDao=new RelationsDL();
		relationsDao.update(relation);
	}

	@Override
	public Relations findById(long id) {
		// TODO Auto-generated method stub
		relationsDao=new RelationsDL();
		return relationsDao.findById(id);
	}

	@Override
	public Relations findByUserId(long userId) {
		// TODO Auto-generated method stub
		relationsDao=new RelationsDL();
		return relationsDao.findByUserId(userId);
	}

}
