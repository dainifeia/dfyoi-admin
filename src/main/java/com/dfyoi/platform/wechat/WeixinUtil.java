package com.dfyoi.platform.wechat;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.ConnectException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Formatter;
import java.util.UUID;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;

import net.sf.json.JSONObject;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.HttpEntity;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSONException;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.sun.jmx.snmp.Timestamp;

public class WeixinUtil {
    /**
     * 从微信获取基础支持TOKEN的方法
     * @param appid
     * @param appsecret
     * @return
     * @throws Exception
     * @throws IOException
     */
    public static AccessToken getAccessToken(String appid, String appsecret) throws Exception, IOException {
        AccessToken accessToken = null;
        JsonParser jsonparer = new JsonParser();// 初始化解析json格式的对象
        System.out.print("--------------得到获取TOKEN的地址");
        String requestUrl = Constants.GET_ACCESSTOKEN_URL.replace("APPID", appid).replace("APPSECRET", appsecret);
        System.out.print("--------------获取TOKEN的URL地址为：" + requestUrl);
        HttpClient client = HttpClientBuilder.create().build();
        HttpGet get = new HttpGet(requestUrl);
        HttpResponse res = client.execute(get);
        String responseContent = null; // 响应内容
        HttpEntity entity = res.getEntity();
        responseContent = EntityUtils.toString(entity, "UTF-8");
        System.out.print("--------------请求TOKEN成功，响应内容为：" + responseContent);
        JsonObject json = jsonparer.parse(responseContent).getAsJsonObject();
        // 如果请求成功
        if (null != json) {
            try {
                System.out.print("--------------获取TOKEN成功：" + responseContent);
                accessToken = new AccessToken();
                accessToken.setAccessToken(json.get("access_token").getAsString());
                System.out.print("--------------获取TOKEN成功，TOKEN值为：" + accessToken.getAccessToken());
                accessToken.setExpiresIn(json.get("expires_in").getAsInt());
                System.out.print("--------------获取TOKEN成功，expires_in值为：" + accessToken.getAccessToken());
            } catch (Exception e) {
                accessToken = null;
                // 获取token失败
                System.out.println("获取token失败 errcode:{} errmsg:{}");
            }
        }
        return accessToken;
    }

    public static String httpRequest(String requestUrl, String requestMethod, String outputStr) {
        StringBuffer buffer = new StringBuffer();
        try {
            // 创建SSLContext对象，并使用我们指定的信任管理器初始化
            TrustManager[] tm = { new MyX509TrustManager() };
            SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
            sslContext.init(null, tm, new java.security.SecureRandom());
            // 从上述SSLContext对象中得到SSLSocketFactory对象
            SSLSocketFactory ssf = sslContext.getSocketFactory();

            URL url = new URL(requestUrl);
            HttpsURLConnection httpUrlConn = (HttpsURLConnection) url.openConnection();
            httpUrlConn.setSSLSocketFactory(ssf);

            httpUrlConn.setDoOutput(true);
            httpUrlConn.setDoInput(true);
            httpUrlConn.setUseCaches(false);
            // 设置请求方式（GET/POST）
            httpUrlConn.setRequestMethod(requestMethod);

            if ("GET".equalsIgnoreCase(requestMethod))
                httpUrlConn.connect();

            // 当有数据需要提交时
            if (null != outputStr) {
                OutputStream outputStream = httpUrlConn.getOutputStream();
                // 注意编码格式，防止中文乱码
                outputStream.write(outputStr.getBytes("UTF-8"));
                outputStream.close();
            }

            // 将返回的输入流转换成字符串
            InputStream inputStream = httpUrlConn.getInputStream();
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

            String str = null;
            while ((str = bufferedReader.readLine()) != null) {
                buffer.append(str);
            }
            bufferedReader.close();
            inputStreamReader.close();
            // 释放资源
            inputStream.close();
            inputStream = null;
            httpUrlConn.disconnect();
            // jsonObject = JSONObject.fromObject(buffer.toString());
            return buffer.toString();
        } catch (ConnectException ce) {
            System.out.println("Weixin server connection timed out.");
        } catch (Exception e) {
            System.out.println("error.");
        }
        return null;
    }

