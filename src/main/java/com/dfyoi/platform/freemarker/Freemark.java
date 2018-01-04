package com.dfyoi.platform.freemarker;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import freemarker.template.Configuration;

/*** 
* 	 @author shenhui
* 	 @date 2016年8月30日 下午8:24:38
*/
public class Freemark {
	 /** 
     * freemark初始化 
     * @param templatePath 模板文件位置 
	 * @throws IOException 
     */  
    public Freemark(String templatePath) throws IOException {  
    	configuration = new Configuration(Configuration.VERSION_2_3_27);  
    	configuration.setDefaultEncoding("UTF-8");
    	configuration.setNumberFormat("#");
		configuration.setDateFormat("yyyy-MM-dd");
		configuration.setDateTimeFormat("yyyy-MM-dd HH:mm:ss");
		configuration.setTimeFormat("HH:mm:ss");
        configuration.setDirectoryForTemplateLoading(new File(templatePath));  
    }     
    /** 
     * freemark模板配置 
     */  
    private Configuration configuration;  
    
    public Configuration getConfiguration() {
		return configuration;
	}
	public void setConfiguration(Configuration configuration) {
		this.configuration = configuration;
	}
	/** 
     * freemark模板的名字 
     */  
    private String templateName;  
    public String getTemplateName() {
		return templateName;
	}
	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	/** 
     * 生成文件名 
     */  
    private String fileName;  
    /** 
     * 生成文件路径 
     */  
    private String filePath;
    
    /**
     * 数据
     */
    private Map<String, Object> freeData;
	public Map<String, Object> getFreeData() {
		return freeData;
	}
	public void setFreeData(Map<String, Object> freeData) {
		this.freeData = freeData;
	} 
}


