package com.etc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.etc.entity.Customer;
import com.etc.entity.Order;
import com.etc.entity.OrderDetail;
import com.etc.entity.ShoppingCar;

public interface ShoppingCarDao {
	public  List<ShoppingCar> findbyid(Integer id);
	public int update(ShoppingCar sc);
	public int del(Integer id);
	public int paytodel(ShoppingCar s);
	public int addnopayorder(@Param("o") Order o,@Param("list") List<OrderDetail> myorder);
	public int selectOid(Customer c);
	

}
