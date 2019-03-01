package com.etc.controller;

import static org.hamcrest.CoreMatchers.nullValue;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.mapping.ResultMap;
import org.apache.log4j.Logger;
import org.apache.log4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etc.biz.OrderBIz;
import com.etc.entity.Menu;
import com.etc.entity.Order;
import com.etc.entity.OrderDetail;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("order")
public class OrderController {
	private static Logger logger = Logger.getLogger(OrderController.class);
	
	@Autowired
	OrderBIz orderBIz;
	@GetMapping("/mytest")
	//查询订单表
	public String findall(Map<String, Object> map){
		List<Order> orders = orderBIz.findAll();
		map.put("list", orders);
		  return "success";
	}
	@GetMapping("findorder")
	public String findOrder(Map<String, Object> map){
		List<Order> orders = orderBIz.findOrderIsPay();
		map.put("orders", orders);
		return "background/findorder";
	}
	@GetMapping("updateorder")
	public String updateOrderState(Map<String, Object> map){
		List<Order> orders = orderBIz.findOrderIsPay();
		System.out.println(orders);
		map.put("orders", orders);
		return "background/updateorder";
	}
	@RequestMapping("findorderbyoid")
	@ResponseBody
	public JSONArray findDetailByoId(Integer oid,HttpServletResponse resp){
		List<OrderDetail> orderDetails = orderBIz.findDetailByoId(oid);
		JSONArray jsonArray = new JSONArray();
		for(OrderDetail orderDetail : orderDetails){
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("mCount", orderDetail.getmCount());
			jsonObject.put("mName", orderDetail.getMenu().getmName());
			jsonObject.put("mPrice", orderDetail.getMenu().getmPrice());
			jsonArray.add(jsonObject);
		}
		return jsonArray;
	}
	@RequestMapping("updateOrderState")
	@ResponseBody
	public JSONObject updateOrderState(Integer oid,HttpServletResponse resp,HttpServletRequest request){
		System.out.println("---------------------------------");
		Integer  i = orderBIz.updateOrderState(oid);
		JSONObject jsonObject = new JSONObject();
		Order order = orderBIz.findOrderByoId(oid);
		System.out.println(order);
		if(i>0){
			DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time=format.format(order.getoDate());//date转字符串
			String context = "把在"+time+"下单的订单完成了";
			Object obj = request.getSession().getAttribute("user");// 通过session得到登录人的e_id
			MDC.put("e_id", obj); // 根据登陆人的id
			logger.error(context);
			jsonObject.put("flag", "修改成功");
			System.out.println("修改成功");
			return jsonObject;
		}
		else {
			System.out.println("修改失败");
			jsonObject.put("flag", "修改失败");
			return jsonObject;
		}
	}
}
