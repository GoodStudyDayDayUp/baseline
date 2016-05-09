package com.yryj.action;

import com.yryj.model.Type;
import com.yryj.pub.Format;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.yryj.sercvice.TypeManager;
@SuppressWarnings("unchecked")
public class TypeAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	TypeManager typeManager;

	public String getAllType(){
		try{
			ArrayList<ArrayList<Type>> types = new ArrayList<ArrayList<Type>>();
			ArrayList<Type> style=new ArrayList<Type>();

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Format.WRONG;
		}
	}
}