package com.dfyoi.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dfyoi.admin.pojo.SysRole;
import com.dfyoi.admin.pojo.SysUser;
import com.dfyoi.admin.service.SysRoleService;
import com.dfyoi.admin.service.SysUserService;
import com.dfyoi.utils.comm.PagePara;
import com.dfyoi.utils.comm.ResultInfo;
import com.dfyoi.utils.MD5Util;
import com.dfyoi.utils.RequestUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
@RequestMapping(value = "/sysUser")
public class SysUserController {
	@Resource
	private HttpServletRequest request;
	@Resource
	private SysUserService userService;
	@Resource
	private SysRoleService roleService;

	/**
	 * Page 列表页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/index")
	public ModelAndView index() {
		ModelAndView mView = new ModelAndView("/sys/user/index");
		return mView;
	}

	/**
	 * Page 添加、编辑页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() {
		ModelAndView mView = new ModelAndView("/sys/user/save");
		Integer id = RequestUtil.getInteger(request, "id", 0);
		SysUser user = new SysUser();
		if (id != 0) {
			user = userService.getUserById(id);
		}
		HashMap<Object, Object> para = new HashMap<>();
		List<SysRole> list = roleService.listByPara(para);
		mView.addObject("m", user);
		mView.addObject("role", list);
		return mView;
	}

	/**
	 * Func 添加、编辑页面
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ResultInfo save(SysUser user) {
		RequestUtil.printParameters(request);
		ResultInfo resultInfo = new ResultInfo();
		String pwd = user.getUserPwd();
		if (pwd.length() < 32) {
			// 使用shiro加密密码
			pwd = MD5Util.toMd5(pwd, user.getUserName(), 3);
			user.setUserPwd(pwd);
		}
		try {
			if (user.getId() != null) {
				SysUser tempUser = userService.getUserById(user.getId());
				if (tempUser.getUserName().equals(user.getUserName())) {
					if (tempUser.getPersonId() == user.getPersonId()) {
						userService.updateById(user);
					} else {
						tempUser = userService.getUserByPersonId(user.getPersonId());
						if (tempUser == null) {
							userService.updateById(user);
						} else {
							resultInfo.setSuccess(false);
							resultInfo.setMsg("已经为此人配置过账户,请勿重复配置");
						}
					}
				} else {
					// 人没变
					if (tempUser.getPersonId() == user.getPersonId()) {
						tempUser = userService.getUserByUserName(user.getUserName());
						if (tempUser == null) {
							userService.updateById(user);
						} else {
							resultInfo.setSuccess(false);
							resultInfo.setMsg("已经存在相同的用户名");
						}
					} else {
						// 人变了
						tempUser = userService.getUserByPersonId(user.getPersonId());
						if (tempUser == null) {
							userService.updateById(user);
						} else {
							resultInfo.setSuccess(false);
							resultInfo.setMsg("已经为此人配置过账户,请勿重复配置");
						}
					}
				}
			} else {
				// 根据代码获取信息
				SysUser tempUser = userService.getUserByUserName(user.getUserName());
				if (tempUser == null) {
					tempUser = userService.getUserByPersonId(user.getPersonId());
					if (tempUser == null) {
						userService.insert(user);
					} else {
						resultInfo.setSuccess(false);
						resultInfo.setMsg("已经为此人配置过账户,请勿重复配置");
					}
				} else {
					resultInfo.setSuccess(false);
					resultInfo.setMsg("已经存在相同的用户名");
				}

			}
		} catch (Exception ex) {
			resultInfo.setSuccess(false);
			resultInfo.setMsg(ex.getMessage());
		}
		return resultInfo;
	}

	/**
	 * Func 获取所有的列表数据
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/listPara", method = RequestMethod.POST)
	public Map<String, Object> listPara() {
		Map<String, Object> map = new HashMap<String, Object>();
		// 获取以及排序信息
		PagePara pagePara = new PagePara(request);
		PageHelper.startPage(pagePara.getPageNum(), pagePara.getPageSize());
		PageHelper.orderBy(pagePara.getOrderBy());
		// 紧跟着的第一个select方法会被分页
		RequestUtil.printParameters(request);
		HashMap<Object, Object> para = new HashMap<>();
		para.put("deptId", RequestUtil.getInteger(request, "deptId"));
		para.put("userName", RequestUtil.getString(request, "userName"));
		para.put("personName", RequestUtil.getString(request, "personName"));
		List<SysUser> list = userService.listByPara(para);
		// 分页后，实际返回的结果list类型是Page<E>，如果想取出分页信息，需要强制转换为Page<E>，
		@SuppressWarnings("resource")
		Page<SysUser> listPage = (Page<SysUser>) list;
		map.put("records", listPage.getTotal());
		map.put("page", listPage.getPageNum());
		map.put("total", listPage.getPages());
		map.put("rows", list);
		return map;
	}

	/**
	 * Func 根据ID删除记录
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public ResultInfo remove() {
		ResultInfo resultInfo = new ResultInfo(true, "删除成功");
		Integer id = RequestUtil.getInteger(request, "id");
		if (id != null) {
			try {
				userService.removeById(id);
			} catch (Exception e) {
				resultInfo.setSuccess(false);
				resultInfo.setMsg(e.getMessage());
			}
		}
		return resultInfo;
	}

	@ResponseBody
	@RequestMapping(value = "/ResetPwd", method = RequestMethod.POST)
	public ResultInfo resetPwd() {
		ResultInfo resultInfo = new ResultInfo();
		Integer userid = RequestUtil.getInteger(request, "id");
		SysUser user = userService.getUserById(userid);
		try {
			// 使用shiro加密密码
			String newPwd = MD5Util.toMd5("123456", user.getUserName(), 3);
			user.setUserPwd(newPwd);
			userService.updateById(user);
			resultInfo.setMsg("密码重置成功");
		} catch (Exception ex) {
			resultInfo.setSuccess(false);
			resultInfo.setMsg(ex.getMessage());
		}
		return resultInfo;
	}

}
