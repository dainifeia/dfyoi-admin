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

import com.dfyoi.admin.pojo.SysPower;
import com.dfyoi.admin.service.SysPowerService;
import com.dfyoi.utils.comm.ResultInfo;
import com.dfyoi.utils.comm.TreeOpration;
import com.dfyoi.utils.comm.ZTreeNode;
import com.dfyoi.utils.RequestUtil;

@Controller
@RequestMapping(value = "/sysPower")
public class SysPowerController {
	@Resource
	private HttpServletRequest request;
	@Resource
	private SysPowerService powerService;

	/**
	 * Page 列表页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/index")
	public ModelAndView index() {
		ModelAndView mView = new ModelAndView("/sys/power/index");
		return mView;
	}
	@RequestMapping(value = "/sel")
	public ModelAndView selPower() {
		ModelAndView mView = new ModelAndView("/sys/power/sel");
		return mView;
	}

	/**
	 * Page 添加、编辑页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() {
		ModelAndView mView = new ModelAndView("/sys/power/save");
		Integer id = RequestUtil.getInteger(request, "id", 0);
		Integer srgt = RequestUtil.getInteger(request, "srgt", 0);
		Integer slevel = RequestUtil.getInteger(request, "slevel", 0);
		String opType = RequestUtil.getString(request, "opType", "Parent");

		SysPower power = new SysPower();
		if (id != 0) {
			power = powerService.getPowerById(id);
		}
		mView.addObject("m", power);
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
	public ResultInfo save(SysPower power) {
		ResultInfo resultInfo = new ResultInfo();
		try {
			if (power.getId() != null) {
				// 修改,直接修改内容
				SysPower tempPower = powerService.getPowerById(power.getId());
				if (tempPower.getSym().equals(power.getSym())) {
					powerService.updateById(power);
				} else {
					tempPower = powerService.getPowerBySym(power.getSym());
					if (tempPower == null) {
						powerService.updateById(power);
					} else {
						resultInfo.setSuccess(false);
						resultInfo.setMsg("已经存在相同代码的功能");
					}
				}
			} else {
				// 新增，需要根据opType来判断是添加哪一级别的
				String opType = RequestUtil.getString(request, "opType", "");
				TreeOpration opration = TreeOpration.valueOf(opType);
				// 根据代码获取信息
				SysPower tempPower = powerService.getPowerBySym(power.getSym());
				if (tempPower == null) {
					switch (opration) {
					case Parent:
						Integer rgt = powerService.getMaxRgt();
						rgt = rgt == null ? 0 : rgt;
						power.setLft(rgt + 1);
						power.setRgt(rgt + 2);
						power.setLevel(0);
						powerService.insert(power);
						break;
					case Child:
						int srgt = RequestUtil.getInteger(request, "srgt", 0);
						int slevel = RequestUtil.getInteger(request, "slevel", 0);
						power.setLft(srgt);
						power.setRgt(srgt + 1);
						power.setLevel(slevel + 1);
						powerService.insertChild(power, srgt);
						break;
					default:
						break;
					}
				} else {
					resultInfo.setSuccess(false);
					resultInfo.setMsg("已经存在相同代码的功能");
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
	public List<SysPower> listAll() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<SysPower> list = powerService.listAll();
		map.put("rows", list);
		return list;
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
		Integer lft = RequestUtil.getInteger(request, "lft");
		Integer rgt = RequestUtil.getInteger(request, "rgt");
		if (id != null) {
			try {
				powerService.removeAndChild(lft, rgt);
			} catch (Exception e) {
				resultInfo.setSuccess(false);
				resultInfo.setMsg(e.getMessage());
			}
		}
		return resultInfo;
	}

	/**
	 * Func 移动位置方法，前台直接请求此方法【上移、下移】
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
		SysPower srcPower = powerService.getPowerById(id);
		SysPower destPower = new SysPower();
		switch (opration) {
		case MoveUp:
			destPower = powerService.getPowerMoveUp(srcPower.getLft(),srcPower.getRgt(), srcPower.getLevel());

			// 如果有交换的信息
			if (destPower != null) {
				moveUp(srcPower, destPower);
			} else {
				resultInfo.setSuccess(false);
				resultInfo.setMsg("没有可用于交换的节点信息");
			}
			break;
		case MoveDown:
			destPower = powerService.getPowerMoveDown(srcPower.getLft(), srcPower.getRgt(),srcPower.getLevel());
			// 如果有交换的信息
			if (destPower != null) {
				moveDown(destPower, srcPower);
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
	 * Func 上移
	 * @param srcPower
	 * @param destPower
	 */
	public void moveUp(SysPower srcPower, SysPower destPower) {
		List<SysPower> srcList = powerService.listDescendant(srcPower.getLft(), srcPower.getRgt());
		List<SysPower> destList = powerService.listDescendant(destPower.getLft(), destPower.getRgt());
		Integer srcLft = srcPower.getLft();
		Integer destLft = destPower.getLft();
		Integer srcRgt = srcPower.getRgt();
		Integer destRgt = destPower.getRgt();

		Integer srcNewLft = destLft;
		Integer srcNewRgt = destLft + (srcList.size() * 2 + 1);
		for (int i = 0; i < srcList.size(); i++) {
			SysPower tempPower = srcList.get(i);
			// 原来的lft相差值
			Integer lftValue = tempPower.getLft() - srcLft;
			// 原来的rgt相差值
			Integer rgtValue = srcRgt - tempPower.getRgt();
			tempPower.setLft(srcNewLft + lftValue);
			tempPower.setRgt(srcNewRgt - rgtValue);
			powerService.updateById(tempPower);
		}
		srcPower.setLft(srcNewLft);
		srcPower.setRgt(srcNewRgt);
		powerService.updateById(srcPower);

		Integer destNewLft = destLft + (srcList.size() + 1) * 2;
		Integer destNewRgt = destRgt + (srcList.size() + 1) * 2;
		// 开始处理目标记录
		for (int i = 0; i < destList.size(); i++) {
			SysPower tempPower = destList.get(i);
			// 原来的lft相差值
			Integer lftValue = tempPower.getLft() - destLft;
			Integer rgtValue = destRgt - tempPower.getRgt();
			tempPower.setLft(destNewLft + lftValue);
			tempPower.setRgt(destNewRgt - rgtValue);
			powerService.updateById(tempPower);
		}
		destPower.setLft(destNewLft);
		destPower.setRgt(destNewRgt);
		powerService.updateById(destPower);

	}

