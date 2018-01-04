package com.dfyoi.admin.mapper;

import java.util.HashMap;
import java.util.List;

import com.dfyoi.admin.pojo.SysPerson;
import com.dfyoi.platform.mybatis.MyBatisRepository;

@MyBatisRepository
public interface SysPersonMapper {
	int removeById(Integer id);

	int insert(SysPerson record);

	int insertSelective(SysPerson record);

	SysPerson getPersonById(Integer id);

	int updateByPrimaryKeySelective(SysPerson record);

	int updateById(SysPerson record);

	List<SysPerson> listByPara(HashMap<Object,Object> para);
}