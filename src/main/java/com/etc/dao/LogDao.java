package com.etc.dao;

import java.util.List;

import com.etc.entity.Log;

public interface LogDao {
	public List<Log> findall();
	public List<Log> findbyid(Integer  id);
	
}
