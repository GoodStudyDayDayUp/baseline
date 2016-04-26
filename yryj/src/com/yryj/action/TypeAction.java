package com.yryj.action;

import com.yryj.model.Type;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.yryj.sercvice.TypeManager;
@SuppressWarnings("unchecked")
public class TypeAction {
	Type Type=new Type();
	Type searchType=new Type();
	Integer id=null;
	String format=null;
	String style=null;
	String length=null;
	TypeManager typeManager;
	
	public void setTypeManager(TypeManager typeManager) {
		this.typeManager = typeManager;
	}
	
	public String addType(){
		format=getFormat();
		style=getStyle();
		length=getLength();
		Type.setFormat(format);
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
		ActionContext context=ActionContext.getContext();
		context.getSession().put("searchType",searchType);
		return "success";
	}
	
	
	public String findAllFormatAction(){
		List<String> list=typeManager.findAllFormat();
		if(list.size()>0){
			ActionContext context=ActionContext.getContext();
			context.getSession().put("formatList",list);
			return "success";
		}else{
			return "error";
		}
	}
	
	
	public String findAllStyleAction(){
		List<String> list=typeManager.findAllStyle(format);
		if(list.size()>0){
			ActionContext context=ActionContext.getContext();
			context.getSession().put("styleList",list);
			return "success";
		}else{
			return "error";
		}
	}
	
	
	public String findAllLengthAction(){
		List<String> list=typeManager.findAllLength(style);
		if(list.size()>0){
			ActionContext context=ActionContext.getContext();
			context.getSession().put("lengthList",list);
			return "success";
		}else{
			return "error";
		}
	}

	
	public String findByFormatAction(){
		List<Type> list=typeManager.findByFormat(format);
		if(list.size()>0){
			ActionContext context=ActionContext.getContext();
			context.getSession().put("typeListFoundByFormat",list);
			return "success";
		}else{
			return "error";
		}
	}
	
	
	
	public String findByStyleAction(){
		List<Type> list=typeManager.findByStyle(format, style);
		if(list.size()>0){
			ActionContext context=ActionContext.getContext();
			context.getSession().put("typeListFoundByStyle",list);
			return "success";
		}else{
			return "error";
		}
	}
	
	
	public String findByLengthAction(){
		Type type=typeManager.findByLength(format,style,length);
		if(type!=null){
			ActionContext context=ActionContext.getContext();
			context.getSession().put("typeListFoundByLength",type);
			return "success";
		}else{
			return "error";
		}
	}
	
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getFormat() {
		return this.format;
	}

	public void setFormat(String format) {
		this.format = format;
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
