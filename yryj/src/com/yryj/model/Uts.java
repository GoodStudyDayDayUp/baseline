package com.yryj.model;

// Generated 2016-4-21 8:56:52 by Hibernate Tools 4.0.0

/**
 * Uts generated by hbm2java
 */
public class Uts implements java.io.Serializable {

	private UtsId id;
	private Story story;
	private User user;

	public Uts() {
	}

	public Uts(UtsId id, Story story, User user) {
		this.id = id;
		this.story = story;
		this.user = user;
	}

	public UtsId getId() {
		return this.id;
	}

	public void setId(UtsId id) {
		this.id = id;
	}

	public Story getStory() {
		return this.story;
	}

	public void setStory(Story story) {
		this.story = story;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
