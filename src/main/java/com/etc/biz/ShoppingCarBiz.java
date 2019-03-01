package com.etc.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.etc.entity.Order;
import com.etc.entity.OrderDetail;
import com.etc.entity.ShoppingCar;

public interface ShoppingCarBiz {
	public List<ShoppingCar> findbyid(Integer id);
	public int update(ShoppingCar sc);
	public int del(Integer id);
	public int addnopayorder(Order o,List<OrderDetail> myorder);
	public int paytodel(ShoppingCar s);
}
