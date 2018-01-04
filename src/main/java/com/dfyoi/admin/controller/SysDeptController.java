package com.dfyoi.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dfyoi.admin.pojo.SysDept;
import com.dfyoi.admin.service.SysDeptService;
import com.dfyoi.utils.comm.ResultInfo;
import com.dfyoi.utils.comm.TreeOpration;
import com.dfyoi.utils.comm.ZTreeNode;
import com.dfyoi.utils.RequestUtil;

/**
 * @Title 说明
 * @description 描述
 * @author huishen
 * @version 1.0
 * @createAt 2017年9月22日 下午5:05:37
 * @Copyright: Copyright (c) 2017 bjsszt. All Rights Reserved
 */
@Controller
@RequestMapping(value = "/sysDept")
public class SysDeptController {
	@Resource
	private HttpServletRequest request;
	@Resource
	SysDeptService deptService;

	/**
	 * Page 列表页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/index")
	public ModelAndView index() {
		ModelAndView mView = new ModelAndView("/sys/dept/index");
		return mView;
	}

	@RequestMapping(value = "/sel")
	public ModelAndView selPower() {
		ModelAndView mView = new ModelAndView("/sys/dept/sel");
		return mView;
	}

	/**
	 * Page 添加、编辑页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() {
		ModelAndView mView = new ModelAndView("/sys/dept/save");
		Integer id = RequestUtil.getInteger(request, "id", 0);
		Integer srgt = RequestUtil.getInteger(request, "srgt", 0);
		Integer slevel = RequestUtil.getInteger(request, "slevel", 0);
		String opType = RequestUtil.getString(request, "opType", "Parent");

		SysDept dept = new SysDept();
		if (id != 0) {
			dept = deptService.getDeptById(id);
		}
		mView.addObject("m", dept);
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
	public ResultInfo save(SysDept dept) {
		ResultInfo resultInfo = new ResultInfo();
		try {
			if (dept.getId() != null) {
				// 修改,直接修改内容
				deptService.updateById(dept);
			} else {
				// 新增，需要根据opType来判断是添加哪一级别的
				String opType = RequestUtil.getString(request, "opType", "");
				TreeOpration opration = TreeOpration.valueOf(opType);

				switch (opration) {
				case Parent:
					Integer rgt = deptService.getRgtMax();
					rgt = rgt == null ? 0 : rgt;
					dept.setLft(rgt + 1);
					dept.setRgt(rgt + 2);
					dept.setLevel(0);
					deptService.insert(dept);
					break;
				case Child:
					int srgt = RequestUtil.getInteger(request, "srgt", 0);
					int slevel = RequestUtil.getInteger(request, "slevel", 0);
					dept.setLft(srgt);
					dept.setRgt(srgt + 1);
					dept.setLevel(slevel + 1);
					deptService.insertChild(dept, srgt);
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
	public List<SysDept> listAll() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<SysDept> list = deptService.listAll();
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
				deptService.removeAndChild(lft, rgt);
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
		SysDept srcDept = deptService.getDeptById(id);
		SysDept destDept = new SysDept();
		switch (opration) {
		case MoveUp:
			destDept = deptService.getDeptMoveUp(srcDept.getLft(), srcDept.getRgt(), srcDept.getLevel());

			// 如果有交换的信息
			if (destDept != null) {
				moveUp(srcDept, destDept);
			} else {
				resultInfo.setSuccess(false);
				resultInfo.setMsg("没有可用于交换的节点信息");
			}
			break;
		case MoveDown:
			destDept = deptService.getDeptMoveDown(srcDept.getLft(), srcDept.getRgt(), srcDept.getLevel());
			// 如果有交换的信息
			if (destDept != null) {
				moveDown(destDept, srcDept);
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
	 * @param srcDept
	 * @param destDept
	 */
	public void moveUp(SysDept srcDept, SysDept destDept) {
		List<SysDept> srcList = deptService.listDescendant(srcDept.getLft(), srcDept.getRgt());
		List<SysDept> destList = deptService.listDescendant(destDept.getLft(), destDept.getRgt());
		Integer srcLft = srcDept.getLft();
		Integer destLft = destDept.getLft();
		Integer srcRgt = srcDept.getRgt();
		Integer destRgt = destDept.getRgt();

		Integer srcNewLft = destLft;
		Integer srcNewRgt = destLft + (srcList.size() * 2 + 1);
		for (int i = 0; i < srcList.size(); i++) {
			SysDept tempDept = srcList.get(i);
			// 原来的lft相差值
			Integer lftValue = tempDept.getLft() - srcLft;
			// 原来的rgt相差值
			Integer rgtValue = srcRgt - tempDept.getRgt();
			tempDept.setLft(srcNewLft + lftValue);
			tempDept.setRgt(srcNewRgt - rgtValue);
			deptService.updateById(tempDept);
		}
		srcDept.setLft(srcNewLft);
		srcDept.setRgt(srcNewRgt);
		deptService.updateById(srcDept);

		Integer destNewLft = destLft + (srcList.size() + 1) * 2;
		Integer destNewRgt = destRgt + (srcList.size() + 1) * 2;
		// 开始处理目标记录
		for (int i = 0; i < destList.size(); i++) {
			SysDept tempDept = destList.get(i);
			// 原来的lft相差值
			Integer lftValue = tempDept.getLft() - destLft;
			Integer rgtValue = destRgt - tempDept.getRgt();
			tempDept.setLft(destNewLft + lftValue);
			tempDept.setRgt(destNewRgt - rgtValue);
			deptService.updateById(tempDept);
		}
		destDept.setLft(destNewLft);
		destDept.setRgt(destNewRgt);
		deptService.updateById(destDept);

	}

