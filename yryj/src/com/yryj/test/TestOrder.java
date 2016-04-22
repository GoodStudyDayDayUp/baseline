package com.yryj.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.yryj.daoImpl.OrderDL;
import com.yryj.model.Chapter;
import com.yryj.model.Order;

public class TestOrder {

	@Test
	public void testSave() {
		OrderDL OrderDL=new OrderDL();
		Order Order=new Order();
		Order.setId(13301084);
		OrderDL.save(Order);
		Order testOrder=OrderDL.find(13301084);
		assertEquals(Order,testOrder);    
		
	}
	@Test
	public void testDelete(){
		OrderDL OrderDL=new OrderDL();
		OrderDL.delete(13301084);
		Order testOrder=OrderDL.find(13301084);
		assertEquals(testOrder,null);
	}
	@Test 
	public void testUpdate(){
		OrderDL OrderDL=new OrderDL();
		Order Order=OrderDL.find(13301084);
		Chapter chapter=new Chapter(1,"My story is very interseting",false);
		Order.setChapter(chapter);;
		OrderDL.update(Order);
		assertEquals(chapter,OrderDL.find(13301084).getChapter());
	}
	@Test
	public void testFind(){
		OrderDL OrderDL=new OrderDL();
		Order Order=OrderDL.find(13301084);
		assertEquals("My story is very interseting",Order.getChapter().getContent());
	}

}
