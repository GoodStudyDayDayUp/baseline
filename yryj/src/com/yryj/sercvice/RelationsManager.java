package com.yryj.sercvice;

import com.google.code.morphia.Key;
import com.yryj.model.Relations;

public interface RelationsManager {

	public Key<Relations> save(Relations relation);

	public void update(Relations relation);

	public Relations findById(long id);
	
	public Relations findByUserId(long userId);
}
