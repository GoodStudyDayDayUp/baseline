package com.yryj.dao;

import java.util.List;

import com.google.code.morphia.Key;
import com.yryj.model.Draft;

public interface DraftDao {
	public Key<Draft> save(Draft draft);

	public void delete(long id);

	public void update(Draft draft);

	public Draft findById(long id);
	
	public List findByUserId(long userId);
}
