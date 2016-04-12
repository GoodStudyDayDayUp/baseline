package com.yryj.serviceImpl;

import com.yryj.dao.OrderDao;
import com.yryj.model.Order;
import com.yryj.sercvice.OrderManager;

public class OrderML implements OrderManager{
private OrderDao orderDao=null;
	
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	public void save(Order order) {
		// TODO Auto-generated method stub
		orderDao.save(order);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		orderDao.delete(id);
	}

	@Override
	public void update(Order order) {
		// TODO Auto-generated method stub
		orderDao.update(order);
	}

	@Override
	public Order find(int id) {
		// TODO Auto-generated method stub
		return orderDao.find(id);
	}

}
