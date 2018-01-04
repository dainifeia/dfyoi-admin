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

import com.dfyoi.admin.pojo.SysDict;
import com.dfyoi.admin.service.SysDictService;
import com.dfyoi.utils.comm.ResultInfo;
import com.dfyoi.utils.comm.TreeOpration;
import com.dfyoi.utils.RequestUtil;

/**
 * @Title 说明
 * @description 描述
 * @author huishen
 * @version 1.0
 * @createAt 2017年12月16日 上午10:47:05
 * @Copyright: Copyright (c) 2017 bjsszt. All Rights Reserved
 */
@Controller
@RequestMapping(value = "/sysDict")
public class SysDictController {
	@Resource
	private HttpServletRequest request;
	@Resource
	SysDictService dictService;

	/**
	 * Page 列表页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/index")
	public ModelAndView index() {
		ModelAndView mView = new ModelAndView("/sys/dict/index");
		return mView;
	}

	/**
	 * Page 添加、编辑页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() {
		ModelAndView mView = new ModelAndView("/sys/dict/save");
		Integer id = RequestUtil.getInteger(request, "id", 0);
		Integer srgt = RequestUtil.getInteger(request, "srgt", 0);
		Integer slevel = RequestUtil.getInteger(request, "slevel", 0);
		String opType = RequestUtil.getString(request, "opType", "Parent");

		SysDict Dict = new SysDict();
		if (id != 0) {
			Dict = dictService.getDictById(id);
		}
		mView.addObject("m", Dict);
		mView.addObject("opType", opType);
		mView.addObject("srgt", srgt);
		mView.addObject("slevel", slevel);
		return mView;
	}

	/**
	 * Func 添加、编辑页面
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ResultInfo save(SysDict Dict) {
		ResultInfo resultInfo = new ResultInfo();
		try {
			if (Dict.getId() != null) {
				// 修改,直接修改内容
				dictService.updateById(Dict);
			} else {
				// 新增，需要根据opType来判断是添加哪一级别的
				String opType = RequestUtil.getString(request, "opType", "");
				TreeOpration opration = TreeOpration.valueOf(opType);

				switch (opration) {
				case Parent:
					Integer rgt = dictService.getRgtMax();
					rgt = rgt == null ? 0 : rgt;
					Dict.setLft(rgt + 1);
					Dict.setRgt(rgt + 2);
					Dict.setLevel(0);
					dictService.insert(Dict);
					break;
				case Child:
					int srgt = RequestUtil.getInteger(request, "srgt", 0);
					int slevel = RequestUtil.getInteger(request, "slevel", 0);
					Dict.setLft(srgt);
					Dict.setRgt(srgt + 1);
					Dict.setLevel(slevel + 1);
					dictService.insertChild(Dict, srgt);
					break;
				default:
					break;
				}
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
	@RequestMapping(value = "/listAll", method = RequestMethod.POST)
	public List<SysDict> listAll() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<SysDict> list = dictService.listAll();
		map.put("rows", list);
		return list;
	}

	/**
	 * Func 根据ID删除记录
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public ResultInfo remove() {
		ResultInfo resultInfo = new ResultInfo(true, "删除成功");
		Integer id = RequestUtil.getInteger(request, "id");
		Integer lft = RequestUtil.getInteger(request, "lft");
		Integer rgt = RequestUtil.getInteger(request, "rgt");
		if (id != null) {
			try {
				dictService.removeAndChild(lft, rgt);
			} catch (Exception e) {
				resultInfo.setSuccess(false);
				resultInfo.setMsg(e.getMessage());
			}
		}
		return resultInfo;
	}

	/**
	 * Func 页面直接请求的移动位置方法【上移|下移】
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/move", method = RequestMethod.POST)
	public ResultInfo move() {
		ResultInfo resultInfo = new ResultInfo(true, "移动成功");
		Integer id = RequestUtil.getInteger(request, "id");
		String opType = RequestUtil.getString(request, "opType");
		TreeOpration opration = TreeOpration.valueOf(opType);
		// 获取实体
		SysDict srcDict = dictService.getDictById(id);
		SysDict destDict = new SysDict();
		switch (opration) {
		case MoveUp:
			destDict = dictService.getDictMoveUp(srcDict.getLft(), srcDict.getRgt(),srcDict.getLevel());

			// 如果有交换的信息
			if (destDict != null) {
				moveUp(srcDict, destDict);
			} else {
				resultInfo.setSuccess(false);
				resultInfo.setMsg("没有可用于交换的节点信息");
			}
			break;
		case MoveDown:
			destDict = dictService.getDictMoveDown(srcDict.getLft(), srcDict.getRgt(), srcDict.getLevel());
			// 如果有交换的信息
			if (destDict != null) {
				moveDown(destDict, srcDict);
			} else {
				resultInfo.setSuccess(false);
				resultInfo.setMsg("没有可用于交换的节点信息");
			}
			break;
		default:
			break;
		}

		return resultInfo;
	}

	/**
	 * Func 上移，与上一个交换位置
	 * 
	 * @param srcDict
	 * @param destDict
	 */
	public void moveUp(SysDict srcDict, SysDict destDict) {
		List<SysDict> srcList = dictService.listDescendant(srcDict.getLft(), srcDict.getRgt());
		List<SysDict> destList = dictService.listDescendant(destDict.getLft(), destDict.getRgt());
		Integer srcLft = srcDict.getLft();
		Integer destLft = destDict.getLft();
		Integer srcRgt = srcDict.getRgt();
		Integer destRgt = destDict.getRgt();

		Integer srcNewLft = destLft;
		Integer srcNewRgt = destLft + (srcList.size() * 2 + 1);
		for (int i = 0; i < srcList.size(); i++) {
			SysDict tempDict = srcList.get(i);
			// 原来的lft相差值
			Integer lftValue = tempDict.getLft() - srcLft;
			// 原来的rgt相差值
			Integer rgtValue = srcRgt - tempDict.getRgt();
			tempDict.setLft(srcNewLft + lftValue);
			tempDict.setRgt(srcNewRgt - rgtValue);
			dictService.updateById(tempDict);
		}
		srcDict.setLft(srcNewLft);
		srcDict.setRgt(srcNewRgt);
		dictService.updateById(srcDict);

		Integer destNewLft = destLft + (srcList.size() + 1) * 2;
		Integer destNewRgt = destRgt + (srcList.size() + 1) * 2;
		// 开始处理目标记录
		for (int i = 0; i < destList.size(); i++) {
			SysDict tempDict = destList.get(i);
			// 原来的lft相差值
			Integer lftValue = tempDict.getLft() - destLft;
			Integer rgtValue = destRgt - tempDict.getRgt();
			tempDict.setLft(destNewLft + lftValue);
			tempDict.setRgt(destNewRgt - rgtValue);
			dictService.updateById(tempDict);
		}
		destDict.setLft(destNewLft);
		destDict.setRgt(destNewRgt);
		dictService.updateById(destDict);

	}