	/**
	 * Func 下移
	 * @param srcPower
	 * @param destPower
	 */
	public void moveDown(SysPower srcPower, SysPower destPower) {
		List<SysPower> srcList = powerService.listDescendant(srcPower.getLft(), srcPower.getRgt());
		List<SysPower> destList = powerService.listDescendant(destPower.getLft(), destPower.getRgt());
		Integer srcLft = srcPower.getLft();
		Integer destLft = destPower.getLft();
		Integer srcRgt = srcPower.getRgt();
		Integer destRgt = destPower.getRgt();

		Integer srcNewLft = destLft;
		Integer srcNewRgt = destLft + (srcList.size() * 2 + 1);
		for (int i = 0; i < srcList.size(); i++) {
			SysPower tempPower = srcList.get(i);
			// 原来的lft相差值
			Integer lftValue = tempPower.getLft() - srcLft;
			// 原来的rgt相差值
			Integer rgtValue = srcRgt - tempPower.getRgt();
			tempPower.setLft(srcNewLft + lftValue);
			tempPower.setRgt(srcNewRgt - rgtValue);
			powerService.updateById(tempPower);
		}
		srcPower.setLft(srcNewLft);
		srcPower.setRgt(srcNewRgt);
		powerService.updateById(srcPower);

		Integer destNewLft = destLft + (srcList.size() + 1) * 2;
		Integer destNewRgt = destRgt + (srcList.size() + 1) * 2;
		// 开始处理目标记录
		for (int i = 0; i < destList.size(); i++) {
			SysPower tempPower = destList.get(i);
			// 原来的lft相差值
			Integer lftValue = tempPower.getLft() - destLft;
			Integer rgtValue = destRgt - tempPower.getRgt();
			tempPower.setLft(destNewLft + lftValue);
			tempPower.setRgt(destNewRgt - rgtValue);
			powerService.updateById(tempPower);
		}
		destPower.setLft(destNewLft);
		destPower.setRgt(destNewRgt);
		powerService.updateById(destPower);
	}

	/**
	 * Func 获取Ztree格式的数据
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getList",method = RequestMethod.POST)
	public List<ZTreeNode> getList() {
		List<ZTreeNode> listNode = new ArrayList<ZTreeNode>();
		List<SysPower> listPower = powerService.listAll();
		List<SysPower> listTop = listPower.stream().filter(x -> x.getLevel() == 0).collect(Collectors.toList());
		for (SysPower sysPower : listTop) {
			ZTreeNode node = new ZTreeNode();
			node.setName(sysPower.getName());
			node.setSym(sysPower.getSym());
			node.setNocheck(false);
			// 判断是否有子节点
			node = getChildList(sysPower, node, listPower);

			listNode.add(node);
		}
		return listNode;
	}
	
	/**
	 * Func 获取Ztree格式的数据的配合方法，递归调用此方法
	 * @param power
	 * @param zTreeNode
	 * @param listPower
	 * @return
	 */
	public ZTreeNode getChildList(SysPower power, ZTreeNode zTreeNode, List<SysPower> listPower) {
		Integer level = power.getLevel() + 1;
		Integer lft = power.getLft();
		Integer rgt = power.getRgt();

		List<SysPower> list = listPower.stream()
				.filter(x -> x.getLevel() == level & x.getLft() > lft & x.getLft() < rgt).collect(Collectors.toList());
		if (list.size() > 0) {
			List<ZTreeNode> listNode = new ArrayList<ZTreeNode>();
			for (SysPower sysPower : list) {
				ZTreeNode node = new ZTreeNode();
				node.setName(sysPower.getName());
				node.setSym(sysPower.getSym());
				node.setNocheck(false);
				
				// 判断是否有子节点
				node = getChildList(sysPower, node, listPower);
				listNode.add(node);
			}
			zTreeNode.setChildren(listNode);
		}
		return zTreeNode;
	}
}
