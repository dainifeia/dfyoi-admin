package com.dfyoi.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dfyoi.admin.pojo.SysRole;
import com.dfyoi.admin.pojo.SysRolePower;
import com.dfyoi.admin.service.SysRolePowerService;
import com.dfyoi.admin.service.SysRoleService;
import com.dfyoi.utils.comm.PagePara;
import com.dfyoi.utils.comm.ResultInfo;
import com.dfyoi.utils.comm.TreeOpration;
import com.dfyoi.utils.RequestUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
@RequestMapping(value = "/sysRole")
public class SysRoleController {
	@Resource
	private HttpServletRequest request;
	@Resource
	private SysRoleService roleService;
	@Resource
	private SysRolePowerService rolePowerService;

	/**
	 * Page 列表页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/index")
	public ModelAndView index() {
		ModelAndView mView = new ModelAndView("/sys/role/index");
		return mView;
	}

	/**
	 * Page 添加、编辑页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() {
		ModelAndView mView = new ModelAndView("/sys/role/save");
		Integer id = RequestUtil.getInteger(request, "id", 0);
		SysRole role = new SysRole();
		if (id != 0) {
			role = roleService.getRoleById(id);
		}
		mView.addObject("m", role);
		return mView;
	}
	
	/**
	 * Page 角色的权限配置页面
	 * @return
	 */
	@RequestMapping(value = "/setPower")
	public ModelAndView setPower() {
		ModelAndView mView = new ModelAndView("/sys/role/setPower");
		Integer id = RequestUtil.getInteger(request, "id", 0);
		SysRole role = new SysRole();
		List<SysRolePower> list = new ArrayList<SysRolePower>();
		if (id != 0) {
			role = roleService.getRoleById(id);
			list = rolePowerService.listByRoleSym(role.getSym());
		}
		
		mView.addObject("m", role);
		mView.addObject("list", list);
		return mView;
	}
	/**
	 * Func 角色配置好权限后的保存方法
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/setPower", method = RequestMethod.POST)
	public ResultInfo setPowerFun() {
		ResultInfo resultInfo = new ResultInfo();
		try {
			String roleSym = RequestUtil.getString(request, "roleSym","");
			String roleName = RequestUtil.getString(request, "roleName","");
			String symStr = RequestUtil.getString(request, "symStr","");
			String nameStr = RequestUtil.getString(request, "nameStr","");
			
			List<SysRolePower> list = rolePowerService.listByRoleSym(roleSym);
			String[] symArr = symStr.split("\\|");
			String[] nameArr = nameStr.split("\\|");
			for (int i = 0; i < symArr.length; i++) {
				String sym = symArr[i];
				String name = nameArr[i]; 
				int count = list.stream().filter(x->x.getRoleSym().equals(roleSym)&x.getPowerSym().equals(sym)).collect(Collectors.toList()).size();
				if(count<=0)
				{
					SysRolePower rolePower = new SysRolePower();
					rolePower.setRoleName(roleName);
					rolePower.setRoleSym(roleSym);
					rolePower.setPowerSym(sym);
					rolePower.setPowername(name);
					rolePowerService.insert(rolePower);
				}
				list.removeIf(x->x.getRoleSym().equals(roleSym)&x.getPowerSym().equals(sym));
			}
			for (SysRolePower item : list) {
				rolePowerService.removeById(item.getId());
			}
		} catch (Exception ex) {
			resultInfo.setSuccess(false);
			resultInfo.setMsg(ex.getMessage());
		}
		return resultInfo;
	}
	/**
	 * Func 添加、编辑页面
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ResultInfo save(SysRole role) {
		ResultInfo resultInfo = new ResultInfo();
		try {
			if (role.getId() != null) {
				// 修改,直接修改内容
				SysRole tempRole = roleService.getRoleById(role.getId());
				if (tempRole.getSym().equals(role.getSym())) {
					roleService.updateById(role);
				} else {
					tempRole = roleService.getRoleBySym(role.getSym());
					if (tempRole == null) {
						roleService.updateById(role);
					} else {
						resultInfo.setSuccess(false);
						resultInfo.setMsg("已经存在相同代码的角色");
					}
				}
			} else {
				// 根据代码获取信息
				SysRole tempRole = roleService.getRoleBySym(role.getSym());
				if (tempRole == null) {
					Integer maxorder = roleService.getMaxOrder();
					maxorder = maxorder == null ? 0 : maxorder;
					role.setOrderNumber(maxorder + 1);
					roleService.insert(role);
				} else {
					resultInfo.setSuccess(false);
					resultInfo.setMsg("已经存在相同代码的角色");
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
		HashMap<Object, Object> para = new HashMap<>();
		String roleName = RequestUtil.getString(request, "roleName");
		String roleSym = RequestUtil.getString(request, "roleSym");
		para.put("roleName", roleName);
		para.put("roleSym", roleSym);
		// 获取分页以及排序信息
		PagePara pagePara = new PagePara(request);
		PageHelper.startPage(pagePara.getPageNum(), pagePara.getPageSize());
		PageHelper.orderBy(pagePara.getOrderBy());
		// 紧跟着的第一个select方法会被分页
		List<SysRole> list = roleService.listByPara(para);
		// 分页后，实际返回的结果list类型是Page<E>，如果想取出分页信息，需要强制转换为Page<E>，
		@SuppressWarnings("resource")
		Page<SysRole> listPage = (Page<SysRole>) list;
		map.put("records", listPage.getTotal());
		map.put("page", listPage.getPageNum());
		map.put("total", listPage.getPages());
		map.put("rows", list);
		return map;
	}

	/**
	 * Func 根据ID删除记录
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public ResultInfo remove() {
		ResultInfo resultInfo = new ResultInfo(true, "删除成功");
		Integer id = RequestUtil.getInteger(request, "id");
		Integer orderNumber = RequestUtil.getInteger(request, "orderNumber");
		if (id != null) {
			try {
				roleService.removeById(id, orderNumber);
			} catch (Exception e) {
				resultInfo.setSuccess(false);
				resultInfo.setMsg(e.getMessage());
			}
		}
		return resultInfo;
	}

	/**
	 * Func 移动位置方法，前台直接请求此方法【上移、下移】
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/move", method = RequestMethod.POST)
	public ResultInfo move() {
		ResultInfo resultInfo = new ResultInfo(true, "移动成功");
		Integer id = RequestUtil.getInteger(request, "id");
		String opType = RequestUtil.getString(request, "opType");
		TreeOpration opration = TreeOpration.valueOf(opType);
		// 获取实体
		SysRole srcRole = roleService.getRoleById(id);
		SysRole destRole = new SysRole();
		switch (opration) {
		case MoveUp:
			destRole = roleService.getRoleMoveUp(srcRole.getOrderNumber());

			break;
		case MoveDown:
			destRole = roleService.getRoleMoveDown(srcRole.getOrderNumber());

			break;
		default:
			break;
		}
		// 如果有交换的信息
		if (destRole!= null) {
			Integer srcOrderNumber = srcRole.getOrderNumber();
			srcRole.setOrderNumber(destRole.getOrderNumber());
			destRole.setOrderNumber(srcOrderNumber);
			roleService.updateById(srcRole);
			roleService.updateById(destRole);
		} else {
			resultInfo.setSuccess(false);
			resultInfo.setMsg("没有可用于交换的节点信息");
		}
		return resultInfo;
	}

}
