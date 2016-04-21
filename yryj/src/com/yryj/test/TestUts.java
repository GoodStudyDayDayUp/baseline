package com.yryj.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.yryj.daoImpl.UtsDL;
import com.yryj.model.Story;
import com.yryj.model.Type;
import com.yryj.model.Uts;
import com.yryj.model.UtsId;

public class TestUts {

	@Test
	public void testSave() {
		UtsDL UtsDL=new UtsDL();
		Uts Uts=new Uts();
		Uts.setId(new UtsId(1234,13301084));
		UtsDL.save(Uts);
		Uts testUts=(Uts)UtsDL.find(1234).get(0);
		assertEquals(Uts,testUts);    
		
	}
	@Test
	public void testDelete(){
		UtsDL UtsDL=new UtsDL();
		Uts Uts=new Uts();
		Uts.setId(new UtsId(1234,13301084));
		UtsDL.delete(Uts);
		Uts testUts= (Uts)UtsDL.find(1234).get(0);
		assertEquals(testUts,null);
	}


}
