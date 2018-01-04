package com.dfyoi.admin.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dfyoi.admin.pojo.SysRole;
import com.dfyoi.platform.mybatis.MyBatisRepository;

@MyBatisRepository
public interface SysRoleMapper {
	int removeById(@Param("id") Integer id, @Param("orderNumber") Integer orderNumber);

	int insert(SysRole record);

	int insertSelective(SysRole record);

	SysRole getRoleById(Integer id);

	SysRole getRoleBySym(String sym);

	int updateByPrimaryKeySelective(SysRole record);

	int updateById(SysRole record);

	List<SysRole> listByPara(HashMap<Object,Object> para);
	/**
	 * 获取最大的ordernumber值
	 * 
	 * @return
	 */
	Integer getMaxOrder();
	/**
	 * 获取向上移动时需要交换的节点信息
	 * 
	 * @param orderNumber
	 * @return
	 */
	SysRole getRoleMoveUp(@Param("orderNumber") Integer orderNumber);

	/**
	 * 获取向下移动时需要交换的节点信息
	 * 
	 * @param orderNumber
	 * @return
	 */
	SysRole getRoleMoveDown(@Param("orderNumber") Integer orderNumber);
}
