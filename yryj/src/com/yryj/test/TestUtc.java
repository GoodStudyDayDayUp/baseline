package com.yryj.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.yryj.daoImpl.UtcDL;
import com.yryj.model.Chapter;
import com.yryj.model.Utc;
import com.yryj.model.UtcId;

public class TestUtc {

	@Test
	public void testSave() {
		UtcDL UtcDL=new UtcDL();
		Utc Utc=new Utc();
		Utc.setId(new UtcId(1234,13301084));
		UtcDL.save(Utc);
		Utc testUtc=(Utc)UtcDL.find(1234).get(0);
		assertEquals(Utc,testUtc);    
		
	}
	@Test
	public void testDelete(){
		UtcDL UtcDL=new UtcDL();
		Utc Utc=new Utc();
		Utc.setId(new UtcId(1234,13301084));
		UtcDL.delete(Utc);
		Utc testUtc= (Utc)UtcDL.find(1234).get(0);
		assertEquals(testUtc,null);
	}
	@Test 
	public void testUpdate(){
		UtcDL UtcDL=new UtcDL();
		Utc Utc= (Utc) UtcDL.find(1234).get(0);
		Chapter chapter=new Chapter(1,"My Utc is very interseting",false);
		Utc.setChapter(chapter);
		UtcDL.update(Utc);
		assertEquals(chapter,((Utc)UtcDL.find(1234).get(0)).getChapter());
	}
	@Test
	public void testFind(){
		UtcDL UtcDL=new UtcDL();
		Utc Utc= (Utc) UtcDL.find(1234).get(0);
		assertEquals("My Utc is very interseting",(Utc.getChapter()).getContent());
	}
}
