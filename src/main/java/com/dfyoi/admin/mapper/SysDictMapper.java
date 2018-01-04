package com.dfyoi.admin.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dfyoi.admin.pojo.SysDict;
import com.dfyoi.platform.mybatis.MyBatisRepository;

@MyBatisRepository
public interface SysDictMapper {
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
	int insert(SysDict record);

	/**
	 * @param record
	 * @return
	 */
	int insertSelective(SysDict record);

	/**
	 * 根据ID获取记录
	 * 
	 * @param id
	 * @return
	 */
	SysDict getDictById(Integer id);
	
	/**
	 * 根据sym获取节点信息
	 * @param sym
	 * @return
	 */
	SysDict getDictBySym(String sym);
	
	/**
	 * 获取父节点信息
	 * 
	 * @param id
	 * @return
	 */
	SysDict getParentDict(@Param("lft") Integer lft,@Param("rgt") Integer rgt, @Param("level") Integer level);

	/**
	 * 获取向上移动时需要交换的节点信息
	 * 
	 * @param lft
	 * @param level
	 * @return
	 */
	SysDict getDictMoveUp(@Param("lft") Integer lft,@Param("rgt") Integer rgt, @Param("level") Integer level,@Param("plft") Integer plft,@Param("prgt") Integer prgt, @Param("plevel") Integer plevel);

	/**
	 * 获取向下移动时需要交换的节点信息
	 * 
	 * @param lft
	 * @param level
	 * @return
	 */
	SysDict getDictMoveDown(@Param("lft") Integer lft,@Param("rgt") Integer rgt, @Param("level") Integer level,@Param("plft") Integer plft,@Param("prgt") Integer prgt, @Param("plevel") Integer plevel);

	/**
	 * 更新一条记录，添加判断，为空的不赋值
	 * 
	 * @param record
	 * @return
	 */
	int updateByPrimaryKeySelective(SysDict record);

	/**
	 * 根据ID更新记录
	 * 
	 * @param record
	 * @return
	 */
	int updateById(SysDict record);

	/**
	 * 获取所有记录
	 * 
	 * @return
	 */
	List<SysDict> listAll();
	
	/**
	 * 根据左右值获取子节点
	 * @param lft
	 * @param rgt
	 * @return
	 */
	List<SysDict> listDescendant(@Param("lft") Integer lft, @Param("rgt") Integer rgt);
	
	/**
	 * 获取子节点
	 * @param lft
	 * @param rgt
	 * @param level
	 * @return
	 */
	List<SysDict> listChildren(@Param("lft") Integer lft, @Param("rgt") Integer rgt, @Param("level") Integer level);
	
	/**
	 * 获取最大的rgt值
	 * 
	 * @return
	 */
	Integer getMaxRgt();
	
	/**
	 * 根据参数获取集合
	 * @param para
	 * @return
	 */
	List<SysDict> listByPara(HashMap<Object,Object> para);
}