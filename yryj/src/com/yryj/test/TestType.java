package com.yryj.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.yryj.daoImpl.TypeDL;
import com.yryj.model.Type;

public class TestType {

	@Test
	public void testSave() {
		TypeDL TypeDL=new TypeDL();
		Type Type=new Type();
		Type.setId(13301084);
		TypeDL.save(Type);
		Type testType=TypeDL.find(13301084);
		assertEquals(Type,testType);    
		
	}
	@Test
	public void testDelete(){
		TypeDL TypeDL=new TypeDL();
		TypeDL.delete(13301084);
		Type testType=TypeDL.find(13301084);
		assertEquals(testType,null);
	}
	@Test 
	public void testUpdate(){
		TypeDL TypeDL=new TypeDL();
		Type Type=TypeDL.find(13301084);
		Type.setType("interesting story");;
		TypeDL.update(Type);
		assertEquals("interesting story",TypeDL.find(13301084).getType());
	}
	@Test
	public void testFind(){
		TypeDL TypeDL=new TypeDL();
		Type Type=TypeDL.find(13301084);
		assertEquals("interesting story",TypeDL.find(13301084).getType());
	}

}
