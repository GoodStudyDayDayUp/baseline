package com.yryj.model;

// Generated 2016-4-26 12:25:28 by Hibernate Tools 4.0.0

import java.util.HashSet;
import java.util.Set;

import com.google.code.morphia.annotations.Id;
import com.google.code.morphia.annotations.Indexed;
import com.google.code.morphia.utils.IndexDirection;


public class User implements java.io.Serializable {
	@Id
	@Indexed(value=IndexDirection.ASC, name="id", unique=true, dropDups=true) 
	private long id;
	
	private String name;
	private String password;
	private String phone;
	private String email;
	private long point;
	
	public User(){
		name="";
		password="";
		phone="";
		email="";
		point=0;
	}
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public long getPoint() {
		return point;
	}
	public void setPoint(long point) {
		this.point = point;
	}

	

}
