package com.dfyoi.admin.service;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.dfyoi.admin.mapper.SysRolePowerMapper;
import com.dfyoi.admin.pojo.SysRolePower;

@Service
public class SysRolePowerService {
	@Resource
	SysRolePowerMapper rolePowerMapper;
	public void removeById(Integer id) {
		rolePowerMapper.removeById(id);
	}
    public void removeByPowerSym(String powerSym) {
    	rolePowerMapper.removeByPowerSym(powerSym);
    }
    public void removeByRoleSym(String roleSym) {
    	rolePowerMapper.removeByRoleSym(roleSym);
    }
    public void removeByRoleAndPowerSym(String roleSym,String powerSym) {
    	rolePowerMapper.removeByRoleAndPowerSym(roleSym, powerSym);
    }
    public void insert(SysRolePower record) {
    	rolePowerMapper.insert(record);
    }
    public List<SysRolePower> listByRoleSym(String roleSym){
    	return rolePowerMapper.listByRoleSym(roleSym);
    }
}
