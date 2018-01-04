package com.dfyoi.admin.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dfyoi.admin.mapper.SysPersonMapper;
import com.dfyoi.admin.pojo.SysPerson;

@Service
public class SysPersonService {
	@Resource
	SysPersonMapper personMapper;

	public void removeById(Integer id) {
		personMapper.removeById(id);
	}

	public void insert(SysPerson record) {
		personMapper.insert(record);
	}

	public SysPerson getPersonById(Integer id) {
		return personMapper.getPersonById(id);
	}

	public void updateById(SysPerson record) {
		personMapper.updateById(record);
	}

	public List<SysPerson> listByPara(HashMap<Object, Object> para) {
		return personMapper.listByPara(para);
	}
}
