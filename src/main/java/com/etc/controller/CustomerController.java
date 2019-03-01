package com.etc.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


























import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import sdk.GeetestLib;

import com.etc.Util.MailUtil;
import com.etc.Util.UserTestUtil;
import com.etc.action.gt.GeetestConfig;
import com.etc.biz.CustomerBiz;
import com.etc.entity.Customer;
import com.etc.entity.Employee;
import com.etc.entity.Order;
import com.etc.entity.OrderDetail;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


/*
 * Customer的控制层
 */
@Controller
public class CustomerController {
	
	@Autowired
	CustomerBiz customerbiz;
	public static String  emailTest=null;//邮箱的验证码
	
	

	@RequestMapping("/gt/ajax-validate1")
	public String validate1(HttpServletRequest request,HttpServletResponse response) throws IOException{

		GeetestLib gtSdk = new GeetestLib(GeetestConfig.getGeetest_id(), GeetestConfig.getGeetest_key(),
				GeetestConfig.isnewfailback());
		
		String challenge = request.getParameter(GeetestLib.fn_geetest_challenge);
		String validate = request.getParameter(GeetestLib.fn_geetest_validate);
		String seccode = request.getParameter(GeetestLib.fn_geetest_seccode);

		// 从session中获取gt-server状态
		int gt_server_status_code = (Integer) request.getSession().getAttribute(gtSdk.gtServerStatusSessionKey);

		// 从session中获取userid
		String userid = (String) request.getSession().getAttribute("userid");

		// 自定义参数,可选择添加
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("user_id", userid); // 网站用户id
		param.put("client_type", "web"); // web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
		param.put("ip_address", "127.0.0.1"); // 传输用户请求验证时所携带的IP

		int gtResult = 0;

		if (gt_server_status_code == 1) {
			// gt-server正常，向gt-server进行二次验证

			gtResult = gtSdk.enhencedValidateRequest(challenge, validate, seccode, param);
			System.out.println(gtResult);
		} else {
			// gt-server非正常情况下，进行failback模式验证

			System.out.println("failback:use your own server captcha validate");
			gtResult = gtSdk.failbackValidateRequest(challenge, validate, seccode);
			System.out.println(gtResult);
		}

		if (gtResult == 1) {
			JSONObject data = new JSONObject();
			// 验证成功
			try {
				data.put("status", "success");
				// data.put("version", gtSdk.getVersionInfo());
			} catch (JSONException e) {
				e.printStackTrace();
			}
			PrintWriter out = response.getWriter();
			out.println(data.toString());
		} else {
			// 验证失败
			JSONObject data = new JSONObject();
			try {
				data.put("status", "fail");
				// data.put("version", gtSdk.getVersionInfo());
			} catch (JSONException e) {
				e.printStackTrace();
			}
			PrintWriter out = response.getWriter();
			out.println(data.toString());
		}
		return null;
	}

	
	
	
	@RequestMapping("/gt/register1")
	public String register1(HttpServletRequest request,HttpServletResponse response) throws Exception {
		

		GeetestLib gtSdk = new GeetestLib(GeetestConfig.getGeetest_id(), GeetestConfig.getGeetest_key(),
				GeetestConfig.isnewfailback());

		String resStr = "{}";

		String userid = "test";

		// 自定义参数,可选择添加
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("user_id", userid); // 网站用户id
		param.put("client_type", "web"); // web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
		param.put("ip_address", "127.0.0.1"); // 传输用户请求验证时所携带的IP

		// 进行验证预处理
		int gtServerStatus = gtSdk.preProcess(param);

		// 将服务器状态设置到session中
		
		request.getSession().setAttribute(gtSdk.gtServerStatusSessionKey, gtServerStatus);
		// 将userid设置到session中
		request.getSession().setAttribute("userid", userid);

		resStr = gtSdk.getResponseStr();

		PrintWriter out = response.getWriter();
		out.println(resStr);
		return null;
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	 * 注册并跳转页面
	 */
	@RequestMapping("/customer/registerCustomer")
	public String registerCustomer(Customer customer) {
		if(customerbiz.addCustomer(customer)){
			return "login";
		}
		return "customer/fail";//注册成功后的跳转界面
	}
	
	
	
	
	/*
	 * 修改用户信息
	 */
	@RequestMapping("/customer/updateCustomer")
	public String updateCustomer(HttpServletRequest request,HttpServletResponse response,Customer customer){
		int a = (Integer) request.getSession().getAttribute("user");
		customer.setcId(a);
		customerbiz.updateCustomer(customer);
		
		//修改完成后，退出登录并跳转到登录界面
		request.getSession().removeAttribute("name");
		request.getSession().removeAttribute("user");
		request.getSession().removeAttribute("role");
		
		return "login";
	}
	
	
	/*
	 * 修改员工信息
	 */
	@RequestMapping("/emp/updateEmp")
	public String updateEmp(HttpServletRequest request,HttpServletResponse response,Employee employee){
		int a = (Integer) request.getSession().getAttribute("user");
		employee.seteId(a);
		System.out.println(employee);
		customerbiz.updateEmployee(employee);
		
		request.getSession().removeAttribute("name");
		request.getSession().removeAttribute("user");
		request.getSession().removeAttribute("role");
		
		return "login";
	}
	
	
	/*
	 * 发送邮件，并返回发送是否成功的标识符
	 */
	@RequestMapping("/customer/emailTest")
	@ResponseBody Customer emailTest(String emailname){
		emailTest=String.valueOf((int)(Math.random() * 9999));//生成随机四位数邮箱验证码
		System.out.println(emailTest);
		Customer customer = new Customer();
		try {
			//调用邮箱发送方法
			MailUtil.send_mail(emailname, "您的验证码是："+emailTest+"。请妥善保管您的验证码。");
			customer.setcEmail("true");
		} catch (MessagingException e) {
			customer.setcEmail("false");
			e.printStackTrace();
		}
		
		
		return customer;
	}
	
	/*
	 * 判断邮箱验证码是否正确
	 */
	@RequestMapping("/customer/emailTestYanzheng")
	@ResponseBody
	public Customer emailTestYanzheng(String tEmailTest) {
		
		Customer customer = new Customer();
		//判断验证码是否正确，并返回一个标识符返回json
		
		if (emailTest!=null&&emailTest.equals(tEmailTest)) {
			
			customer.setcEmail("false");
			emailTest=null;
		}
		else{
			customer.setcEmail("true");
		}
		return customer;
	}
	
	/*
	 * 判断用户名是否已经被注册并且返回标识符
	 */
	@RequestMapping("/customer/userTest")
	@ResponseBody
	public Customer userTest(String c_name,String tEmail) {
		boolean a =customerbiz.findCustomerByName(c_name);
		Customer customer = new Customer();
		//判断验证码是否正确，并返回一个标识符返回json
		if (emailTest!=null&&emailTest.equals(tEmail)) {
			customer.setcEmail("false");
		}
		else{
			customer.setcEmail("true");
		}
		
		//判断用户名是否已经存在并返回一个标识符
		if (a) {
			customer.setcAddress("true");
		}
		
		return customer;
	}
	
	/*
	 * 通过前台传来的数据判断用户是什么身份，并进行相关的登录操作
	 */
	@RequestMapping("/customer/userLogin")
	@ResponseBody
	public Customer userLogin(String user,String password,String choose,HttpServletRequest request,HttpServletResponse response){
		Customer customer = new Customer();
		if(choose.equals("emp")){
			//通过用户提交的数据进行查询，得到结果集
			List<Employee> employees=customerbiz.findEmp(user, password);
			
			//判断结果集是否有效，
			if(employees!=null&&employees.size()>0){
				//登录成功，将session中的user置为用户ID。
				
					
				//将session中的角色置为用户role
				request.getSession().removeAttribute("role");
				request.getSession().setAttribute("role", employees.get(0).getRole().getrId());
				request.getSession().removeAttribute("user");
				request.getSession().setAttribute("user", employees.get(0).geteId());
				request.getSession().removeAttribute("name");
				request.getSession().setAttribute("name", employees.get(0).geteName());
			}
			else{
				//如果查询不到，返回一个标识符提醒前端密码账号输入有误
				customer.setcAddress("false");
			}
		}
		else if (choose.equals("custom")) {
			List<Customer> customers=customerbiz.findCustomer(user, password);
			if(customers!=null&&customers.size()>0){
				//登录成功，将session中的user置为用户ID。
				request.getSession().removeAttribute("name");
				request.getSession().removeAttribute("user");
				request.getSession().removeAttribute("role");
				request.getSession().setAttribute("name", customers.get(0).getcName());
				request.getSession().setAttribute("user", customers.get(0).getcId());
			}
			else{
				//如果查询不到，返回一个标识符提醒前端密码账号输入有误
				customer.setcAddress("false");
			}
		}
		else{
			System.out.println("输入有误");
			customer.setcAddress("ririri");
		}
		return customer;
	}
	

	/*
	 * 通过ID查询Customer的对象再返回给顾客的个人中心
	 * 
	 */
	@RequestMapping("/customer/showme")
	public ModelAndView customerShowMe(HttpServletRequest request, Customer customer) {
		int eId = (Integer) request.getSession().getAttribute("user");
		customer = customerbiz.findCustomerById(eId);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customer/showmemess");
		mv.addObject("customer", customer);
		return mv;
	}
	
	/*
	 * 登录成功后选择跳转的界面，以及进行一系列的相关处理
	 * 这里代码冗余
	 */
	@RequestMapping("testsuccess")
	public String testsuccess(HttpServletRequest request) {
		if(request.getSession().getAttribute("role")!=null
				&&request.getSession().getAttribute("role").equals(4)){
			return "background/index";
		}
		else if(request.getSession().getAttribute("role")!=null
				&&request.getSession().getAttribute("role").equals(3)){
			return "background/index";
		}
		else if(request.getSession().getAttribute("role")!=null
				&&request.getSession().getAttribute("role").equals(2)){
			return "background/index";
		}
		else if(request.getSession().getAttribute("role")!=null
				&&request.getSession().getAttribute("role").equals(1)){
			return "background/index";
		}
		else if(request.getSession().getAttribute("role")==null
				&&request.getSession().getAttribute("user")!=null){
			return "index";
		}
		else return "login";
	}
	
	/*
	 * 通过ID返回一个员工的信息到个人中心
	 */
	
	@RequestMapping("emp/showme")
	public ModelAndView showme(HttpServletRequest request, Employee employee) {
		int eId = (Integer) request.getSession().getAttribute("user");
		employee = customerbiz.findEmployeeById(eId);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("background/showmemess");
		mv.addObject("employee", employee);
		return mv;
	}
	
	/*
	 * 查询个人订单
	 */
    @RequestMapping("showSelfOrder")
    public ModelAndView showSelfOrder(
    		HttpServletRequest request,HttpServletResponse response,
            @RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="2") Integer pageSize) throws IOException{
    	Object attribute = request.getSession().getAttribute("user");
    	//System.out.println(page+"  "+pageSize);
    	ModelAndView mv=new ModelAndView();
    	
    	UserTestUtil.findUserTest(request, response);
    	System.out.println(attribute);
    	Integer cId =(Integer) attribute;
    	//System.out.println(page+pageSize);
        PageHelper.startPage(page, pageSize);  //出数据库 2条  通过mybatis变为一条
        List<Order> list = customerbiz.showLittleOrder(cId);
       // System.out.println("时间转换");
        
        //System.out.println(list.size()+"  "+list.get(0).getOrderDetail().size());
        //System.out.println(list);
        PageInfo<Order> p=new PageInfo<Order>(list);
        //System.out.println(p.getList());
        
        
        
        mv.addObject("orders", list);
        mv.addObject("page", p);
        mv.setViewName("myOrder");
        mv.addObject("thispagenum", page);
    	
        return mv;
        
    }
    
	
	/*
	 * 查询个人订单细节
	 */
    @RequestMapping("orderDetailshow")
    public ModelAndView orderDetailshow(
    		HttpServletRequest request,HttpServletResponse response,Integer oId
          ) throws IOException{
    	
    	//System.out.println(page+"  "+pageSize);
    	ModelAndView mv=new ModelAndView();
    	
    	UserTestUtil.findUserTest(request, response);
    	Object a = request.getSession().getAttribute("user");
    	Integer cId =(Integer) a;
    	//System.out.println(page+pageSize);
        //System.out.println(oId);
        List<Order> list = customerbiz.showOrder(cId);
        List<OrderDetail> detail=null;
        Order userOrder=new Order();
        for (Order order : list) {
			if(order.getoId()==oId){
				userOrder=order;
				detail=order.getOrderDetail();
			}
		}
        userOrder.setNums((userOrder.getOrderDetail().size()));
        Integer price = 0;
        for (OrderDetail orderDetail : userOrder.getOrderDetail()) {
        	price+=(int) ((orderDetail.getmCount())*(orderDetail.getMenu().getmPrice()));
		}
        userOrder.setPrices(price);
        mv.addObject("userOrder", userOrder);
        mv.addObject("orderDetail", detail);
        mv.setViewName("orderdetail");
    	
        return mv;
        
    }
	
	
	/*
	 * 
	 * 退出用的方法，移除session所有的状态
	 */
	
	@RequestMapping("removeuser")
	public String removeuser(HttpServletRequest request) {
		request.getSession().removeAttribute("name");
		request.getSession().removeAttribute("user");
		request.getSession().removeAttribute("role");
		return "login";
	}
	
	
}
