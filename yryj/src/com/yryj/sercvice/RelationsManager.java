package com.yryj.sercvice;

import java.util.List;

import com.google.code.morphia.Key;
import com.yryj.model.Chapter;
import com.yryj.model.Relations;

public interface RelationsManager {

	public Key<Relations> save(Relations relation);

	public void update(Relations relation);

	public Relations findById(long id);
	
	public Relations findByUserId(long userId);
	
	public List<Chapter> getStoreChapter(long userId);
	
	public List<Chapter> getLovedChapter(long userId);
}
