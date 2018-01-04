package com.dfyoi.utils.comm;

import javax.servlet.http.HttpServletRequest;

import com.dfyoi.utils.RequestUtil;

/**
 * @Title 说明
 * @description 描述
 * @author huishen
 * @version 1.0
 * @createAt 2017年9月25日 上午9:47:36
 * @Copyright: Copyright (c) 2017 bjsszt. All Rights Reserved
 */

public class PagePara {
	public PagePara(HttpServletRequest request) {
		Integer pageNumPara = RequestUtil.getInteger(request, "page");
		if (pageNumPara != null) {
			this.setPageNum(pageNumPara);
		}
		Integer pageSizePara = RequestUtil.getInteger(request, "rows");
		if (pageSizePara != null) {
			this.setPageSize(pageSizePara);
		}
		String sidx = RequestUtil.getString(request, "sidx");
		String sord = RequestUtil.getString(request, "sord");

		if (sidx!=null && !sidx.equals("")) {
			if (sord == null || sord.equals("")) {
				this.setOrderBy(sidx + " desc");
			} else {
				this.setOrderBy(sidx + " " + sord);
			}
		} else {
			this.setOrderBy("id desc");
		}

	}

	private int pageNum;
	private int pageSize;
	private String orderBy;

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
}
