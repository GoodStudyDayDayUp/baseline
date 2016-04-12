package com.yryj.sercvice;

import com.yryj.model.Uts;

public interface UtsManager {
	public void save(Uts uts);

	public void delete(Uts uts);

	public void update(Uts uts);

	public Uts find(Uts uts);
}
