package com.dfyoi.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dfyoi.admin.pojo.SysDept;
import com.dfyoi.platform.mybatis.MyBatisRepository;

/**
 * @Title 说明
 * @description 描述
 * @author huishen
 * @version 1.0
 * @createAt 2017年9月22日 下午5:54:22
 * @Copyright: Copyright (c) 2017 bjsszt. All Rights Reserved
 */
@MyBatisRepository
public interface SysDeptMapper {
	/**
	 * 根据ID删除机构
	 * 
	 * @param id
	 * @return
	 */
	int removeById(Integer id);

	/**
	 * 根据左右值删除子节点
	 * 
	 * @param lft
	 * @param rgt
	 * @return
	 */
	int removeAndChild(@Param("lft") Integer lft, @Param("rgt") Integer rgt);

	/**
	 * 在添加节点之前，先更新其他的节点，将其左右值分别+2
	 * 
	 * @param rgt
	 * @return
	 */
	int beforInsert(Integer rgt);

	/**
	 * 新增一条记录
	 * 
	 * @param record
	 * @return
	 */
	int insert(SysDept record);

	/**
	 * @param record
	 * @return
	 */
	int insertSelective(SysDept record);

	/**
	 * 根据ID获取记录
	 * 
	 * @param id
	 * @return
	 */
	SysDept getDeptById(Integer id);
	/**
	 * 获取父节点信息
	 * 
	 * @param id
	 * @return
	 */
	SysDept getParentDept(@Param("lft") Integer lft,@Param("rgt") Integer rgt, @Param("level") Integer level);

	/**
	 * 获取向上移动时需要交换的节点信息
	 * 
	 * @param lft
	 * @param level
	 * @return
	 */
	SysDept getDeptMoveUp(@Param("lft") Integer lft,@Param("rgt") Integer rgt, @Param("level") Integer level,@Param("plft") Integer plft,@Param("prgt") Integer prgt, @Param("plevel") Integer plevel);

	/**
	 * 获取向下移动时需要交换的节点信息
	 * 
	 * @param lft
	 * @param level
	 * @return
	 */
	SysDept getDeptMoveDown(@Param("lft") Integer lft,@Param("rgt") Integer rgt, @Param("level") Integer level,@Param("plft") Integer plft,@Param("prgt") Integer prgt, @Param("plevel") Integer plevel);

	/**
	 * 更新一条记录，添加判断，为空的不赋值
	 * 
	 * @param record
	 * @return
	 */
	int updateByPrimaryKeySelective(SysDept record);

	/**
	 * 根据ID更新记录
	 * 
	 * @param record
	 * @return
	 */
	int updateById(SysDept record);

	/**
	 * 获取所有记录
	 * 
	 * @return
	 */
	List<SysDept> listAll();
	
	/**
	 * 根据左右值获取子节点
	 * @param lft
	 * @param rgt
	 * @return
	 */
	List<SysDept> listDescendant(@Param("lft") Integer lft, @Param("rgt") Integer rgt);
	
	/**
	 * 获取最大的rgt值
	 * 
	 * @return
	 */
	Integer getMaxRgt();

}
