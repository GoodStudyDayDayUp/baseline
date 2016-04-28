package com.yryj.sercvice;

import java.util.List;

import com.yryj.model.Type;

public interface TypeManager {
	public void save(Type type);

	public void delete(int id);

	public void update(Type type);

	public Type find(int id);
	
	public List<String> findAllFormat();                 //鎵惧埌鎵�湁鐨刦ormat
	
	public List<String> findAllStyle(String format);     //鎵惧埌褰撳墠format涓嬬殑鎵�湁style
	
	public List<String> findAllLength(String style);     //鎵惧埌褰撳墠style涓嬬殑鎵�湁legnth
	
	public List<Type> findByFormat(String format);       //鎵惧埌format瀵瑰簲鐨則ype闆嗗悎
	
	public List<Type> findByStyle(String format,String style);   //鎵惧埌format鍜宻tyle瀵瑰簲鐨則ype闆嗗悎
	
	public Type findByLength(String format,String style,String length);   //鎵惧埌format銆乻tyle鍜宖ormat鍞竴瀵瑰簲鐨則ype闆嗗悎锛屾鏃秚ype闆嗗悎鍙湁涓�釜type
}
