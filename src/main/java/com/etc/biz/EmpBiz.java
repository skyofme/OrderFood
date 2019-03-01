package com.etc.biz;

import java.util.List;

import com.etc.entity.Employee;
import com.etc.entity.Menu;

public interface EmpBiz {
	public List<Employee> findAll();
	
	public Employee updateEmp(Integer eId);
	
	public boolean doUpdateEmp(Employee emp);
	
	public boolean deleteEmp(Integer eId);
	
	public String dolog(String op, Employee e);
}
