package com.yryj.dao;

import com.yryj.model.Order;

public interface OrderDao {
	public void save(Order order);

	public void delete(Order order);

	public void update(Order order);

	public Order find(Order order);
}
