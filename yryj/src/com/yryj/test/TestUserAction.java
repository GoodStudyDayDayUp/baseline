package com.yryj.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.yryj.action.UserAction;
import com.yryj.sercvice.UserManager;
import com.yryj.serviceImpl.UserML;

public class TestUserAction {

	@Test
	public void TestLogin() {
		///UserManager userManager;
		UserAction userAction=new UserAction();
		//userAction.setUserManager();
		userAction.setName("heming");
		userAction.setPassword("123456");
		assertEquals("success",userAction.loginUser());
	}

	@Test
	public void TestRegister() {
		///UserManager userManager;
		UserAction userAction=new UserAction();
		//userAction.setUserManager();
		userAction.setName("axiba");
		userAction.setPassword("123456");
		userAction.setPassword2("123456");
		userAction.setEmail("13301066@bjtu.edu.cn");
		userAction.getUser();
		assertEquals("success",userAction.registerUser());
		}
}
