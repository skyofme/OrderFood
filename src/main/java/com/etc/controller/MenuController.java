package com.etc.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.etc.biz.AdminMenuBiz;
import com.etc.dao.FoodKindDao;
import com.etc.entity.Customer;
import com.etc.entity.FoodKind;
import com.etc.entity.Menu;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/menu")
public class MenuController {

	private static Logger logger = Logger.getLogger(MenuController.class);

	@Autowired
	AdminMenuBiz adminmenubiz;

	@Autowired
	FoodKindDao foodkind;

	@GetMapping("/menuAll/{page}/{pageSize}")
	public String findall(@PathVariable("page") Integer page,
			@PathVariable("pageSize") Integer pageSize,Map<String, Object> map) {
		PageHelper.startPage(page, pageSize);
		List<Menu> list = adminmenubiz.find();
		List<FoodKind> foodKinds=foodkind.select();
		PageInfo<Menu> p = new PageInfo<Menu>(list);
		map.put("menus", list);
		map.put("page", p);
		map.put("kinds", foodKinds);
		map.put("typeflag", false);
		map.put("type", "所有种类");
		return "background/menuAll";

	}
	@GetMapping("/menuAll/{page}/{pageSize}/{type}")
	public String findall(@PathVariable("page") Integer page,
			@PathVariable("pageSize") Integer pageSize, @PathVariable("type") String type,Map<String, Object> map) {
		System.out.println("-------看到的"+type);
		List<Menu> list=null;
		PageHelper.startPage(page, pageSize);
		Boolean typeflag=false;
		if(type.equals("所有种类")){
		list = adminmenubiz.find();
		}
		else {
			list=adminmenubiz.findByFoodTypeName(type);
			typeflag=true;
		}
		List<FoodKind> foodKinds=foodkind.select();
		PageInfo<Menu> p = new PageInfo<Menu>(list);
		map.put("menus", list);
		map.put("type", type);
		map.put("page", p);
		map.put("kinds", foodKinds);
		System.out.println(foodKinds);
		map.put("typeflag", typeflag);
		return "background/menuAll";

	}

	@GetMapping("/doedit/{id}")
	public String findById(@PathVariable("id") Integer id,
			Map<String, Object> map) {
		Menu menu = adminmenubiz.findById(id);
		map.put("menu", menu);
		return "background/domenuedit";

	}

	@GetMapping("/findMeishi")
	public ModelAndView findMeishi() {
		List<Menu> menu = adminmenubiz.findMeishi();
		System.out.println("传值-------------" + menu);
		List<FoodKind> foodkind = adminmenubiz.selectFoodKind();
		System.out.println("传值-------------" + foodkind);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("meishi"); // 放置页面信息
		mv.addObject("menu", menu);
		mv.addObject("foodkind", foodkind);
		List<Menu> menu1 = adminmenubiz.findByFoodTypeName(foodkind.get(0)
				.getFkName());
		List<Menu> menu2 = adminmenubiz.findByFoodTypeName(foodkind.get(1)
				.getFkName());
		List<Menu> menu3 = adminmenubiz.findByFoodTypeName(foodkind.get(2)
				.getFkName());
		List<Menu> menu4 = adminmenubiz.findByFoodTypeName(foodkind.get(3)
				.getFkName());
		List<Menu> menu5 = adminmenubiz.findByFoodTypeName(foodkind.get(4)
				.getFkName());
		// 根据菜单类型显示不同的菜
		mv.addObject("menu1", menu1);
		mv.addObject("menu2", menu2);
		mv.addObject("menu3", menu3);
		mv.addObject("menu4", menu4);
		mv.addObject("menu5", menu5);
		return mv;
	}
	

	//搜索查询菜名
	@PostMapping("/searchfood")
	public ModelAndView searchFood(Menu m){
		System.out.println("得到的菜名："+m.getmName());
		List<Menu> smenu = adminmenubiz.searchByName(m.getmName());
		ModelAndView mv = new ModelAndView();
		mv.addObject("foodname",m.getmName());
		mv.addObject("smenu",smenu);
		mv.setViewName("searchMeishi");
		return mv;
		
	}
	//查寻食物详情
	@GetMapping("/findMeishiDetailByName/{fname}")
	public ModelAndView findMeishiDetailByName(@PathVariable("fname") String fname ){
		System.out.println("选择的菜名"+fname);
		
		String fdname= fname.replace("\"", "");
		Menu menu = adminmenubiz.findMeishiDetailByName(fdname);
		ModelAndView mv = new ModelAndView();
		mv.addObject("menuDetail",menu);
		System.out.println(menu);
		mv.setViewName("meishi-detail");
		return mv;
	}
	//添加食物到购物车
	@PostMapping("/addToShopCar")
	@ResponseBody
	public String addToShopCar(Integer buyNum,String username,String foodname){
		System.out.println("m----"+ buyNum);
		System.out.println("----"+username);
		System.out.println("-------"+foodname);
		Integer mCount = buyNum;
		String userName = username;
		String foodName = foodname;
		boolean result = adminmenubiz.addToShopCar(mCount,userName,foodName);
		System.out.println("结果"+result);
		return "meishi-detail";
		
	}
	
