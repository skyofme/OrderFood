package com.etc.bizImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etc.biz.EmpBiz;
import com.etc.dao.EmpDao;
import com.etc.entity.Employee;

@Service
public class EmpBizImpl implements EmpBiz{

	@Autowired
	EmpDao empDao;

	@Override
	public List<Employee> findAll() {
		List<Employee> emps = empDao.findAll();
		for(Employee e:emps){
			System.out.println(e);
		}
		return emps;
}

	@Override
	public Employee updateEmp(Integer eId) {
		Employee emp= empDao.updateEmp(eId);
		return emp;
	}
	

	@Override
	public boolean doUpdateEmp(Employee emp) {
		Integer result = empDao.doUpdateEmp(emp);
		System.out.println("进入修改啦"+result);
		return true;
	}

	@Override
	public boolean deleteEmp(Integer eId) {
		System.out.println("进入删除");
		empDao.deleteEmp(eId);
		return true;
	}

	@Override
	public String dolog(String op, Employee e) {
		int id=e.geteId();
		String name=e.geteName().trim();
		String phone=e.getePhone().trim();
		String role=empDao.findrolebyid(e.getRole().getrId()).getrRole().trim();
		String context ="把[员工]【"+op+"】了：[修改后的员工ID]为"+id+",[员工角色]是"+role+"，[员工姓名]是"+name+"，[员工电话]是"+phone;
		return context;
	}

}