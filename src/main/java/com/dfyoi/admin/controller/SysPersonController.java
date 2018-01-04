package com.dfyoi.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dfyoi.admin.pojo.SysPerson;
import com.dfyoi.admin.service.SysPersonService;
import com.dfyoi.utils.comm.PagePara;
import com.dfyoi.utils.comm.ResultInfo;
import com.dfyoi.utils.RequestUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
@RequestMapping(value = "/sysPerson")
public class SysPersonController {
	@Resource
	private HttpServletRequest request;
	@Resource
	private SysPersonService personService;

	/**
	 * Page 列表页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/index")
	public ModelAndView index() {
		ModelAndView mView = new ModelAndView("/sys/person/index");
		return mView;
	}
	/**
	 * Page 人员选择页面
	 * @return
	 */
	@RequestMapping(value = "/sel")
	public ModelAndView sel() {
		ModelAndView mView = new ModelAndView("/sys/person/sel");
		return mView;
	}

	/**
	 * Page 添加、编辑页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() {
		ModelAndView mView = new ModelAndView("/sys/person/save");
		Integer id = RequestUtil.getInteger(request, "id", 0);
		SysPerson person = new SysPerson();
		if (id != 0) {
			person = personService.getPersonById(id);
		}
		mView.addObject("m", person);
		return mView;
	}

	/**
	 * Func 添加、编辑页面
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ResultInfo save(SysPerson person) {
		ResultInfo resultInfo = new ResultInfo();
		try {
			if (person.getId() != null) {
				personService.updateById(person);
			} else {
				personService.insert(person);
			}
		} catch (Exception ex) {
			resultInfo.setSuccess(false);
			resultInfo.setMsg(ex.getMessage());
		}
		return resultInfo;
	}

	/**
	 * Func 获取所有的列表数据
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/listPara", method = RequestMethod.POST)
	public Map<String, Object> listPara() {
		Map<String, Object> map = new HashMap<String, Object>();
		// 获取第1页，10条内容，默认查询总数count
		PagePara pagePara = new PagePara(request);
		PageHelper.startPage(pagePara.getPageNum(), pagePara.getPageSize());
		PageHelper.orderBy(pagePara.getOrderBy());
		// 紧跟着的第一个select方法会被分页
		HashMap<Object, Object> para = new HashMap<>();
		para.put("deptId", RequestUtil.getInteger(request, "deptId"));
		para.put("personSex", RequestUtil.getString(request, "personSex"));
		para.put("personName", RequestUtil.getString(request, "personName"));

		List<SysPerson> list = personService.listByPara(para);
		// 分页后，实际返回的结果list类型是Page<E>，如果想取出分页信息，需要强制转换为Page<E>，
		@SuppressWarnings("resource")
		Page<SysPerson> listPage = (Page<SysPerson>) list;
		map.put("records", listPage.getTotal());
		map.put("page", listPage.getPageNum());
		map.put("total", listPage.getPages());
		map.put("rows", list);
		return map;
	}

	/**
	 * Func 根据ID删除记录
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public ResultInfo remove() {
		ResultInfo resultInfo = new ResultInfo(true, "删除成功");
		Integer id = RequestUtil.getInteger(request, "id");
		if (id != null) {
			try {
				personService.removeById(id);
			} catch (Exception e) {
				resultInfo.setSuccess(false);
				resultInfo.setMsg(e.getMessage());
			}
		}
		return resultInfo;
	}
}
