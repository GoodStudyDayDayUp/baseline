package com.yryj.sercvice;

import java.util.List;

import com.yryj.model.Type;

public interface TypeManager {
	public void save(Type type);

	public void delete(int id);

	public void update(Type type);

	public Type find(int id);
	
	public List<String> findAllFormat();                 //找到所有的format
	
	public List<String> findAllStyle(String format);     //找到当前format下的所有style
	
	public List<String> findAllLength(String style);     //找到当前style下的所有legnth
	
	public List<Type> findByFormat(String format);       //找到format对应的type集合
	
	public List<Type> findByStyle(String format,String style);   //找到format和style对应的type集合
	
	public List<Type> findByLength(String format,String style,String length);   //找到format、style和format唯一对应的type集合，此时type集合只有一个type
}
