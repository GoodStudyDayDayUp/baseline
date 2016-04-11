package com.yryj.dao;

import com.yryj.model.Uts;

public interface UtsDao {
	public void save(Uts uts);

	public void delete(Uts uts);

	public void update(Uts uts);

	public Uts find(Uts uts);
}
