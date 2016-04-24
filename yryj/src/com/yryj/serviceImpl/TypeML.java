package com.yryj.serviceImpl;

import java.util.List;

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
	public void delete(int id) {
		// TODO Auto-generated method stub
		typeDao.delete(id);
	}

	@Override
	public void update(Type type) {
		// TODO Auto-generated method stub
		typeDao.update(type);
	}

	@Override
	public Type find(int id) {
		// TODO Auto-generated method stub
		return typeDao.find(id);
	}

	
	public List<String> findAllFormat(){
		return typeDao.findAllFormat();
	}
	
	
	public List<String> findAllStyle(String format){
		return typeDao.findAllStyle(format);
	}
	
	
	public List<String> findAllLength(String style){
		return typeDao.findAllLength(style);
	}
	
	
	public List<Type> findByFormat(String format){
		return typeDao.findByFormat(format);
	}
	
	
	public List<Type> findByStyle(String format,String style){
		return typeDao.findByStyle(format,style);
	}
	
	
	public List<Type> findByLength(String format,String style,String length){
		return typeDao.findByLength(format,style,length);
	}
}
