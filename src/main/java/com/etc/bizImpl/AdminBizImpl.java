package com.etc.bizImpl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etc.biz.AdminMenuBiz;
import com.etc.dao.AdminMenuDao;
import com.etc.dao.FoodKindDao;
import com.etc.entity.FoodKind;
import com.etc.entity.Menu;




@Service
public class AdminBizImpl implements AdminMenuBiz{
	@Autowired
	AdminMenuDao menuDao;
	@Autowired
	FoodKindDao foodKindDao;
	
	
	

	@Override
	public List<Menu> find()  {
		// TODO Auto-generated method stub
	        List<Menu> list=menuDao.findAll();//调用dao里面的findall()
	        for (Menu m:list){
	            System.out.println(m);
	        }
	        return list;
	    }




	@Override
	public Menu findById(Integer id) {
		 Menu menu=menuDao.findById(id);
		return menu;
	}

	@Override
	public Menu findByName(String name) {
		 Menu menu=menuDao.findByName(name);
		return menu;
	}


	
	@Override
	public Boolean update(Menu m) {
		 int rel=menuDao.update(m);
         if(rel==1){
 			return true;
 		}
 		return false;
	}




	@Override
	public Boolean sellout(Integer id) {
		 int rel=menuDao.sellout(id);
         if(rel==1){
 			return true;
 		}
 		return false;
	}



	@Override
	public List<Menu> findMeishi() {
		List<Menu> menu  = menuDao.findMeishi();
		System.out.println("查询出的菜单"+menu);
		return menu;
	}




	@Override
	public List<FoodKind> selectFoodKind() {
		List<FoodKind> foodkind = foodKindDao.selectkindfive();
		System.out.println("查询出的菜单类型");
		return foodkind;

	}

	@Override
	public String dolog(String op, Menu m) {
		int id=m.getmId();
		String name=m.getmName().trim();
		int number=m.getmNumber();
		double price=m.getmPrice();
		String fkname=m.getFk().getFkName().trim();
		String context ="把[菜单]【"+op+"】了：["+op+"后的菜单ID]为"+id+",[菜品种类]是"+fkname+"，[菜品名称]是"+name+"，[菜品数量]是"+number+"，[价格]为"+price;
		return context;

	}




	//根据类型查找菜单
	@Override
	public List<Menu> findByFoodTypeName(String foodtypeName) {
		List<Menu> menu = menuDao.findMeishiByType(foodtypeName);
		return menu;
	}




	@Override
	public Boolean add(Menu m) {
		
		return menuDao.add(m)==1?true:false;
	} 



	//模糊搜索菜名
	@Override
	public List<Menu> searchByName(String foodname) {
		List<Menu> menu = menuDao.searchFoodByName(foodname);
		return menu;
	}




	//根据当前美食名称查询美食详情
	@Override
	public Menu findMeishiDetailByName(String fname) {
		Menu list = menuDao.findMeishiDetailByName(fname);
		return list;
	}


	//添加商品进购物车
	@Override
	public boolean addToShopCar(Integer mCount, String userName, String foodName) {
		Integer result = menuDao.addToShopCar(mCount,userName,foodName);
		return true;
		
	}




		



	
}

