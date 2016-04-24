package com.yryj.sercvice;

import java.util.List;

import com.yryj.model.Utu;

public interface UtuManager {
	public void save(Utu utu);

	public void delete(Utu utu);

	public void update(Utu utu);

	public List<?> find(int id, boolean direct) ;
}
