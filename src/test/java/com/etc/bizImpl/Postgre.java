package com.etc.bizImpl;



import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.etc.biz.AdminMenuBiz;
import com.etc.dao.FoodKindDao;
import com.etc.entity.Menu;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class Postgre {
	@Autowired
	AdminMenuBiz menubiz;
	@Test
	public void test(){
		System.out.println(menubiz.findById(1));
	}
	@Test
	public void test2(){
		List<Menu> menu = menubiz.findByFoodTypeName("菲力牛排");
		System.out.println("-----"+menu);
	}
	@Test
	public void test1(){
		String a = "可乐鸡翅";
		List<Menu> menu= menubiz.searchByName(a);
		System.out.println(menu);
	}
}