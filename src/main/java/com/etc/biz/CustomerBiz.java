package com.etc.biz;

import java.util.List;

import com.etc.entity.Customer;
import com.etc.entity.Employee;
import com.etc.entity.Order;


/*
 * Customer的业务逻辑层
 * 这里提供了顾客对外的一系列方法
 * */

public interface CustomerBiz {
	
	//判断是否添加顾客成功
	public Boolean addCustomer(Customer customer);
	
	//判断用户名是否已经被注册
	public Boolean findCustomerByName(String c_name);
	
	//判断用户输入的账号密码是否是正确的
	public List<Customer> findCustomer(String cName,String cPswd);
	
	//判断员工输入的账号密码是否正确
	public List<Employee> findEmp(String cName,String cPswd);
	
	//通过id查询员工的方法
	public Employee findEmployeeById(Integer eId);
	
	//通过id查询顾客的方法
	public Customer findCustomerById(Integer eId);
	
	//修改customer并返回
	public void updateCustomer(Customer customer);
	
	//修改Employee并返回
	public void updateEmployee(Employee employee);
	
	//查询到订单的信息并且返还
	public List<Order> showOrder(Integer cId);
	
	//查询到订单的信息并且返还缩略版
	public List<Order> showLittleOrder(Integer cId);
	
}