	/**
	 * Func 下移，与下一个交换位置
	 * 
	 * @param srcDept
	 * @param destDept
	 */
	public void moveDown(SysDept srcDept, SysDept destDept) {
		List<SysDept> srcList = deptService.listDescendant(srcDept.getLft(), srcDept.getRgt());
		List<SysDept> destList = deptService.listDescendant(destDept.getLft(), destDept.getRgt());
		Integer srcLft = srcDept.getLft();
		Integer destLft = destDept.getLft();
		Integer srcRgt = srcDept.getRgt();
		Integer destRgt = destDept.getRgt();

		Integer srcNewLft = destLft;
		Integer srcNewRgt = destLft + (srcList.size() * 2 + 1);
		for (int i = 0; i < srcList.size(); i++) {
			SysDept tempDept = srcList.get(i);
			// 原来的lft相差值
			Integer lftValue = tempDept.getLft() - srcLft;
			// 原来的rgt相差值
			Integer rgtValue = srcRgt - tempDept.getRgt();
			tempDept.setLft(srcNewLft + lftValue);
			tempDept.setRgt(srcNewRgt - rgtValue);
			deptService.updateById(tempDept);
		}
		srcDept.setLft(srcNewLft);
		srcDept.setRgt(srcNewRgt);
		deptService.updateById(srcDept);

		Integer destNewLft = destLft + (srcList.size() + 1) * 2;
		Integer destNewRgt = destRgt + (srcList.size() + 1) * 2;
		// 开始处理目标记录
		for (int i = 0; i < destList.size(); i++) {
			SysDept tempDept = destList.get(i);
			// 原来的lft相差值
			Integer lftValue = tempDept.getLft() - destLft;
			Integer rgtValue = destRgt - tempDept.getRgt();
			tempDept.setLft(destNewLft + lftValue);
			tempDept.setRgt(destNewRgt - rgtValue);
			deptService.updateById(tempDept);
		}
		destDept.setLft(destNewLft);
		destDept.setRgt(destNewRgt);
		deptService.updateById(destDept);
	}

	/**
	 * Func Ztree树形列表请求方法
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getList", method = RequestMethod.POST)
	public List<ZTreeNode> getList() {
		List<ZTreeNode> listNode = new ArrayList<ZTreeNode>();
		List<SysDept> listDept = deptService.listAll();
		List<SysDept> listTop = listDept.stream().filter(x -> x.getLevel() == 0).collect(Collectors.toList());
		for (SysDept sysDept : listTop) {
			ZTreeNode node = new ZTreeNode();
			node.setName(sysDept.getName());
			node.setSym(String.valueOf(sysDept.getId()));
			node.setNocheck(false);
			// 判断是否有子节点
			node = getChildList(sysDept, node, listDept);

			listNode.add(node);
		}
		return listNode;
	}

	/**
	 * Func Ztree树形列表请求的配合方法，获取子节点并递归
	 * 
	 * @param dept
	 * @param zTreeNode
	 * @param listDept
	 * @return
	 */
	public ZTreeNode getChildList(SysDept dept, ZTreeNode zTreeNode, List<SysDept> listDept) {
		Integer level = dept.getLevel() + 1;
		Integer lft = dept.getLft();
		Integer rgt = dept.getRgt();

		List<SysDept> list = listDept.stream().filter(x -> x.getLevel() == level & x.getLft() > lft & x.getLft() < rgt)
				.collect(Collectors.toList());
		if (list.size() > 0) {
			List<ZTreeNode> listNode = new ArrayList<ZTreeNode>();
			for (SysDept sysDept : list) {
				ZTreeNode node = new ZTreeNode();
				node.setName(sysDept.getName());
				node.setSym(String.valueOf(sysDept.getId()));
				node.setNocheck(false);
				// 判断是否有子节点
				node = getChildList(sysDept, node, listDept);

				listNode.add(node);
			}
			zTreeNode.setChildren(listNode);
		}
		return zTreeNode;
	}
}
