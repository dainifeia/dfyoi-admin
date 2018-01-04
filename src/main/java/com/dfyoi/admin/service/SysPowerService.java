package com.dfyoi.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dfyoi.admin.mapper.SysPowerMapper;
import com.dfyoi.admin.pojo.SysPower;

@Service
public class SysPowerService {
	@Resource
	SysPowerMapper powerMapper;

	/**
	 * 新增一条记录
	 * 
	 * @param dept
	 * @return
	 */
	public void insert(SysPower power) {
		// 插入记录
		powerMapper.insert(power);
	}

	public void insertChild(SysPower power, Integer rgt) {
		// 新增记录之前，先修改其他的节点的左右值，凡是右键大于rgt的均+2
		powerMapper.beforInsert(rgt);
		// 插入记录
		powerMapper.insert(power);
	};

	/**
	 * 根据ID删除记录
	 * 
	 * @param id
	 * @return
	 */
	public void removeAndChild(Integer lft, Integer rgt) {
		powerMapper.removeAndChild(lft, rgt);
	}

	/**
	 * 更新记录
	 * 
	 * @param dept
	 * @return
	 */
	public int updateById(SysPower power) {
		return powerMapper.updateById(power);
	};

	/**
	 * 根据ID获取记录
	 * 
	 * @param id
	 * @return
	 */
	public SysPower getPowerById(Integer id) {
		SysPower power = powerMapper.getPowerById(id);
		return power;
	};

	/**
	 * 根据代码获取记录
	 * 
	 * @param sym
	 * @return
	 */
	public SysPower getPowerBySym(String sym) {
		SysPower power = powerMapper.getPowerBySym(sym);
		return power;
	};
	/**
	 * 获取向上移动时需要交换的节点信息
	 * 
	 * @param lft
	 * @param level
	 * @return
	 */
	public SysPower getPowerMoveUp(Integer lft, Integer rgt, Integer level) {
		SysPower parent = powerMapper.getParentPower(lft, rgt, level - 1);
		SysPower power = new SysPower();
		if (parent == null) {
			power = powerMapper.getPowerMoveUp(lft, rgt, level, 0, rgt, 0);
		} else {
			power = powerMapper.getPowerMoveUp(lft, rgt, level, parent.getLft(), parent.getRgt(), parent.getLevel());
		}
		return power;
	}

	/**
	 * 获取向下移动时需要交换的节点信息
	 * 
	 * @param lft
	 * @param level
	 * @return
	 */
	public SysPower getPowerMoveDown(Integer lft, Integer rgt, Integer level) {
		SysPower parent = powerMapper.getParentPower(lft, rgt, level - 1);
		SysPower power = new SysPower();
		if (parent == null) {
			power = powerMapper.getPowerMoveDown(lft, rgt, level, 0, rgt, 0);
		} else {
			power = powerMapper.getPowerMoveDown(lft, rgt, level, parent.getLft(), parent.getRgt(), parent.getLevel());
		}
		return power;
	}

	/**
	 * 获取所有记录
	 * 
	 * @return
	 */
	public List<SysPower> listAll() {
		return powerMapper.listAll();
	}

	/**
	 * 根据左右值获取子孙节点
	 * 
	 * @param lft
	 * @param rgt
	 * @return
	 */
	public List<SysPower> listDescendant(Integer lft, Integer rgt) {
		return powerMapper.listDescendant(lft, rgt);
	}
	
	public List<SysPower> listPowerByRoleSym(String roleSym,int powerType)
	{
		return powerMapper.listPowerByRoleSym(roleSym,powerType);
	}
	/**
	 * 获取最大的rgt值
	 * 
	 * @return
	 */
	public Integer getMaxRgt() {
		return powerMapper.getMaxRgt();
	}
}
