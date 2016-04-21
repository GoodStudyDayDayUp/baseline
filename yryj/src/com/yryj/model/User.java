package com.yryj.model;

// Generated 2016-4-21 8:56:52 by Hibernate Tools 4.0.0

import java.util.HashSet;
import java.util.Set;

/**
 * User generated by hbm2java
 */
public class User implements java.io.Serializable {

	private Integer id;
	private String name;
	private String password;
	private Boolean sex;
	private String phone;
	private String email;
	private int point;
	private Set utusForFanId = new HashSet(0);
	private Set utusForUid = new HashSet(0);
	private Set utses = new HashSet(0);
	private Set orders = new HashSet(0);
	private Set drafts = new HashSet(0);
	private Set chapters = new HashSet(0);
	private Set utcs = new HashSet(0);

	public User() {
	}

	public User(String name, String password, int point) {
		this.name = name;
		this.password = password;
		this.point = point;
	}

	public User(String name, String password, Boolean sex, String phone,
			String email, int point, Set utusForFanId, Set utusForUid,
			Set utses, Set orders, Set drafts, Set chapters, Set utcs) {
		this.name = name;
		this.password = password;
		this.sex = sex;
		this.phone = phone;
		this.email = email;
		this.point = point;
		this.utusForFanId = utusForFanId;
		this.utusForUid = utusForUid;
		this.utses = utses;
		this.orders = orders;
		this.drafts = drafts;
		this.chapters = chapters;
		this.utcs = utcs;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getSex() {
		return this.sex;
	}

	public void setSex(Boolean sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPoint() {
		return this.point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Set getUtusForFanId() {
		return this.utusForFanId;
	}

	public void setUtusForFanId(Set utusForFanId) {
		this.utusForFanId = utusForFanId;
	}

	public Set getUtusForUid() {
		return this.utusForUid;
	}

	public void setUtusForUid(Set utusForUid) {
		this.utusForUid = utusForUid;
	}

	public Set getUtses() {
		return this.utses;
	}

	public void setUtses(Set utses) {
		this.utses = utses;
	}

	public Set getOrders() {
		return this.orders;
	}

	public void setOrders(Set orders) {
		this.orders = orders;
	}

	public Set getDrafts() {
		return this.drafts;
	}

	public void setDrafts(Set drafts) {
		this.drafts = drafts;
	}

	public Set getChapters() {
		return this.chapters;
	}

	public void setChapters(Set chapters) {
		this.chapters = chapters;
	}

	public Set getUtcs() {
		return this.utcs;
	}

	public void setUtcs(Set utcs) {
		this.utcs = utcs;
	}

}