    /**
     * 获取TOKEN的方法，区别于getAccessToken,
     * 此方法是先验证本地的token是否到期，
     * 如果不到期直接从本地获取，
     * 如果到期则调用getAccessToken从服务获取重新放到本地
     * @return token的值
     */
    public static String getAccess_token() {
        // 获取accessToken之前判断文件里有没有，没有重新获取，填写过期时间，有判断时间有没有过期
        System.out.print("--------------开始获取Token");
        PropertiesUtil putil = new PropertiesUtil(Constants.CONF_PROPERTIES_PATH);
        try {
            Long overduetime = Long.parseLong(putil.getProperty("OVERDUE_ACCESS_TOKEN_TIME"));
            System.out.print("--------------获取PROP文件中的TOKEN超时时间：" + overduetime);
            Timestamp s = new Timestamp();
            AccessToken token = new AccessToken();
            if (s.getDateTime() > overduetime) {
                // 超时从新获取accessToken
                System.out.print("--------------开始从服务器重新获取Token");
                token = getAccessToken(Constants.APPID, Constants.SECRET);
                putil.writeProperties("OVERDUE_ACCESS_TOKEN_TIME",
                        String.valueOf(s.getDateTime() + Constants.ACCESS_TOKEN_TIME));
                putil.writeProperties("ACCESS_TOKEN", token.getAccessToken());
            } else {
                System.out.println("------------从配置文件中获取到得TOKEN值为：" + putil.getProperty("ACCESS_TOKEN") + ",time:"
                        + token.getExpiresIn());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return putil.getProperty("ACCESS_TOKEN");
    }

    public static String create_nonce_str() {
        return UUID.randomUUID().toString();
    }

    public static String create_timestamp() {
        return Long.toString(System.currentTimeMillis() / 1000);
    }

    /**
     * 调用微信JS接口的临时票据
     * 
     * @param access_token
     *            接口访问凭证
     * @return
     * @throws IOException
     * @throws ClientProtocolException
     */
    public static String getJsApiTicket(String access_token) throws ClientProtocolException, IOException {
        String url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi";
        String requestUrl = url.replace("ACCESS_TOKEN", access_token);

        JsonParser jsonparser = new JsonParser();
        HttpClient client = HttpClientBuilder.create().build();
        HttpGet get = new HttpGet(requestUrl);
        HttpResponse res = client.execute(get);
        String responseContent = null; // 响应内容
        HttpEntity entity = res.getEntity();
        responseContent = EntityUtils.toString(entity, "UTF-8");
        JsonObject jsonObject = jsonparser.parse(responseContent).getAsJsonObject();

        String ticket = null;
        if (null != jsonObject) {
            try {
                ticket = jsonObject.get("ticket").getAsString();
            } catch (Exception e) {
                // 获取token失败
                System.out.print("获取token失败 errcode:" + jsonObject.get("errcode").getAsInt() + " errmsg:"
                        + jsonObject.get("errmsg").getAsString() + "");
            }
        }
        return ticket;
    }

    public static String byteToHex(final byte[] hash) {
        Formatter formatter = new Formatter();
        for (byte b : hash) {
            formatter.format("%02x", b);
        }
        String result = formatter.toString();
        formatter.close();
        return result;
    }

    /**
     * 微信中的重定向页面需要编码处理
     * @param source
     * @return
     */
    public static String urlEncodeUTF8(String source) {
        String result = source;
        try {
            result = URLEncoder.encode(source, "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 得到获取code的微信地址
     * @param reurl
     * @return
     */
    public static String getCodeUrl(String reurl) {
        reurl = urlEncodeUTF8(reurl);
        String codeUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + Constants.APPID
                + "&redirect_uri=" + reurl + "&response_type=code&scope=snsapi_base&state=" + Constants.STATE
                + "#wechat_redirect";

        return codeUrl;
    }

    /**
     * 获取用户信息以及TOKEN SCOP_BASE模式
     * @param code
     * @return
     */
    public static OAuthInfo getOAuthOpenId(String code) {
        OAuthInfo oAuthInfo = null;
        String requestUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + Constants.APPID + "&secret="
                + Constants.SECRET + "&code=" + code + "&grant_type=authorization_code";
        System.out.println("------------获取TOKEN的路径为：" + requestUrl);

        String json = httpRequest(requestUrl, "GET", null);
        System.out.println("------------获取TOKEN返回值为：" + json);

        JSONObject jsonObject = JSONObject.fromObject(json);

        // 如果请求成功
        if (null != jsonObject) {
            try {
                oAuthInfo = new OAuthInfo();
                oAuthInfo.setAccessToken(jsonObject.getString("access_token"));
                oAuthInfo.setExpiresIn(jsonObject.getInt("expires_in"));
                oAuthInfo.setRefreshToken(jsonObject.getString("refresh_token"));
                oAuthInfo.setOpenId(jsonObject.getString("openid"));
                oAuthInfo.setScope(jsonObject.getString("scope"));
            } catch (JSONException e) {
                oAuthInfo = null;
                // 获取token失败
                System.out.println("网页授权获取openId失败 errcode:" + jsonObject.getString("errcode") + " errmsg:"
                        + jsonObject.getString("errmsg") + "");
            }
        }
        return oAuthInfo;
    }

}
