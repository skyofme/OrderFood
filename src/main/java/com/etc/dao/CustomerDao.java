package com.etc.dao;


import java.util.List;

import com.etc.entity.Customer;
import com.etc.entity.Employee;
import com.etc.entity.Order;

/*
 * Customer的数据库连接层
 */
public interface CustomerDao {
	
	//增加的方法
	public void addCustomer(Customer customer);
	
	//通过账号密码查询的方法
	public List<Customer> findCustomer(Customer customer);
	
	//通过账号查询的方法
	public List<Customer> findCustomerByName(String cName);
	
	//通过账号密码查询员工的方法
	public List<Employee> findEmployee(Employee employee);
	
	//通过id查询员工的方法
	public Employee findEmployeeById(Integer eId);
	
	//通过id查询顾客的方法
	public Customer findCustomerById(Integer cId);
	
	//修改customer
	public void updateCustomer(Customer customer);
	
	//修改emp
	public void updateEmployee(Employee employee);
	
	//查询到订单的信息并且返还
	public List<Order> showOrder(Integer cId);
	
	//查询到订单的信息并且返还缩略版
	public List<Order> showLittleOrder(Integer cId);
}
