package com.yryj.sercvice;

import com.yryj.model.Draft;

public interface DraftManager {
	public void save(Draft draft);

	public void delete(Draft draft);

	public void update(Draft draft);

	public Draft find(Draft draft);
}
