package com.dfyoi.admin.mapper;

import java.util.HashMap;
import java.util.List;

import com.dfyoi.admin.pojo.SysFile;
import com.dfyoi.platform.mybatis.MyBatisRepository;

@MyBatisRepository
public interface SysFileMapper {
    int removeById(Integer id);

    int insert(SysFile record);
	
    int insertSelective(SysFile record);

    SysFile getFileById(Integer id);

    int updateByPrimaryKeySelective(SysFile record);

    int updateById(SysFile record);
    
    List<SysFile> listByPara(HashMap<Object,Object> para);
}