	/**
	 * Func 下移，与下一个交换位置
	 * 
	 * @param srcDict
	 * @param destDict
	 */
	public void moveDown(SysDict srcDict, SysDict destDict) {
		List<SysDict> srcList = dictService.listDescendant(srcDict.getLft(), srcDict.getRgt());
		List<SysDict> destList = dictService.listDescendant(destDict.getLft(), destDict.getRgt());
		Integer srcLft = srcDict.getLft();
		Integer destLft = destDict.getLft();
		Integer srcRgt = srcDict.getRgt();
		Integer destRgt = destDict.getRgt();

		Integer srcNewLft = destLft;
		Integer srcNewRgt = destLft + (srcList.size() * 2 + 1);
		for (int i = 0; i < srcList.size(); i++) {
			SysDict tempDict = srcList.get(i);
			// 原来的lft相差值
			Integer lftValue = tempDict.getLft() - srcLft;
			// 原来的rgt相差值
			Integer rgtValue = srcRgt - tempDict.getRgt();
			tempDict.setLft(srcNewLft + lftValue);
			tempDict.setRgt(srcNewRgt - rgtValue);
			dictService.updateById(tempDict);
		}
		srcDict.setLft(srcNewLft);
		srcDict.setRgt(srcNewRgt);
		dictService.updateById(srcDict);

		Integer destNewLft = destLft + (srcList.size() + 1) * 2;
		Integer destNewRgt = destRgt + (srcList.size() + 1) * 2;
		// 开始处理目标记录
		for (int i = 0; i < destList.size(); i++) {
			SysDict tempDict = destList.get(i);
			// 原来的lft相差值
			Integer lftValue = tempDict.getLft() - destLft;
			Integer rgtValue = destRgt - tempDict.getRgt();
			tempDict.setLft(destNewLft + lftValue);
			tempDict.setRgt(destNewRgt - rgtValue);
			dictService.updateById(tempDict);
		}
		destDict.setLft(destNewLft);
		destDict.setRgt(destNewRgt);
		dictService.updateById(destDict);
	}
}
