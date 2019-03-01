package com.etc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;

import com.etc.entity.Order;
import com.etc.entity.OrderDetail;

public interface OrderDao {
	//查询订单表
	public List<Order> findAll();
	//根据oid查询订单的状态
	public Order findOrderByoId(@Param("o_id")int oid);
	//查询订单信息(订单序号，订单时间，订单状态(已付款),顾客姓名)
	public List<Order> findOrderIsPay();
	//查询订单详情信息（订单序号，菜名，价格，订购数量)
	public List<OrderDetail> findDetailByoId(int oid);
	//修改订单的状态
	public Integer updateOrderState(@Param("o_id") int oid);
}
