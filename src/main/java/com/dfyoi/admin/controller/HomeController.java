package com.dfyoi.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dfyoi.admin.pojo.SysPower;
import com.dfyoi.admin.pojo.SysUser;
import com.dfyoi.admin.service.SysPowerService;
import com.dfyoi.admin.service.SysUserService;
import com.dfyoi.platform.freemarker.FreeMarkerUtil;
import com.dfyoi.platform.freemarker.Freemark;
import com.dfyoi.utils.MD5Util;
import com.dfyoi.utils.RequestUtil;
import com.dfyoi.utils.comm.MenuInfo;
import com.dfyoi.utils.comm.ResultInfo;

/**
 * @Title 说明
 * @description 描述
 * @author huishen
 * @version 1.0
 * @createAt 2017年9月25日 上午10:21:11
 * @Copyright: Copyright (c) 2017 bjsszt. All Rights Reserved
 */
@Controller
@RequestMapping(value = "/Home")
public class HomeController {
	private static final String LAYER_OUT = "LEFT";// 分两种TOP和LEFT
	private static final String OPEN_IFRAME = "iframe-tab";
	private static final String OPEN_BLANK = "blank";
	@Resource
	private HttpServletRequest request;
	@Resource
	private SysUserService userService;
	@Resource
	private SysPowerService powerService;

	/**
	 * page 登陆页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/Login")
	public ModelAndView login() {
		ModelAndView mView = new ModelAndView("/home/login");
		
		/*try {
		 	//生成静态页面
			String tplPath =System.getProperty("webapp.root");
			Freemark fm = new Freemark(tplPath+"WEB-INF/ftl");
			Map<String, Object> data= new HashMap<String, Object>();
			data.put("username", "申辉");
			fm.setTemplateName("index.ftl");
			fm.setFileName("index.html");
			fm.setFilePath(tplPath+"staticweb");
			fm.setFreeData(data);
			FreeMarkerUtil fmu = new FreeMarkerUtil();
			fmu.CreateHtml(fm);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		return mView;
	}

	/**
	 * page 后台管理主页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/WorkPlate")
	public ModelAndView workPlate() {
		ModelAndView mView = new ModelAndView("/home/workCenter");
		mView.addObject("layout", LAYER_OUT);
		SysUser user = (SysUser) request.getSession().getAttribute("user");
		mView.addObject("p", user.getPersonName());
		mView.addObject("d", user.getDeptName());
		return mView;
	}

	/**
	 * Func 获取导航菜单，workplate页直接请求此方法
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "getMenu", method = RequestMethod.POST)
	public List<MenuInfo> getMenu() {
		// SecurityUtils.getSubject().getSession().getAttribute("user");
		SysUser user = (SysUser) request.getSession().getAttribute("user");
		List<SysPower> listPower = powerService.listPowerByRoleSym(user.getRoleSym(), 0);

		List<MenuInfo> listMenu = new ArrayList<MenuInfo>();

		// 左侧导航，无顶部菜单
		List<SysPower> listTop = listPower.stream().filter(x -> x.getLevel() == 0).collect(Collectors.toList());
		for (SysPower sysPower : listTop) {
			MenuInfo menu = new MenuInfo();
			menu.setId(sysPower.getSym());
			menu.setText(sysPower.getName());
			menu.setIcon(sysPower.getIcon());

			// 判断是否有子节点
			menu = getChildList(sysPower, menu, listPower);
			listMenu.add(menu);
		}
		return listMenu;
	}

	/**
	 * Func 获取子级菜单且递归调用本方法
	 * 
	 * @param power
	 * @param menuInfo
	 * @param listPower
	 * @return
	 */
	public MenuInfo getChildList(SysPower power, MenuInfo menuInfo, List<SysPower> listPower) {
		Integer level = power.getLevel() + 1;
		Integer lft = power.getLft();
		Integer rgt = power.getRgt();

		List<SysPower> list = listPower.stream()
				.filter(x -> x.getLevel() == level & x.getLft() > lft & x.getLft() < rgt).collect(Collectors.toList());
		if (list.size() > 0) {
			List<MenuInfo> listMenu = new ArrayList<MenuInfo>();
			for (SysPower sysPower : list) {
				MenuInfo menu = new MenuInfo();
				menu.setId(sysPower.getSym());
				menu.setText(sysPower.getName());
				menu.setIcon(sysPower.getIcon());
				listMenu.add(menu);
				// 判断是否有子节点
				getChildList(sysPower, menu, listPower);
			}
			menuInfo.setChildren(listMenu);
		} else {
			// 如果没有子节点就需要赋值打开路径以及打开方式
			menuInfo.setUrl(power.getUrl());
			menuInfo.setTargetType(power.getOpenType() == 0 ? OPEN_IFRAME : OPEN_BLANK);

		}
		return menuInfo;
	}

