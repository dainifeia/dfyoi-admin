package com.dfyoi.platform.wechat;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.sun.jmx.snmp.Timestamp;

/**
 * 
 * 创建人：SHENHUI 
 * 创建时间：2015-3-26 
 * 下午3:18:32 描述：
 * 
 */
public class PropertiesUtil {

    private Properties props;
    private String fileName;

    public Properties getProps() {
        return props;
    }

    public void setProps(Properties props) {
        this.props = props;
    }

    public PropertiesUtil(String fileName) {
        this.fileName = fileName;
        readProperties(fileName);
    }

    /**
     * 描述：读取properties文件 作者：herosky
     */
    public void readProperties(String fileName) {
        try {
            props = new Properties();
            InputStream stream = this.getClass().getClassLoader().getResourceAsStream(fileName);
            props.load(stream);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取某个属性
     */
    public String getProperty(String key) {
        return props.getProperty(key);
    }

    /**
     * 获取所有属性，返回一个map,不常用 可以试试props.putAll(t)
     */
    public Map<String, String> getAllProperty() {
        Map<String, String> map = new HashMap<String, String>();
        Enumeration<?> enu = props.propertyNames();
        while (enu.hasMoreElements()) {
            String key = (String) enu.nextElement();
            String value = props.getProperty(key);
            map.put(key, value);
        }
        return map;
    }

    /**
     * 在控制台上打印出所有属性，调试时用。
     */
    public void printProperties() {
        props.list(System.out);
    }

    /**
     * 写入properties信息
     */
    public void writeProperties(String key, String value) {
        try {
            String filePath = this.getClass().getClassLoader().getResource(fileName).toString();
            filePath = filePath.substring(6);
            filePath = filePath.replace("%20", " ");
            OutputStream fos = new FileOutputStream(filePath);
            props.setProperty(key, value);
            // 将此 Properties 表中的属性列表（键和元素对）写入输出流
            props.store(fos, "『comments』Update key：" + key);
            fos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Timestamp s = new Timestamp();
        System.out.println(s.getDateTime());
    }
}
