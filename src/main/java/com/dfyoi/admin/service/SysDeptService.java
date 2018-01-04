package com.dfyoi.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dfyoi.admin.mapper.SysDeptMapper;
import com.dfyoi.admin.pojo.SysDept;

/**
 * @Title 说明
 * @description 描述
 * @author huishen
 * @version 1.0
 * @createAt 2017年9月22日 下午6:10:12
 * @Copyright: Copyright (c) 2017 bjsszt. All Rights Reserved
 */
@Service
@Transactional
public class SysDeptService {
	@Resource
	SysDeptMapper deptMapper;

	/**
	 * 新增一条记录
	 * 
	 * @param dept
	 * @return
	 */
	public void insert(SysDept dept) {
		// 插入记录
		deptMapper.insert(dept);
	}

	public void insertChild(SysDept dept, Integer rgt) {
		// 新增记录之前，先修改其他的节点的左右值，凡是右键大于rgt的均+2
		deptMapper.beforInsert(rgt);
		// 插入记录
		deptMapper.insert(dept);
	};

	/**
	 * 根据ID删除记录
	 * 
	 * @param id
	 * @return
	 */
	public void removeAndChild(Integer lft, Integer rgt) {
		deptMapper.removeAndChild(lft, rgt);
	}

	/**
	 * 更新记录
	 * 
	 * @param dept
	 * @return
	 */
	public int updateById(SysDept dept) {
		return deptMapper.updateById(dept);
	};

	/**
	 * 根据ID获取记录
	 * 
	 * @param id
	 * @return
	 */
	public SysDept getDeptById(Integer id) {
		SysDept dept = deptMapper.getDeptById(id);
		return dept;
	};

	/**
	 * 获取向上移动时需要交换的节点信息
	 * 
	 * @param lft
	 * @param level
	 * @return
	 */
	public SysDept getDeptMoveUp(Integer lft, Integer rgt, Integer level) {
		SysDept parent = deptMapper.getParentDept(lft, rgt, level - 1);
		SysDept dept = new SysDept();
		if (parent == null) {
			dept = deptMapper.getDeptMoveUp(lft, rgt, level, 0, rgt, 0);
		} else {
			dept = deptMapper.getDeptMoveUp(lft, rgt, level, parent.getLft(), parent.getRgt(), parent.getLevel());
		}

		return dept;
	}

	/**
	 * 获取向下移动时需要交换的节点信息
	 * 
	 * @param lft
	 * @param level
	 * @return
	 */
	public SysDept getDeptMoveDown(Integer lft, Integer rgt, Integer level) {
		SysDept parent = deptMapper.getParentDept(lft, rgt, level - 1);
		SysDept dept = new SysDept();
		if (parent == null) {
			dept = deptMapper.getDeptMoveDown(lft, rgt, level, 0, rgt, 0);
		} else {
			dept = deptMapper.getDeptMoveDown(lft, rgt, level, parent.getLft(), parent.getRgt(), parent.getLevel());
		}
		return dept;
	}

	/**
	 * 获取所有记录
	 * 
	 * @return
	 */
	public List<SysDept> listAll() {
		return deptMapper.listAll();
	}

	/**
	 * 根据左右值获取子孙节点
	 * 
	 * @param lft
	 * @param rgt
	 * @return
	 */
	public List<SysDept> listDescendant(Integer lft, Integer rgt) {
		return deptMapper.listDescendant(lft, rgt);
	}

	/**
	 * 获取最大的rgt值
	 * 
	 * @return
	 */
	public Integer getRgtMax() {
		return deptMapper.getMaxRgt();
	}
}
