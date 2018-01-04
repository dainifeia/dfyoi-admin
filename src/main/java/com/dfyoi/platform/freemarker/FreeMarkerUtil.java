package com.dfyoi.platform.freemarker;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/***
 * @author shenhui
 * @date 2016年8月30日 下午8:10:10
 */
public class FreeMarkerUtil {
	/**
	 * 创建HTML文件
	 * 
	 * @param templatePath
	 *            模版路径-文件夹
	 * @param templateName
	 *            模版名称-模版路径中的具体模版文件
	 * @param htmlPath
	 *            需要生成的HTML文件路径
	 * @param map
	 *            数据存储
	 * @return
	 * @throws IOException
	 */
	public boolean CreateHtml(String templatePath, String templateName, String htmlPath, Map<String, Object> mapData)
			throws IOException {
		// 创建一个freemarker.template.Configuration实例，它是存储 FreeMarker 应用级设置的核心部分
		// 指定版本号
		Configuration cfg = new Configuration(Configuration.VERSION_2_3_27);
		// 设置模板目录
		cfg.setDirectoryForTemplateLoading(new File(templatePath));
		// 设置默认编码格式
		cfg.setDefaultEncoding("UTF-8");
		cfg.setNumberFormat("#");
		cfg.setDateFormat("yyyy-MM-dd");
		cfg.setDateTimeFormat("yyyy-MM-dd HH:mm:ss");
		cfg.setTimeFormat("HH:mm:ss");
		
		File file = new File(htmlPath);
		// 从设置的目录中获得模板
		Template template = cfg.getTemplate(templateName);
		// 合并模板和数据模型
		try {
			// 将数据与模板渲染的结果写入文件中
			Writer writer = new OutputStreamWriter(new FileOutputStream(file), "UTF-8");
			template.process(mapData, writer);
			writer.flush();
			return true;
		} catch (TemplateException e) {
			return false;
		}
	}

	/**
	 * 创建HTML文件
	 * 
	 * @param templatePath
	 *            模版路径-文件夹
	 * @param templateName
	 *            模版名称-模版路径中的具体模版文件
	 * @param htmlPath
	 *            需要生成的HTML文件路径
	 * @param map
	 *            数据存储
	 * @return
	 * @throws IOException
	 */
	public boolean CreateHtml(Freemark fm) throws IOException {
		// 从设置的目录中获得模板
		Template template = fm.getConfiguration().getTemplate(fm.getTemplateName());
		// 合并模板和数据模型
		try {
			File file = new File(fm.getFilePath() + "/" + fm.getFileName());
			// 将数据与模板渲染的结果写入文件中
			Writer writer = new OutputStreamWriter(new FileOutputStream(file), "UTF-8");
			template.process(fm.getFreeData(), writer);
			writer.flush();
			return true;
		} catch (TemplateException e) {
			return false;
		}
	}
}
