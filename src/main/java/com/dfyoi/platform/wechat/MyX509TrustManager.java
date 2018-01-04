package com.dfyoi.platform.wechat;

import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.net.ssl.X509TrustManager;

/** 
 * 对于https请求，我们需要一个证书信任管理器，这个管理器类需要自己定义，但需要实现X509TrustManager接口
 * 证书信任管理器（用于https请求） 
 * 这个证书管理器的作用就是让它信任我们指定的证书，上面的代码意味着信任所有证书，不管是否权威机构颁发。
 *  
 * @author SHENHUI 
 */
public class MyX509TrustManager implements X509TrustManager {

    public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
    }

    public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
    }

    public X509Certificate[] getAcceptedIssuers() {
        return null;
    }
}
