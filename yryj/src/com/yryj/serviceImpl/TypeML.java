package com.yryj.serviceImpl;

import com.yryj.dao.TypeDao;
import com.yryj.model.Type;
import com.yryj.sercvice.TypeManager;

public class TypeML implements TypeManager{
private TypeDao typeDao=null;
	
	public void setTypeDao(TypeDao typeDao) {
		this.typeDao = typeDao;
	}

	public void save(Type type) {
		// TODO Auto-generated method stub
		typeDao.save(type);
	}

	@Override
	public void delete(Type type) {
		// TODO Auto-generated method stub
		typeDao.delete(type);
	}

	@Override
	public void update(Type type) {
		// TODO Auto-generated method stub
		typeDao.update(type);
	}

	@Override
	public Type find(Type type) {
		// TODO Auto-generated method stub
		return typeDao.find(type);
	}

}
