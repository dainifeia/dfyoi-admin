package com.dfyoi.platform.wechat;

/**   
  *Copyright ©shenhui 2017. All rights reserved.
  *@author  申辉
  *E-mail: shenhui_email@163.com
  *@date 创建时间：2017年8月11日 下午3:36:23
  *@version 1.0
  *@see reference
*/
/**
 * 
 * @ClassName: OAuthInfo 
 * 获取OPENID的信息
 */
public class OAuthInfo {
    /**
     * 网页授权接口调用凭证,注意：此access_token与基础支持的access_token不同
     */
    private String accessToken;
    /**
     * access_token接口调用凭证超时时间，单位（秒）
     */
    private int expiresIn;
    /**
     * 用户刷新access_token
     */
    private String refreshToken;
    /**
     * 用户唯一标识，请注意，在未关注公众号时，用户访问公众号的网页，也会产生一个用户和公众号唯一的OpenID
     */
    private String openId;
    /**
     * 用户授权的作用域，使用逗号（,）分隔
     */
    private String scope;

    public String getAccessToken() {
        return accessToken;
    }

    public int getExpiresIn() {
        return expiresIn;
    }

    public String getRefreshToken() {
        return refreshToken;
    }

    public String getOpenId() {
        return openId;
    }

    public String getScope() {
        return scope;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    public void setExpiresIn(int expiresIn) {
        this.expiresIn = expiresIn;
    }

    public void setRefreshToken(String refreshToken) {
        this.refreshToken = refreshToken;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public void setScope(String scope) {
        this.scope = scope;
    }
}
