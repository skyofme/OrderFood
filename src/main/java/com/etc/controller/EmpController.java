package com.etc.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.log4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etc.biz.EmpBiz;
import com.etc.dao.EmpDao;
import com.etc.entity.Employee;
import com.etc.entity.Menu;
import com.etc.entity.Role;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;



@Controller
@RequestMapping("/emp")
public class EmpController {
	private static Logger logger = Logger.getLogger(EmpController.class);
	@Autowired
	EmpBiz empBiz;
	@Autowired
	EmpDao empdao;
	
	@GetMapping("/empAll/{page}/{pageSize}")
	public String findall(@PathVariable("page") Integer page,@PathVariable("pageSize")Integer pageSize,Map<String,Object> map) {
		  PageHelper.startPage(page, pageSize);
		  List<Employee> list=empBiz.findAll();
		  System.out.println(list);
		  PageInfo<Employee> p=new PageInfo<Employee>(list);
		  map.put("emps",list);
		  map.put("page", p);
		  return "background/empAll";   
	}
	
	@GetMapping("/doedit/{eId}")
	public String findById(@PathVariable("eId") Integer eId,Map<String,Object> map){
		Employee emp = empBiz.updateEmp(eId);
		map.put("emp", emp);
		List<Role> list=empdao.findroles();
		map.put("roles", list);
		System.out.println("+++++++++++++"+list);
		//System.out.println(emp);
		return "background/doempedit";
	}

	@PostMapping("/doeditEmp")
	public String updateEmp(Employee emp,HttpSession session,HttpServletRequest request) {
		  System.out.println("------得到的"+emp);
		  empBiz.doUpdateEmp(emp);
		  String context = empBiz.dolog("编辑", emp);
		  Object obj = request.getSession().getAttribute("user");//通过session得到登录人的e_id
		  MDC.put("e_id", obj); // 根据登陆人的id
		  logger.error(context);
		  request.setAttribute("init1","<script>function init1(){document.getElementById('allemp').click();}</script>");
		  return "background/index";
		
	}
	//没写
	@GetMapping("/doDel/{eId}")
	public String delEmp(@PathVariable("eId") Integer eId){
		System.out.println("进入删除");
		boolean result = empBiz.deleteEmp(eId);
		return "background/index";
		
	}

}
