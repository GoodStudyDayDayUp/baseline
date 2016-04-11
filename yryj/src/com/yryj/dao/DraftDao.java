package com.yryj.dao;

import com.yryj.model.Draft;

public interface DraftDao {
	public void save(Draft draft);

	public void delete(Draft draft);

	public void update(Draft draft);

	public Draft find(Draft draft);
}