	/**
	 * page 登陆后看到的第一个页面，欢迎页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/Welcome")
	public ModelAndView welcome() {
		ModelAndView mView = new ModelAndView("/home/welcome");
		return mView;
	}

	/**
	 * Page 菜单图标选择页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/SelIcon")
	public ModelAndView selIcon() {
		ModelAndView mView = new ModelAndView("/home/selIcon");
		return mView;
	}

	/**
	 * Func 登录方法
	 */
	@ResponseBody
	@RequestMapping(value = "/Login", method = RequestMethod.POST)
	public ResultInfo loginPost() {
		ResultInfo resultInfo = new ResultInfo();
		try {
			String username = RequestUtil.getString(request, "u");
			String password = RequestUtil.getString(request, "p");
			// password = MD5Util.toMd5(password, username, 3);
			if (username == null || password == null) {
				resultInfo.setSuccess(false);
				resultInfo.setMsg("参数错误");
			} else {
				UsernamePasswordToken token = new UsernamePasswordToken(username, password);

				Subject currentUser = SecurityUtils.getSubject();
				if (!currentUser.isAuthenticated()) {
					// 使用shiro来验证
					// token.setRememberMe(true);
					try {
						currentUser.login(token);// 验证角色和权限
					} catch (UnknownAccountException e) {
						System.out.println(e.getMessage());
						resultInfo.setSuccess(false);
						resultInfo.setMsg("用户名/密码错误");
					} catch (IncorrectCredentialsException e) {
						resultInfo.setSuccess(false);
						resultInfo.setMsg("用户名/密码错误");
					} catch (ExcessiveAttemptsException e) {
						resultInfo.setSuccess(false);
						resultInfo.setMsg("登录失败多次，账户锁定10分钟");
					} catch (AuthenticationException e) {
						resultInfo.setSuccess(false);
						resultInfo.setMsg(e.getMessage());
					}
				}
			}
		} catch (Exception ex) {
			resultInfo.setSuccess(false);
			resultInfo.setMsg(ex.getMessage());
		}
		return resultInfo;
	}
	/**
	 * Func 密码修改方法
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/ModifyPwd", method = RequestMethod.POST)
	public ResultInfo modifyPwd() {
		ResultInfo resultInfo = new ResultInfo();
		String oldPwd = RequestUtil.getString(request, "oldPwd");
		String newPwd = RequestUtil.getString(request, "newPwd");
		SysUser user = (SysUser) request.getSession().getAttribute("user");

		// 第一步，判断旧密码是否正确
		// 使用shiro加密密码
		oldPwd = MD5Util.toMd5(oldPwd, user.getUserName(), 3);
		if (!oldPwd.equals(user.getUserPwd())) {
			resultInfo.setSuccess(false);
			resultInfo.setMsg("原始密码错误");
		} else {
			try {
				// 使用shiro加密密码
				newPwd = MD5Util.toMd5(newPwd, user.getUserName(), 3);
				user.setUserPwd(newPwd);
				userService.updateById(user);
				resultInfo.setMsg("密码修改成功");
			} catch (Exception ex) {
				resultInfo.setSuccess(false);
				resultInfo.setMsg(ex.getMessage());
			}
		}
		return resultInfo;
	}

	/**
	 * Page 退出登录页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/Logout")
	public ModelAndView logout() {
		ModelAndView mView = new ModelAndView("/home/login");
		SecurityUtils.getSubject().logout();
		return mView;
	}
}
