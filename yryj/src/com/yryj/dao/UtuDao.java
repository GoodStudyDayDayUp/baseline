package com.yryj.dao;

import java.util.List;

import com.yryj.model.Utu;

public interface UtuDao {
	public void save(Utu utu);

	public void delete(Utu utu);

	public void update(Utu utu);

	public List<?> find(int id, boolean direct);
}
