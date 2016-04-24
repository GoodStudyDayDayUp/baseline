package com.yryj.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.yryj.daoImpl.StoryDL;
import com.yryj.model.Chapter;
import com.yryj.model.Story;

public class TestStory {

	@Test
	public void testSave() {
		StoryDL StoryDL=new StoryDL();
		Story Story=new Story();
		Story.setId(13301084);
		StoryDL.save(Story);
		Story testStory=StoryDL.find(13301084);
		assertEquals(Story,testStory);    
		
	}
	@Test
	public void testDelete(){
		StoryDL StoryDL=new StoryDL();
		StoryDL.delete(13301084);
		Story testStory=StoryDL.find(13301084);
		assertEquals(testStory,null);
	}
	@Test 
	public void testUpdate(){
		StoryDL StoryDL=new StoryDL();
		Story Story=StoryDL.find(13301084);
		Chapter chapter=new Chapter(1,"My story is very interseting",false);
		Story.setChapter(chapter);;
		StoryDL.update(Story);
		assertEquals(chapter,StoryDL.find(13301084).getChapter());
	}
	@Test
	public void testFind(){
		StoryDL StoryDL=new StoryDL();
		Story Story=StoryDL.find(13301084);
		assertEquals("My story is very interseting",Story.getChapter().getContent());
	}

}
