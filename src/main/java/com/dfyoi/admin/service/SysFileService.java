package com.dfyoi.admin.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dfyoi.admin.mapper.SysFileMapper;
import com.dfyoi.admin.pojo.SysFile;

@Service
@Transactional
public class SysFileService {
	@Resource
	SysFileMapper fileMapper;

	public int removeById(Integer id) {
		return fileMapper.removeById(id);
	}

	public int insert(SysFile record) {
		return fileMapper.insert(record);
	}
	public SysFile getFileById(Integer id) {
		return fileMapper.getFileById(id);
	}

	public int updateById(SysFile record) {
		return fileMapper.updateById(record);
	}

	public List<SysFile> listByPara(HashMap<Object, Object> para) {
		return fileMapper.listByPara(para);
	}
}
