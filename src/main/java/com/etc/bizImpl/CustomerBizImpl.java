package com.etc.bizImpl;


import java.util.List;

















import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etc.biz.AdminMenuBiz;
import com.etc.biz.CustomerBiz;
import com.etc.dao.AdminMenuDao;
import com.etc.dao.CustomerDao;
import com.etc.entity.Customer;
import com.etc.entity.Employee;
import com.etc.entity.Menu;
import com.etc.entity.Order;


/*
 * 业务逻辑层的实现类
 * 在这里实现了业务层对外的接口
 * 
*/

@Service
public class CustomerBizImpl implements CustomerBiz{
	
	
	@Autowired
	CustomerDao customerDao;//注入的Dao层对象
	


	/*实现判断增加顾客是否成功的方法实现
	 * */
	@Override
	public Boolean addCustomer(Customer customer) {
		 customerDao.addCustomer(customer);
		if(customer.getcId()!=null && customer.getcId()>0){
			return true;
		}
		
		return false;
	}


	/*
	 * 验证用户名是否被注册的实现
	 * @see com.etc.biz.CustomerBiz#findCustomerByName(java.lang.String)
	 */
	@Override
	public Boolean findCustomerByName(String c_name) {
		
		List<Customer> a = customerDao.findCustomerByName(c_name);
		
		if(a!=null&&a.size()>0){
			return true;
		}
		return false;
	}




	/*
	 *判断用户输入的账号密码是否正确的实现
	 * @see com.etc.biz.CustomerBiz#findOneCustomer(java.lang.String, java.lang.String)
	 */
	@Override
	public List<Customer> findCustomer(String cName, String cPswd) {
		Customer customer =new Customer();
		customer.setcName(cName);
		customer.setcPswd(cPswd);
		List<Customer> customers =customerDao.findCustomer(customer);
		return customers;
	}

	//通过id查询员工的方法
	public Employee findEmployeeById(Integer eId){
		Employee employee = customerDao.findEmployeeById(eId);
		return employee;
	}
	

	/*
	 * 查询数据库是否存在该用户
	 * (non-Javadoc)
	 * @see com.etc.biz.CustomerBiz#findEmp(java.lang.String, java.lang.String)
	 */
	@Override
	public List<Employee> findEmp(String cName, String cPswd) {
		Employee employee =new Employee();
		employee.seteName(cName);
		employee.setePswd(cPswd);
		List<Employee> employees =customerDao.findEmployee(employee);
		return employees;
	}

	/*
	 * 通过ID查询一个Customer并返回一个customer对象
	 * (non-Javadoc)
	 * @see com.etc.biz.CustomerBiz#findCustomerById(java.lang.Integer)
	 */
	@Override
	public Customer findCustomerById(Integer cId) {
		Customer customer = customerDao.findCustomerById(cId);
		return customer;
	
	}

	
	/*修改customer信息
	 * (non-Javadoc)
	 * @see com.etc.biz.CustomerBiz#updateCustomer(com.etc.entity.Customer)
	 */
	@Override
	public void updateCustomer(Customer customer) {
		customerDao.updateCustomer(customer);
		return;
	}


	/*
	 * 修改员工信息
	 * (non-Javadoc)
	 * @see com.etc.biz.CustomerBiz#updateEmployee(com.etc.entity.Employee)
	 */
	@Override
	public void updateEmployee(Employee employee) {
		customerDao.updateEmployee(employee);
		return;
	}

	/*
	 * //查询到订单的信息并且返还
	 * (non-Javadoc)
	 * @see com.etc.biz.CustomerBiz#showOrder()
	 */
	@Override
	public List<Order> showOrder(Integer cId) {
		List<Order> orders = customerDao.showOrder(cId);
		return orders;
	}

	/*
	 * //查询到订单的信息并且返还缩略版
	 * (non-Javadoc)
	 * @see com.etc.biz.CustomerBiz#showOrder()
	 */
	@Override
	public List<Order> showLittleOrder(Integer cId) {
		
		List<Order> orders = customerDao.showLittleOrder(cId);
		return orders;
	}
}

