package com.dfyoi.admin.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dfyoi.admin.pojo.SysUser;
import com.dfyoi.platform.mybatis.MyBatisRepository;

@MyBatisRepository
public interface SysUserMapper {
    int removeById(Integer id);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    SysUser getUserById(Integer id);
    
    SysUser getUserByUserName(String userName);
    
    SysUser getUserByPersonId(Integer personId);
    
    SysUser login(@Param("userName") String userName, @Param("userPwd") String userPwd);
    
    int updateByPrimaryKeySelective(SysUser record);

    int updateById(SysUser record);
    
    List<SysUser> listByPara(HashMap<Object,Object> para);
}