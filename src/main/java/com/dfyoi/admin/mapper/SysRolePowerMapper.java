package com.dfyoi.admin.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.dfyoi.admin.pojo.SysRolePower;
import com.dfyoi.platform.mybatis.MyBatisRepository;

@MyBatisRepository
public interface SysRolePowerMapper {
	void removeById(Integer id);
    void removeByPowerSym(String powerSym);
    void removeByRoleSym(String roleSym);
    void removeByRoleAndPowerSym(@Param("roleSym") String roleSym, @Param("powerSym") String powerSym);
    void insert(SysRolePower record);
    List<SysRolePower> listByRoleSym(String roleSym);
    /*SysRolePower getByRoleAndPowerSym(String roleSym,String powerSym);*/
}