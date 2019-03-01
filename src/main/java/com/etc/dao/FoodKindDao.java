package com.etc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.etc.entity.FoodKind;
import com.etc.entity.Menu;

public interface FoodKindDao {
	public List<FoodKind> select();
	public Integer selectbykind(@Param("type") String type);
	public FoodKind selectfk(String type);
	public int add(String type);
	//查询前五条
	public List<FoodKind> selectkindfive();
}
