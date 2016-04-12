package com.yryj.sercvice;

import com.yryj.model.Draft;

public interface DraftManager {
	public void save(Draft draft);

	public void delete(int id);

	public void update(Draft draft);

	public Draft find(int id);
}
