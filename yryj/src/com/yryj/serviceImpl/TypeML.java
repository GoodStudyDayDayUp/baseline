package com.yryj.serviceImpl;

import java.util.List;

import com.yryj.dao.TypeDao;
import com.yryj.daoImpl.TypeDL;
import com.yryj.model.Type;
import com.yryj.sercvice.TypeManager;

public class TypeML implements TypeManager{
	private TypeDao typeDao=null;

	@Override
	public void save(Type type) {
		// TODO Auto-generated method stub
		typeDao=new TypeDL();
		typeDao.save(type);
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		typeDao=new TypeDL();
		typeDao.delete(id);
	}

	@Override
	public void update(Type type) {
		// TODO Auto-generated method stub
		typeDao=new TypeDL();
		typeDao.update(type);
	}

	@Override
	public Type find(long id) {
		// TODO Auto-generated method stub
		typeDao=new TypeDL();
		return typeDao.find(id);
	}

	@Override
	public List getClassByMood(long mood) {
		// TODO Auto-generated method stub
		typeDao=new TypeDL();
		return typeDao.getClassByMood(mood);
	}


}
