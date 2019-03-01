package com.etc.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.mapping.ResultMap;

import com.etc.entity.Order;
import com.etc.entity.OrderDetail;

public interface OrderBIz {
	
	public List<Order>findAll();
	
	public Order findOrderByoId(int oid);

	public List<Order> findOrderIsPay();
	
	public List<OrderDetail> findDetailByoId(int oid);
	
	public Integer updateOrderState(@Param("o_id") int oid);
}
