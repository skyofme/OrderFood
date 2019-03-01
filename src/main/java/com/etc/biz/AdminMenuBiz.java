package com.etc.biz;

import java.util.List;

import com.etc.entity.FoodKind;
import com.etc.entity.Menu;



public interface AdminMenuBiz {
	public List<Menu> find() ;
	public Menu findById(Integer id) ;
	public Menu findByName(String name) ;
	public Boolean update(Menu m) ;
	public Boolean sellout(Integer id);
	public String dolog(String op,Menu m);

	//美食页查询所欲美食
	public List<Menu> findMeishi();
	//美食页查询所有美食类型
	public List<FoodKind> selectFoodKind();	
	public List<Menu> findByFoodTypeName(String foodtypeName);
	public Boolean add(Menu m);
	//根据输入美食名称模糊搜索
	public List<Menu> searchByName(String foodname);
	//根据美食名称查询美食详情
	public Menu findMeishiDetailByName(String fdname);
	//添加进购物车
	public boolean addToShopCar(Integer mCount,String userName,String foodName);
}
