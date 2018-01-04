package com.dfyoi.web.mapper;

import java.util.HashMap;
import java.util.List;

import com.dfyoi.platform.mybatis.MyBatisRepository;
import com.dfyoi.web.pojo.WebNews;

@MyBatisRepository
public interface WebNewsMapper {
    int removeById(Integer id);

    int insert(WebNews record);

    int insertSelective(WebNews record);

    WebNews getWebNewsById(Integer id);
    
    WebNews getWebNewsBySym(String sym);

    int updateByPrimaryKeySelective(WebNews record);

    int updateById(WebNews record);
    
    List<WebNews> listByPara(HashMap<Object,Object> para);
}