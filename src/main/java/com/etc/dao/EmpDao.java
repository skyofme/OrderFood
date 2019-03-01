package com.etc.dao;

import java.util.List;

import com.etc.entity.Employee;
import com.etc.entity.Role;

public interface EmpDao {
	public List<Employee> findAll();
	
	public Employee updateEmp(Integer eId);
	
	public Integer doUpdateEmp(Employee emp);
	
	public void deleteEmp(Integer eId);
	
	public List<Role> findroles();
	
	public Role findrolebyid(Integer id);
}
