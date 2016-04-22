package com.yryj.action;

import com.yryj.model.Type;
import com.yryj.sercvice.TypeManager;;

public class TypeAction {
	Type Type=new Type();
	Type searchType=new Type();
	Integer id=null;
	String type=null;
	String style=null;
	String length=null;
	TypeManager typeManager;
	
	public void setTypeManager(TypeManager typeManager) {
		this.typeManager = typeManager;
	}
	
	public String addType(){
		type=getType();
		style=getStyle();
		length=getLength();
		Type.setType(type);
		Type.setStyle(style);
		Type.setLength(length);
		
		try {
			typeManager.save(Type);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
	
	public String deleteType(){
		id=getId();
		try {
			typeManager.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
	
	public String searchType(){
		id=getId();
		try {
			searchType=typeManager.find(id);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStyle() {
		return this.style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getLength() {
		return this.length;
	}

	public void setLength(String length) {
		this.length = length;
	}
}
