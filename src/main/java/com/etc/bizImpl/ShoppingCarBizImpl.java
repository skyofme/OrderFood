package com.etc.bizImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etc.biz.ShoppingCarBiz;
import com.etc.dao.ShoppingCarDao;
import com.etc.entity.Order;
import com.etc.entity.OrderDetail;
import com.etc.entity.ShoppingCar;
@Service
public class ShoppingCarBizImpl implements ShoppingCarBiz {

	@Autowired
	ShoppingCarDao sdao;
	
	@Override
	public List<ShoppingCar> findbyid(Integer id) {
		List<ShoppingCar> shopcar= sdao.findbyid(id);
		return shopcar;
	}

	@Override
	public int update(ShoppingCar sc) {
		return sdao.update(sc);
	}

	@Override
	public int del(Integer id) {
		return sdao.del(id);
	}

	@Override
	public int addnopayorder(Order o,List<OrderDetail>  myorder) {
		return sdao.addnopayorder(o, myorder);
	}

	@Override
	public int paytodel(ShoppingCar s) {
		return sdao.paytodel(s);
	}

}
