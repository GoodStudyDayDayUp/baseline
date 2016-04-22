package com.yryj.model;

// Generated 2016-4-21 11:17:52 by Hibernate Tools 4.0.0

/**
 * Draft generated by hbm2java
 */
public class Draft implements java.io.Serializable {

	private Integer id;
	private Chapter chapter;
	private User user;
	private String content;

	public Draft() {
	}

	public Draft(Chapter chapter, User user, String content) {
		this.chapter = chapter;
		this.user = user;
		this.content = content;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Chapter getChapter() {
		return this.chapter;
	}

	public void setChapter(Chapter chapter) {
		this.chapter = chapter;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
