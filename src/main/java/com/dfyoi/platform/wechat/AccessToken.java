package com.dfyoi.platform.wechat;

/** 
 * 微信通用接口凭证 
 *  
 * @author SHENHUI
 */
public class AccessToken {
    // 获取到的凭证  
    private String accessToken;
    // 凭证有效时间，单位：s 
    private int expiresIn;

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    public int getExpiresIn() {
        return expiresIn;
    }

    public void setExpiresIn(int expiresIn) {
        this.expiresIn = expiresIn;
    }
}