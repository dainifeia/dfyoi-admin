package com.dfyoi.web.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dfyoi.web.mapper.WebNewsMapper;
import com.dfyoi.web.pojo.WebNews;

@Service
@Transactional
public class WebNewsService {
	@Resource
	WebNewsMapper newsMapper;
	public int removeById(Integer id) {
		return newsMapper.removeById(id);
	}

	public int insert(WebNews record) {
		return newsMapper.insert(record);
	}

	public int insertSelective(WebNews record) {
		return newsMapper.insertSelective(record);
	}

	public WebNews getWebNewsById(Integer id) {
		return newsMapper.getWebNewsById(id);
	}
    
	public WebNews getWebNewsBySym(String sym) {
		return newsMapper.getWebNewsBySym(sym);
	}

	public int updateByPrimaryKeySelective(WebNews record)
	{
		return newsMapper.updateByPrimaryKeySelective(record);
	}

	public int updateById(WebNews record) {
		return newsMapper.updateById(record);
	}
    
	public List<WebNews> listByPara(HashMap<Object,Object> para){
		return newsMapper.listByPara(para);
	}
}
