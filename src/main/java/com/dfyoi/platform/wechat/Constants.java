package com.dfyoi.platform.wechat;

/**
 * 常量
 * @author SHENHUI
 *
 */
public class Constants {
    /**
     * APPID
     */
    public static String APPID = "wx18d76ea2ba6c3cc6";
    /**
     * SECRET
     */
    public static String SECRET = "a43017dba43480b65d883b85881863a0";
    /**
     * 获取ACCESS_TOKEN接口
     */
    public static String GET_ACCESSTOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
    /**
     * ACCESS_TOKEN有效时间(单位：ms)
     */
    public static int ACCESS_TOKEN_TIME = 700000;
    /**
     * conf.properties文件路径，此文件中需两个变量，因为TOKEN的有效时间问题，所以固定时间去重新获取TOKEN
     * OVERDUE_ACCESS_TOKEN_TIME TOKEN超时时间
     * ACCESS_TOKEN 获取到的TOKEN
     */
    public static String CONF_PROPERTIES_PATH = "config.properties";
    /**
     * 微信接入token ，用于验证微信接口
     */
    public static String TOKEN = "hd961890";
    /**
     * 微信获取用户授权后重定向时所携带的参数，由此来区分是首次打开此页面还是重定向到此页面
     */
    public static String STATE = "hd961890";

}
