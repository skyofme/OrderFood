package com.etc.bizImpl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.mapping.ResultMap;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etc.biz.OrderBIz;
import com.etc.dao.OrderDao;
import com.etc.entity.Order;
import com.etc.entity.OrderDetail;

@Service
public class OrderBizImpl implements OrderBIz {
	
	@Autowired
	OrderDao orderdao;
	@Override
	//查询订单表
	public List<Order> findAll() {
		// TODO Auto-generated method stub
		List<Order> orders = orderdao.findAll();
		return orders;
	}
	@Override
	public Order findOrderByoId(int oid){
		Order order = orderdao.findOrderByoId(oid);
		return order;
	}
	@Override
	public List<Order> findOrderIsPay() {
		// TODO Auto-generated method stub
		List<Order> orders = orderdao.findOrderIsPay();
		return orders;
	}
	@Override
	public List<OrderDetail> findDetailByoId(int oid) {
		// TODO Auto-generated method stub
		List<OrderDetail> orderDetails = orderdao.findDetailByoId(oid);
		return orderDetails;
	}
	@Override
	public Integer updateOrderState(@Param("o_id") int oid) {
		// TODO Auto-generated method stub
		Integer i  = orderdao.updateOrderState(oid);
		return i;
	}


}
