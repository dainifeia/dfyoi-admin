package com.dfyoi.web.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dfyoi.web.mapper.WebFriendLinkMapper;
import com.dfyoi.web.pojo.WebFriendLink;

/**
* @Title 说明
* @description 描述
* @author huishen
* @version 1.0
* @createAt 2017年12月18日 下午4:38:53
* @Copyright: Copyright (c) 2017 bjsszt. All Rights Reserved
*/
@Service
public class WebFriendLinkService {
	@Resource
	WebFriendLinkMapper friendLinkMapper;
	public int removeById(Integer id) {
		return friendLinkMapper.removeById(id);
	}

	public int insert(WebFriendLink record) {
		return friendLinkMapper.insert(record);
	}

	public int insertSelective(WebFriendLink record) {
		return friendLinkMapper.insertSelective(record);
	}

	public WebFriendLink getWebFriendLinkById(Integer id) {
		return friendLinkMapper.getWebFriendLinkById(id);
	}
    
	public WebFriendLink getWebFriendLinkBySym(String sym) {
		return friendLinkMapper.getWebFriendLinkBySym(sym);
	}

	public int updateByPrimaryKeySelective(WebFriendLink record)
	{
		return friendLinkMapper.updateByPrimaryKeySelective(record);
	}

	public int updateById(WebFriendLink record) {
		return friendLinkMapper.updateById(record);
	}
    
	public List<WebFriendLink> listByPara(HashMap<Object,Object> para){
		return friendLinkMapper.listByPara(para);
	}
}
