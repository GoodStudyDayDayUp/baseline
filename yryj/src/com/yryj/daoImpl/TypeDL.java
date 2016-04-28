package com.yryj.daoImpl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.yryj.dao.TypeDao;
import com.yryj.model.Type;

public class TypeDL extends HibernateDaoSupport implements TypeDao{

	
	@Override
	public void save(Type type) {
		// TODO Auto-generated method stub
		getHibernateTemplate().setCheckWriteOperations(false);
		getHibernateTemplate().save(type);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Type type=find(id);
		try{
			Session session=getHibernateTemplate().getSessionFactory().openSession();
			Transaction ts=session.beginTransaction();
			session.delete(type);
			ts.commit();
			session.close();
			session=null;
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public void update(Type type) {
		// TODO Auto-generated method stub
		getHibernateTemplate().update(type);
	}

	@Override
	public Type find(int id) {
		// TODO Auto-generated method stub
		@SuppressWarnings("rawtypes")
		List list=getHibernateTemplate().find("from Type where id=?",id);
		if(list.size()>0)
			return (Type) list.get(0);
		else
			return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	//鎵惧埌鎵�湁鐨刦ormat
	public List<String> findAllFormat() {
		List<Type> list= (List<Type>)getHibernateTemplate().find("from Type");
		List<String> formatList=new ArrayList<String>();
		for(int i=0;i<list.size();i++){
			formatList.add(((Type)list.get(i)).getFormat());
		}
		List<String> newList=removeDuplicate(formatList);    //鍒犻櫎鐩稿悓鍚嶇О
		if(newList.size()>0)
			return newList;
		else
			return null;
	}
	
	
	@Override
	//鎵惧埌褰撳墠format涓嬬殑鎵�湁style
	public List<String> findAllStyle(String format) {
		@SuppressWarnings("unchecked")
		List<Type> list=(List<Type>) getHibernateTemplate().find("from Type where format=?",format);
		List<String> styleList=new ArrayList<String>();
		for(int i=0;i<list.size();i++){
			styleList.add(((Type)list.get(i)).getStyle());
		}
		List<String> newList=removeDuplicate(styleList);    //鍒犻櫎鐩稿悓鍚嶇О
		if(newList.size()>0)
			return newList;
		else
			return null;
	}
	
	
	@Override
	//鎵惧埌褰撳墠style涓嬬殑鎵�湁legnth
	public List<String> findAllLength(String style) {
		@SuppressWarnings("unchecked")
		List<Type> list=(List<Type>) getHibernateTemplate().find("from Type where style=?",style);
		List<String> lengthList=new ArrayList<String>();
		for(int i=0;i<list.size();i++){
			lengthList.add(((Type)list.get(i)).getLength());
		}
		List<String> newList=removeDuplicate(lengthList);    //鍒犻櫎鐩稿悓鍚嶇О
		if(newList.size()>0)
			return newList;
		else
			return null;
	}
	
	
	public List<String>  removeDuplicate(List<String> list)  {     
	    HashSet<String> h  =   new  HashSet<String>(list);     
	    list.clear();     
	    list.addAll(h);     
	    return list;     
	}   
	
	
	//鎵惧埌format瀵瑰簲鐨則ype闆嗗悎
	public List<Type> findByFormat(String format){
		@SuppressWarnings("unchecked")
		List<Type> list=(List<Type>) getHibernateTemplate().find("from Type where format=?",format);
		if(list.size()>0)
			return list;
		else
			return null;
	}
	
	
	//鎵惧埌format鍜宻tyle瀵瑰簲鐨則ype闆嗗悎
	public List<Type> findByStyle(String format,String style){
		List<Type> list = new ArrayList<Type>();
		List<Type> formatList=findByFormat(format);
		for(int i=0;i<formatList.size();i++){
			if(((Type)formatList.get(i)).getStyle().equals(style))
				list.add((Type)formatList.get(i));
		}
		if(list.size()>0)
			return list;
		else
			return null;
	}
	
	
	//鎵惧埌format銆乻tyle鍜宖ormat鍞竴瀵瑰簲鐨則ype闆嗗悎锛屾鏃秚ype闆嗗悎鍙湁涓�釜type
	public Type findByLength(String format,String style,String length){
		List<Type> list = new ArrayList<Type>();
		List<Type> styleList=findByStyle(format,style);
		for(int i=0;i<styleList.size();i++){
			if(((Type)styleList.get(i)).getLength().equals(length))
				list.add((Type)styleList.get(i));
		}
		return list.get(0);
	}
}
