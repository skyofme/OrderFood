package com.etc.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.log4j.MDC;
import org.apache.log4j.spi.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.etc.biz.AdminMenuBiz;
import com.etc.biz.EmpBiz;
import com.etc.dao.EmpDao;
import com.etc.dao.FoodKindDao;
import com.etc.dao.LogDao;
import com.etc.entity.FoodKind;
import com.etc.entity.Log;
import com.etc.entity.Menu;
import com.etc.entity.Role;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/log")
public class LogController {

	private static Logger logger = Logger.getLogger(LogController.class);
	@Autowired
	LogDao logdao;
	
	@GetMapping("/logAll/{page}/{pageSize}")
	public String findall(@PathVariable("page") Integer page,
			@PathVariable("pageSize") Integer pageSize, Map<String, Object> map) {
		System.out.println("--------我进来了");
		PageHelper.startPage(page, pageSize);
		List<Log> list = logdao.findall();
		System.out.println("----------"+list.get(0));
		PageInfo<Log> p= new PageInfo<Log>(list);
		map.put("list", list);
		map.put("page", p);
		return "background/logAll";

	}
	@GetMapping("/logbyid/{id}/{page}/{pageSize}")
	public String findbyid(@PathVariable("id") Integer id,@PathVariable("page") Integer page,
			@PathVariable("pageSize") Integer pageSize, Map<String, Object> map) {
		System.out.println("--------我又进来了");
		System.out.println(id);
		PageHelper.startPage(page, pageSize);
		List<Log> list = logdao.findbyid(id);
		//System.out.println("----------"+list.get(0));
		PageInfo<Log> p= new PageInfo<Log>(list);
		map.put("list", list);
		map.put("page", p);
		return "background/mylog";

	}


	
}
