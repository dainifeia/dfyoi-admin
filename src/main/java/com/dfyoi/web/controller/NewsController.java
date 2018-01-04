package com.dfyoi.web.controller;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dfyoi.utils.comm.PagePara;
import com.dfyoi.utils.comm.ResultInfo;
import com.dfyoi.utils.ConfigProp;
import com.dfyoi.utils.FileUpload;
import com.dfyoi.utils.RequestUtil;
import com.dfyoi.web.pojo.WebNews;
import com.dfyoi.web.service.WebNewsService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
@RequestMapping(value = "/webNews")
public class NewsController {
	@Resource
	private HttpServletRequest request;
	@Resource
	private WebNewsService newsService;

	@RequestMapping(value = "/index")
	public ModelAndView index() {
		ModelAndView mView = new ModelAndView("/web/news/index");
		String sym = RequestUtil.getString(request, "sym");
		mView.addObject("sym", sym);
		return mView;
	}

	@RequestMapping(value = "/save")
	public ModelAndView save() {
		ModelAndView mView = new ModelAndView("/web/news/save");
		Integer id = RequestUtil.getInteger(request, "id");
		String sym = RequestUtil.getString(request, "sym");
		WebNews news = new WebNews();

		if (id != 0) {
			news = newsService.getWebNewsById(id);
		} else {
			news.setCreateDate(new Date());
			news.setPublishDate(new Date());
			news.setSym(sym);
		}
		mView.addObject("m", news);
		return mView;
	}

	@RequestMapping(value = "/saveBySym")
	public ModelAndView saveBySym() {
		ModelAndView mView = new ModelAndView("/web/news/saveBySym");
		String sym = RequestUtil.getString(request, "sym");

		WebNews news = newsService.getWebNewsBySym(sym);
		if (news == null) {
			news = new WebNews();
			news.setCreateDate(new Date());
			news.setPublishDate(new Date());
			news.setSym(sym);
		}
		mView.addObject("m", news);
		return mView;
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
		// 获取以及排序信息
		PagePara pagePara = new PagePara(request);
		PageHelper.startPage(pagePara.getPageNum(), pagePara.getPageSize());
		PageHelper.orderBy(pagePara.getOrderBy());
		// 紧跟着的第一个select方法会被分页
		RequestUtil.printParameters(request);
		HashMap<Object, Object> para = new HashMap<>();
		para.put("title", RequestUtil.getInteger(request, "title"));
		para.put("sym", RequestUtil.getString(request, "sym"));
		List<WebNews> list = newsService.listByPara(para);
		// 分页后，实际返回的结果list类型是Page<E>，如果想取出分页信息，需要强制转换为Page<E>，
		@SuppressWarnings("resource")
		Page<WebNews> listPage = (Page<WebNews>) list;
		map.put("records", listPage.getTotal());
		map.put("page", listPage.getPageNum());
		map.put("total", listPage.getPages());
		map.put("rows", list);
		return map;
	}

	/**
	 * Func 添加、编辑页面
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ResultInfo save(WebNews news) {
		ResultInfo resultInfo = new ResultInfo();
		try {

			if (news.getId() != null) {
				newsService.updateById(news);
			} else {
				newsService.insert(news);
			}

		} catch (Exception ex) {
			resultInfo.setSuccess(false);
			resultInfo.setMsg(ex.getMessage());
		}
		return resultInfo;
	}

	@ResponseBody
	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public ResultInfo uploadFile(@RequestParam("imgFile") CommonsMultipartFile file) {
		ResultInfo resultInfo = new ResultInfo();
		try {
			// 转为流
			InputStream inputStream = file.getInputStream();
			// 获取上传的全名
			String originalFilename = file.getOriginalFilename();
			// 截取后4位
			String suffix = originalFilename.substring(originalFilename.length() - 4, originalFilename.length());

			String timepoint = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
			String dateFolder = new SimpleDateFormat("yyyyMMdd").format(new Date());

			// HashMap<String, Object> result =
			// FtpUploadUtil.uploadFile("/file/image/"+dateFolder,
			// timepoint+suffix, inputStream);
			// 项目部署的路径
			String path = "";
			if (ConfigProp.getConfig("useFtp").equals("false")) {
				path = this.getClass().getClassLoader().getResource("/").getPath().replace("WEB-INF/classes/", "");
			}
			resultInfo = FileUpload.uploadFile(path, "file/image/" + dateFolder + "/", timepoint + suffix, inputStream);

		} catch (Exception e) {
			resultInfo.setSuccess(false);
			resultInfo.setMsg(e.getMessage());
		}
		return resultInfo;
	}

	@ResponseBody
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public ResultInfo remove() {
		ResultInfo resultInfo = new ResultInfo(true, "删除成功");
		Integer id = RequestUtil.getInteger(request, "id");
		if (id != null) {
			try {
				newsService.removeById(id);
			} catch (Exception e) {
				resultInfo.setSuccess(false);
				resultInfo.setMsg(e.getMessage());
			}
		}
		return resultInfo;
	}
}