	//根据类型名称查找对应菜单
//		@GetMapping("/findMeishiByType")
//		@ResponseBody
//		public List<Menu> findMeishiByType(String foodtypeName){
//			List<Menu> onemenu = adminmenubiz.findByFoodTypeName(foodtypeName);
//			System.out.println("aaaa"+onemenu);
//			return onemenu;	
//		}
	

	
	@PostMapping("/editsuc")
	public String edit(Menu m, MultipartFile file, HttpSession session,

	HttpServletRequest request) {
		Menu menu = adminmenubiz.findByName(m.getmName());
		String msg = null;
		if (menu != null && menu.getmId() != m.getmId()) {
			System.out.println("menu:" + menu);
			System.out.println("m:" + m);
			msg = "修改失败，已存在同名菜！";
		} else {
			msg = "修改成功，将返回所有菜单！";

			System.out.println("得到的种类---------" + m.getFk().getFkName());
			String type = m.getFk().getFkName();
			System.out.println("---------" + foodkind.selectbykind(type));
			int count = foodkind.selectbykind(type);
			if (count == 0) {
				foodkind.add(type);
				count = foodkind.selectbykind(type);
			}

			FoodKind fk = foodkind.selectfk(type);
			System.out.println("--------" + fk);
			m.setFk(fk);
			if (file.getOriginalFilename() != "") {
				System.out.println("文件传过来了，修改地址吧" + file.getOriginalFilename());
				String picture = upload(file, request);
				m.setmPicture(picture);
			}
			adminmenubiz.update(m);
			// 添加日志
			String context = adminmenubiz.dolog("编辑", m);
			Object obj = request.getSession().getAttribute("user");// 通过session得到登录人的e_id
			MDC.put("e_id", obj); // 根据登陆人的id
			logger.error(context);
		}
		request.setAttribute(
				"init1",
				"<script>alert('"
						+ msg
						+ "');function init1(){document.getElementById('allmenu').click();}</script>");
		return "background/index";

	}

	@GetMapping("/preaddmenu")
	public String jump() {
		return "background/domenuadd";
	}

	@PostMapping("/addsuc")
	public String add(Menu m, MultipartFile file, HttpSession session,

	HttpServletRequest request) {
		Menu menu = adminmenubiz.findByName(m.getmName());
		// 如果菜名不为空且数据库中不存在同名菜
		String msg = null;
		if (null != menu && menu.getmName().equals(m.getmName())) {
			System.out.println("menu" + menu);
			System.out.println("m" + m);
			msg = "添加失败，已存在同名菜！";
		} else {
			msg = "添加成功~";
			System.out.println("得到的种类---------" + m.getFk().getFkName());
			String type = m.getFk().getFkName();
			System.out.println("---------" + foodkind.selectbykind(type));
			int count = foodkind.selectbykind(type);
			if (count == 0) {
				foodkind.add(type);
				count = foodkind.selectbykind(type);
			}

			FoodKind fk = foodkind.selectfk(type);
			System.out.println("--------" + fk);
			m.setFk(fk);
			if (file.getOriginalFilename() != "") {
				System.out.println("文件传过来了，修改地址吧" + file.getOriginalFilename());
				String picture = upload(file, request);
				m.setmPicture(picture);
			}
			adminmenubiz.add(m);

			// 添加日志
			String context = adminmenubiz.dolog("添加", m);
			Object obj = request.getSession().getAttribute("user");// 通过session得到登录人的e_id
			MDC.put("e_id", obj); // 根据登陆人的id
			logger.error(context);
		}
		request.setAttribute(
				"init1",
				"<script>alert('"
						+ msg
						+ "');function init1(){document.getElementById('allmenu').click();}</script>");
		return "background/index";

	}

	@GetMapping("/dosellout/{id}")
	public String sellout(@PathVariable("id") Integer id, HttpSession session,
			HttpServletRequest request) {
		if (adminmenubiz.sellout(id)) {
			// 添加日志
			Menu menu = adminmenubiz.findById(id);
			String context = "把" + menu.getmName().trim() + "下架了";
			Object obj = request.getSession().getAttribute("user");// 通过session得到登录人的e_id
			MDC.put("e_id", obj); // 根据登陆人的id
			logger.error(context);
			return "redirect:/menu/menuAll/1/3";
		}
		return null;
	}

	public static String upload(MultipartFile file, HttpServletRequest request) {
		// 获取当前时间，作为上传后的文件名
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
		String res = sdf.format(new Date());
		// upload文件夹位置
		String rootPath = request.getSession().getServletContext()
				.getRealPath("upload/");

		// 原始名称
		String originalFileName = file.getOriginalFilename();
		System.out.println("originalFileName:" + originalFileName);
		// 新文件名
		String newFileName = "food" + res
				+ originalFileName.substring(originalFileName.lastIndexOf("."));
		System.out.println("newFileName:" + newFileName);
		// 创建年月文件夹
		Calendar date = Calendar.getInstance();
		File dateDirs = new File(date.get(Calendar.YEAR) + File.separator
				+ (date.get(Calendar.MONTH) + 1));
		System.out.println("dateDirs :" + dateDirs);
		// 绝对路径
		File newFile = new File(rootPath + File.separator + dateDirs
				+ File.separator + newFileName);
		System.out.println("newFile " + newFile);
		File nf = new File(dateDirs + File.separator + newFileName);
		System.out.println("相对路径：" + nf);
		// 判断目标文件所在目录是否存在
		if (!newFile.getParentFile().exists()) {
			// 如果目标文件所在的目录不存在，则创建父目录
			newFile.getParentFile().mkdirs();
		}
		// 都是绝对路径。。。
		System.out.println(newFile);
		System.out.println(newFile.getAbsolutePath());
		System.out.println(newFile.getPath());
		// 将内存中的数据写入磁盘
		try {
			file.transferTo(newFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// return newFile.getAbsolutePath();

		// 完整的url
		String fileUrl = "upload" + "/" + date.get(Calendar.YEAR) + "/"
				+ (date.get(Calendar.MONTH) + 1) + "/" + newFileName;
		fileUrl = fileUrl.replaceAll("\\\\", "/");
		System.out.println("fileUrl:" + fileUrl);
		return fileUrl;
	}
}
