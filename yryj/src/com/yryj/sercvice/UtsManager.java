package com.yryj.sercvice;

import java.util.List;

import com.yryj.model.Uts;

public interface UtsManager {
	public void save(Uts uts);

	public void delete(Uts uts);

	public void update(Uts uts);

	public List<?>  find(int id);
}
