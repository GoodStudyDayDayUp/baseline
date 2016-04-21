package com.yryj.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.yryj.daoImpl.UserDL;
import com.yryj.model.User;

public class TestUser {

	@Test
	public void testSave() {
		UserDL UserDL=new UserDL();
		User User=new User();
		User.setId(13301084);
		UserDL.save(User);
		User testUser=UserDL.find(13301084);
		assertEquals(User,testUser);    
		
	}
	@Test
	public void testDelete(){
		UserDL UserDL=new UserDL();
		UserDL.delete(13301084);
		User testUser=UserDL.find(13301084);
		assertEquals(testUser,null);
	}
	@Test 
	public void testUpdate(){
		UserDL UserDL=new UserDL();
		User User=UserDL.find(13301084);
		User.setName("zhongkui");
		UserDL.update(User);
		assertEquals("zhongkui",UserDL.find(13301084).getName());
	}
	@Test
	public void testFind(){
		UserDL UserDL=new UserDL();
		User User=UserDL.find(13301084);
		assertEquals("zhongkui",UserDL.find(13301084).getName());
	}

}
