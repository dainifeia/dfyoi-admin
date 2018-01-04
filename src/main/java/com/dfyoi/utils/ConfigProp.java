package com.dfyoi.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Properties;

/**
 * @Title 说明
 * @description 描述
 * @author huishen
 * @version 1.0
 * @createAt 2017年12月16日 下午4:38:18
 * @Copyright: Copyright (c) 2017 bjsszt. All Rights Reserved
 */
public class ConfigProp {
	private static Properties props = null;
	private static File configFile = null;
	private static long fileLastModified = 0L;

	private static String configFileName = "config.properties";

	private static void init() {
		URL url = ConfigProp.class.getClassLoader().getResource(configFileName);

		configFile = new File(url.getFile());
		fileLastModified = configFile.lastModified();
		props = new Properties();
		load();
	}

	private static void load() {
		try {
			props.load(new InputStreamReader(new FileInputStream(configFile), "UTF-8"));
			fileLastModified = configFile.lastModified();
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	public static String getConfig(String key) {
		if ((configFile == null) || (props == null))
			init();
		if (configFile.lastModified() > fileLastModified)
			load(); // 当检测到文件被修改时重新加载配置文件
		return props.getProperty(key);
	}

	public static void main(String[] args) {
		System.out.println(getConfig("useFtp"));
	}
}
