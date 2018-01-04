package com.dfyoi.admin.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dfyoi.admin.mapper.SysDictMapper;
import com.dfyoi.admin.pojo.SysDict;

/**
 * @Title 说明
 * @description 描述
 * @author huishen
 * @version 1.0
 * @createAt 2017年12月16日 上午11:40:38
 * @Copyright: Copyright (c) 2017 bjsszt. All Rights Reserved
 */
@Service
public class SysDictService {
	@Resource
	SysDictMapper dictMapper;

	/**
	 * 新增一条记录
	 * 
	 * @param dept
	 * @return
	 */
	public void insert(SysDict dept) {
		// 插入记录
		dictMapper.insert(dept);
	}

	public void insertChild(SysDict dept, Integer rgt) {
		// 新增记录之前，先修改其他的节点的左右值，凡是右键大于rgt的均+2
		dictMapper.beforInsert(rgt);
		// 插入记录
		dictMapper.insert(dept);
	};

	/**
	 * 根据ID删除记录
	 * 
	 * @param id
	 * @return
	 */
	public void removeAndChild(Integer lft, Integer rgt) {
		dictMapper.removeAndChild(lft, rgt);
	}

	/**
	 * 更新记录
	 * 
	 * @param dept
	 * @return
	 */
	public int updateById(SysDict dept) {
		return dictMapper.updateById(dept);
	};

	/**
	 * 根据ID获取记录
	 * 
	 * @param id
	 * @return
	 */
	public SysDict getDictById(Integer id) {
		SysDict dept = dictMapper.getDictById(id);
		return dept;
	};
	
	/**
	 * 根据Sym获取记录
	 * @param sym
	 * @return
	 */
	public SysDict getDictBySym(String sym) {
		SysDict dept = dictMapper.getDictBySym(sym);
		return dept;
	};
	
	/**
	 * 获取向上移动时需要交换的节点信息
	 * 
	 * @param lft
	 * @param level
	 * @return
	 */
	public SysDict getDictMoveUp(Integer lft, Integer rgt, Integer level) {
		SysDict parent = dictMapper.getParentDict(lft, rgt, level - 1);
		SysDict dict = new SysDict();
		if (parent == null) {
			dict = dictMapper.getDictMoveUp(lft, rgt, level, 0, rgt, 0);
		} else {
			dict = dictMapper.getDictMoveUp(lft, rgt, level, parent.getLft(), parent.getRgt(), parent.getLevel());
		}
		return dict;
	}

	/**
	 * 获取向下移动时需要交换的节点信息
	 * 
	 * @param lft
	 * @param level
	 * @return
	 */
	public SysDict getDictMoveDown(Integer lft, Integer rgt, Integer level) {
		SysDict parent = dictMapper.getParentDict(lft, rgt, level - 1);
		SysDict dict = new SysDict();
		if (parent == null) {
			dict = dictMapper.getDictMoveDown(lft, rgt, level, 0, rgt, 0);
		} else {
			dict = dictMapper.getDictMoveDown(lft, rgt, level, parent.getLft(), parent.getRgt(), parent.getLevel());
		}
		return dict;
	}

	/**
	 * 获取所有记录
	 * 
	 * @return
	 */
	public List<SysDict> listAll() {
		return dictMapper.listAll();
	}

	/**
	 * 根据左右值获取子孙节点
	 * 
	 * @param lft
	 * @param rgt
	 * @return
	 */
	public List<SysDict> listDescendant(Integer lft, Integer rgt) {
		return dictMapper.listDescendant(lft, rgt);
	}

	/**
	 * 
	 * @param lft
	 * @param rgt
	 * @param level
	 * @return
	 */
	public List<SysDict> listChildren(Integer lft, Integer rgt, Integer level) {
		return dictMapper.listChildren(lft, rgt, level);
	}

	/**
	 * 获取最大的rgt值
	 * 
	 * @return
	 */
	public Integer getRgtMax() {
		return dictMapper.getMaxRgt();
	}

	public List<SysDict> listByPara(HashMap<Object, Object> para) {
		return dictMapper.listByPara(para);
	}
}
