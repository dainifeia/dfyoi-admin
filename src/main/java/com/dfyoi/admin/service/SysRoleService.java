package com.dfyoi.admin.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dfyoi.admin.mapper.SysRoleMapper;
import com.dfyoi.admin.pojo.SysRole;

@Service
@Transactional
public class SysRoleService {
	@Resource
	SysRoleMapper roleMapper;

	/**
	 * 新增一条记录
	 * 
	 * @param role
	 * @return
	 */
	public void insert(SysRole role) {
		// 插入记录
		roleMapper.insert(role);
	}

	/**
	 * 根据ID删除记录
	 * 
	 * @param id
	 * @return
	 */
	public void removeById(Integer id, Integer orderNumber) {
		roleMapper.removeById(id, orderNumber);
	}

	/**
	 * 更新记录
	 * 
	 * @param role
	 * @return
	 */
	public int updateById(SysRole role) {
		return roleMapper.updateById(role);
	};

	/**
	 * 根据ID获取记录
	 * 
	 * @param id
	 * @return
	 */
	public SysRole getRoleById(Integer id) {
		SysRole role = roleMapper.getRoleById(id);
		return role;
	};

	/**
	 * 根据代码获取记录
	 * 
	 * @param sym
	 * @return
	 */
	public SysRole getRoleBySym(String sym) {
		SysRole role = roleMapper.getRoleBySym(sym);
		return role;
	};

	/**
	 * 获取所有记录
	 * 
	 * @return
	 */
	public List<SysRole> listByPara(HashMap<Object,Object> para) {
		return roleMapper.listByPara(para);
	}

	/**
	 * 获取最大的ordernumber值
	 * 
	 * @return
	 */
	public Integer getMaxOrder() {
		return roleMapper.getMaxOrder();
	}
	
	public SysRole getRoleMoveUp(Integer orderNumber) {
		return roleMapper.getRoleMoveUp(orderNumber);
	}
	public SysRole getRoleMoveDown(Integer orderNumber) {
		return roleMapper.getRoleMoveDown(orderNumber);
	}
}
