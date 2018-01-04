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

import com.dfyoi.admin.pojo.SysFile;
import com.dfyoi.admin.pojo.SysUser;
import com.dfyoi.admin.service.SysFileService;
import com.dfyoi.utils.comm.PagePara;
import com.dfyoi.utils.comm.ResultInfo;
import com.dfyoi.utils.comm.ZTreeNode;
import com.dfyoi.utils.RequestUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
@RequestMapping(value = "/sysFile")
public class SysFileController {
	@Resource
	private HttpServletRequest request;
	@Resource
	SysFileService fileService;

	@RequestMapping(value = "/index")
	public ModelAndView index() {
		ModelAndView mView = new ModelAndView("/sys/file/index");
		return mView;
	}

	@ResponseBody
	@RequestMapping(value = "/getList", method = RequestMethod.POST)
	public List<ZTreeNode> getList() {
		SysUser user = (SysUser) request.getSession().getAttribute("user");
		List<ZTreeNode> listNodeTemp = new ArrayList<ZTreeNode>();
		ZTreeNode tempNode = new ZTreeNode();
		tempNode.setName(user.getPersonName() + "的工作空间");
		tempNode.setSym("0|0|0");
		tempNode.setNocheck(false);
		List<ZTreeNode> listNode = new ArrayList<ZTreeNode>();

		HashMap<Object, Object> para = new HashMap<>();
		para.put("personId", user.getPersonId());
		para.put("flag", "1");// 1是文件夹 0是文件
		List<SysFile> listFile = fileService.listByPara(para);
		List<SysFile> listTop = listFile.stream().filter(x -> x.getParentId()==0).collect(Collectors.toList());
		for (SysFile sysFile : listTop) {
			ZTreeNode node = new ZTreeNode();
			node.setName(sysFile.getTitle());
			node.setSym(String.valueOf(sysFile.getId()));
			node.setNocheck(false);
			// 判断是否有子节点
			node = getChildList(sysFile, node, listFile);

			listNode.add(node);
		}
		tempNode.setChildren(listNode);
		listNodeTemp.add(tempNode);
		return listNodeTemp;
	}

	public ZTreeNode getChildList(SysFile file, ZTreeNode zTreeNode, List<SysFile> listFile) {
		List<SysFile> list = listFile.stream().filter(x -> x.getParentId()==file.getId())
				.collect(Collectors.toList());
		if (list.size() > 0) {
			List<ZTreeNode> listNode = new ArrayList<ZTreeNode>();
			for (SysFile sysFile : list) {
				ZTreeNode node = new ZTreeNode();
				node.setName(sysFile.getTitle());
				node.setSym(String.valueOf(sysFile.getId()));
				node.setNocheck(false);
				// 判断是否有子节点
				node = getChildList(sysFile, node, listFile);

				listNode.add(node);
			}
			zTreeNode.setChildren(listNode);
		}
		return zTreeNode;
	}

	/**
	 * Func 获取所有的列表数据
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/listAllPara", method = RequestMethod.POST)
	public Map<String, Object> listAllPara() {
		SysUser user = (SysUser) request.getSession().getAttribute("user");
		Map<String, Object> map = new HashMap<String, Object>();
		// 获取以及排序信息
		PagePara pagePara = new PagePara(request);
		PageHelper.startPage(pagePara.getPageNum(), pagePara.getPageSize());
		PageHelper.orderBy(pagePara.getOrderBy());
		// 紧跟着的第一个select方法会被分页
		RequestUtil.printParameters(request);
		HashMap<Object, Object> para = new HashMap<>();
		para.put("personId", user.getPersonId());
		para.put("title", RequestUtil.getString(request, "title"));
		para.put("flag", RequestUtil.getString(request, "flag"));
		List<SysFile> list = fileService.listByPara(para);
		// 分页后，实际返回的结果list类型是Page<E>，如果想取出分页信息，需要强制转换为Page<E>，
		@SuppressWarnings("resource")
		Page<SysFile> listPage = (Page<SysFile>) list;
		map.put("records", listPage.getTotal());
		map.put("page", listPage.getPageNum());
		map.put("total", listPage.getPages());
		map.put("rows", list);
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ResultInfo save() {
		//SysUser user = (SysUser) request.getSession().getAttribute("user");
		ResultInfo resultInfo = new ResultInfo();
		/*Integer id = RequestUtil.getInteger(request, "id");
		Integer pid = RequestUtil.getInteger(request, "pid");
		String title = RequestUtil.getString(request, "title");
		String flag = RequestUtil.getString(request, "flag");
		
		SysFile file = new SysFile();
		if(id!=0)
		{
			file=fileService.getFileById(id);
			file.setTitle(title);
		}
		*/
		return resultInfo;
	}
}
