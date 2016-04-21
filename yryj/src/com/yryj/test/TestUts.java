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
	@Test 
	public void testUpdate(){
		UtsDL UtsDL=new UtsDL();
		Uts Uts= (Uts) UtsDL.find(1234).get(0);
		Story story=new Story();
		story.setType(new Type("interseting story"));
		Uts.setStory(story);;
		UtsDL.update(Uts);
		assertEquals("interseting story",((Uts)UtsDL.find(1234).get(0)).getStory().getType().getType());
	}
	@Test
	public void testFind(){
		UtsDL UtsDL=new UtsDL();
		Uts Uts= (Uts) UtsDL.find(1234).get(0);
		assertEquals("interseting",Uts.getStory().getType().getType());
	}

}
