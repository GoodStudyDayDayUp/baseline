package com.yryj.sercvice;

import com.yryj.model.Utc;

public interface UtcManager {
	public void save(Utc utc);

	public void delete(Utc utc);

	public void update(Utc utc);

	public Utc find(Utc utc);
}
