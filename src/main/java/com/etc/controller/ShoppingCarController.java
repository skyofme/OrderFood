package com.etc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.apache.log4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etc.Util.UserTestUtil;
import com.etc.biz.AdminMenuBiz;
import com.etc.biz.EmpBiz;
import com.etc.biz.ShoppingCarBiz;
import com.etc.dao.EmpDao;
import com.etc.dao.ShoppingCarDao;
import com.etc.entity.Customer;
import com.etc.entity.Employee;
import com.etc.entity.Menu;
import com.etc.entity.Order;
import com.etc.entity.OrderDetail;
import com.etc.entity.Role;
import com.etc.entity.ShoppingCar;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;



@Controller
@RequestMapping("/shoppingcar")
public class ShoppingCarController {
	@Autowired
	ShoppingCarBiz sbiz;
	
	@Autowired
	AdminMenuBiz mbiz;
	
	@Autowired
	ShoppingCarDao sdao;
	@GetMapping("/findsp/{id}")
	public String findall(@PathVariable("id") Integer id, Map<String, Object> map,HttpServletRequest request,HttpServletResponse response) throws IOException {
		  System.out.println("----进来了con");
		  List<ShoppingCar> s=sbiz.findbyid(id);
		  System.out.println("sssssssss"+s);
		  if(s.size()==0){
			map.put("msg", "您的购物车空空的哦");  
			System.out.println("进来了空");
		  }
		  map.put("s",s);
		  return "shoppingCar";   
	}
	
	@PostMapping("/update")
	public String findall(@RequestBody ShoppingCar sc) {
		  System.out.println("----进来了ajax");
		  System.out.println("-------ajax对象"+sc);
		  sbiz.update(sc);
		  return "shoppingCar";   
	}
	@GetMapping("/del/{id}")
	public String del(@PathVariable("id") Integer id,HttpServletRequest request) {
		  System.out.println("----进来了del");
		  sbiz.del(id);
		  Integer cid =(Integer) request.getSession().getAttribute("user");
		  System.out.println("--------"+cid);
		  return "redirect:/shoppingcar/findsp/"+cid;   
	}
	@PostMapping("/topay/{id}")//id1是菜的id  num1是购买的数量，id3是登录人的id
	public String topay(Integer[] id1,Integer[] num1,@PathVariable("id") Integer id3,Map<String, Object> map,HttpServletRequest request,HttpServletResponse response) throws ParseException, IOException {
		  System.out.println("----进来了topay");
		  Customer c=new Customer();
		  System.out.println("-------登录人的id"+id3);
		  c.setcId(id3);//将登录人的id加入到custom中
		  List<OrderDetail> myorder=new ArrayList<OrderDetail>();
		  Double onerowprice=0.0;
		  Double totalprice=0.0;
		  //根据id1找到对应的菜（商品名称，商品单价），num1为购买的数量
		  
		  for(int id=0;id<id1.length;id++){
			  Menu m=mbiz.findById(id1[id]);//根据m_id找到相应的菜品
			  onerowprice=(m.getmPrice()*num1[id]);//每行的价格
			  OrderDetail od=new OrderDetail();
			  od.setmCount(num1[id]);
			  od.setMenu(m);
			  totalprice+=onerowprice;//总价
			  System.out.println(od);
			  myorder.add(od);//把勾选中的东西加入集合
			//根据c_id和m_id更新购物车   将变成订单里的东西从购物车删除
			  ShoppingCar s=new ShoppingCar(m,c);
			  sbiz.paytodel(s);//删除
		  }	 	
		  map.put("myorder", myorder);
		  System.out.println("--------"+myorder);
		  map.put("totalprice", totalprice);
		 
		  //生成一个未付款的订单
		  Order o=new Order();
		  Date date=new Date();
		  DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		  String time=format.format(date);//date转字符串
		  Date newDate = format.parse(time);//字符串转date
		  o.setoDate(newDate);//将当前date以Date格式存入订单中
		  o.setCustomer(c);
		  sbiz.addnopayorder(o,myorder);
		  int id=sdao.selectOid(c);
		  System.out.println("******"+id);
		  System.out.println(o);
		  System.out.println(myorder);
		  map.put("oid",id);
		  return "pay";   
	}

}
