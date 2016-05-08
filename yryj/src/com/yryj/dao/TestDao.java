package com.yryj.dao;

import com.yryj.model.Test;

public interface TestDao {

	public Test getTest(String id);
	public void addTest(Test test);
	public void deleteTest(Test test);	
}
