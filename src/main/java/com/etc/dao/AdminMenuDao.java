package com.etc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.etc.entity.FoodKind;
import com.etc.entity.Menu;

public interface AdminMenuDao {
	public List<Menu> findAll();
	public Menu findById(Integer id) ;
	public Menu findByName(String name);
	public int update(Menu m);
	public int sellout(Integer id);
	
	public List<Menu> findMeishi();
	public List<Menu> findMeishiByType(String foodtypeName);
	public int add(Menu m);
	//模糊搜索菜名
	public List<Menu> searchFoodByName(String foodname);
	//根据当前美食名称查询美食详情
	public Menu findMeishiDetailByName(String fname);
	//添加到购物车
	public Integer addToShopCar(@Param("mCount")Integer mCount, @Param("cName")String userName, @Param("mName")String foodName);
	
	

}
