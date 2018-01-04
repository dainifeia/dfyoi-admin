package com.dfyoi.utils;

import java.math.BigDecimal;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class RequestUtil {
	private static Log logger = LogFactory.getLog(RequestUtil.class.getName()); 
	/**
	 * 获取当前访问的url
	 * 
	 * @param request
	 * @return
	 */
	public static String getQueryUrl(HttpServletRequest request) {
		return request.getContextPath() + request.getServletPath() + "?" + request.getQueryString();
	}

	/**
	 * 从request获取整数类型的参数
	 * 
	 * @param request
	 * @param paramStr
	 * @param defaultValue
	 * @return 找不到返回null
	 */
	public static Integer getInteger(HttpServletRequest request, String paramStr) {
		String value = request.getParameter(paramStr);
		if (value == null || "".equals(value)) {
			return null;
		} else {
			return Integer.valueOf(value);
		}
	}

	/**
	 * 从request获取整数类型的参数
	 * 
	 * @param request
	 * @param paramStr
	 * @param defaultValue
	 *            默认值
	 * @return
	 */
	public static Integer getInteger(HttpServletRequest request, String paramStr, Integer defaultValue) {
		Integer result = getInteger(request, paramStr);
		if (result == null) {
			return defaultValue;
		} else {
			return result;
		}
	}

	/**
	 * 从request获取整数类型的参数
	 * 
	 * @param request
	 * @param paramStr
	 * @param defaultValue
	 * @return 找不到返回null
	 */
	public static BigDecimal getBigDecimal(HttpServletRequest request, String paramStr) {
		String value = request.getParameter(paramStr);
		if (value == null || "".equals(value)) {
			return null;
		} else {
			return new BigDecimal(value);
		}
	}

	/**
	 * 从request获取整数类型的参数
	 * 
	 * @param request
	 * @param paramStr
	 * @param defaultValue
	 *            默认值
	 * @return
	 */
	public static BigDecimal getBigDecimal(HttpServletRequest request, String paramStr, BigDecimal defaultValue) {
		BigDecimal result = getBigDecimal(request, paramStr);
		if (result == null) {
			return defaultValue;
		} else {
			return result;
		}
	}

	/**
	 * 从request获取字符串类型的参数
	 * 
	 * @param request
	 * @param paramStr
	 * @param defaultValue
	 * @return 找不到返回null
	 */
	public static String getString(HttpServletRequest request, String paramStr) {
		String value = request.getParameter(paramStr);
		return value;
	}

	/**
	 * 从request获取字符串类型的参数
	 * 
	 * @param request
	 * @param paramStr
	 * @param defaultValue
	 *            默认值
	 * @return
	 */
	public static String getString(HttpServletRequest request, String paramStr, String defaultValue) {
		String result = getString(request, paramStr);
		if (result == null) {
			return defaultValue;
		} else {
			return result;
		}
	}
	//打印出来所有参数
    public static void printParameters(HttpServletRequest request){  
        Enumeration<String> e = request.getParameterNames();  
        logger.info("---------------------------request所有请求参数打印开始----------------------------------");  
        while (e.hasMoreElements()) {  
            String string = (String) e.nextElement();  
            if(logger != null){  
                logger.info(string+"="+request.getParameter(string));  
            }  
        }  
        logger.info("---------------------------request所有请求参数打印结束----------------------------------");  
    }  
}
