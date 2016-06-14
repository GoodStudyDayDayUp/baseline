package com.yryj.dao;

import java.util.List;

import com.google.code.morphia.Key;
import com.yryj.model.Draft;
import com.yryj.model.Relations;

public interface RelationsDao {
	public Key<Relations> save(Relations relation);

	public void update(Relations relation);

	public Relations findById(long id);
	
	public Relations findByUserId(long userId);
}
