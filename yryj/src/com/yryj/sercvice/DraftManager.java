package com.yryj.sercvice;

import java.util.List;

import com.yryj.model.Draft;

public interface DraftManager {
	public void save(Draft draft);

	public void delete(long id);

	public void update(Draft draft);

	public Draft findById(long id);
	
	public List findByUserId(long id);
}
