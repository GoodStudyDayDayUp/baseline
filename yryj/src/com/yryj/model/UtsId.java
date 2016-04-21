package com.yryj.model;

// Generated 2016-4-21 8:56:52 by Hibernate Tools 4.0.0

/**
 * UtsId generated by hbm2java
 */
public class UtsId implements java.io.Serializable {

	private int uid;
	private int storyId;

	public UtsId() {
	}

	public UtsId(int uid, int storyId) {
		this.uid = uid;
		this.storyId = storyId;
	}

	public int getUid() {
		return this.uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getStoryId() {
		return this.storyId;
	}

	public void setStoryId(int storyId) {
		this.storyId = storyId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof UtsId))
			return false;
		UtsId castOther = (UtsId) other;

		return (this.getUid() == castOther.getUid())
				&& (this.getStoryId() == castOther.getStoryId());
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + this.getUid();
		result = 37 * result + this.getStoryId();
		return result;
	}

}
