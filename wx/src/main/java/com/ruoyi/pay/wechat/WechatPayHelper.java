package com.ruoyi.pay.wechat;

import com.ruoyi.pay.order.enums.WechatConfig;
import com.ruoyi.pay.wechat.entity.AWechatBill;
import com.ruoyi.pay.wechat.entity.AWechatShareBill;
import com.wechat.pay.contrib.apache.httpclient.WechatPayHttpClientBuilder;
import com.wechat.pay.contrib.apache.httpclient.auth.Verifier;
import com.wechat.pay.contrib.apache.httpclient.auth.WechatPay2Validator;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.util.EntityUtils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.zip.GZIPInputStream;

/**
 * 微信支付公共请求
 */
@Slf4j
public class WechatPayHelper {

    private static CloseableHttpClient httpClient;

    /**
     * POST微信支付公共请求
     *
     * @param url         请求地址
     * @param requestData 请求参数
     * @param verifier    证书
     * @param config      微信支付配置
     * @return 请求结果
     */
    public static String doPostRequest(String url, String requestData,
                                       Verifier verifier, WechatConfig config) {

        String resultString;
        try {

            httpClient = WechatPayHttpClientBuilder.create()
                    .withMerchant(config.getMchId(), config.getMchSerialNo(), config.getPrivateKey())
                    .withValidator(new WechatPay2Validator(verifier))
                    .build();

            RequestConfig requestConfig = RequestConfig.custom()
                    .setConnectTimeout(3000)
                    .setSocketTimeout(6000)
                    .build();

            HttpPost post = new HttpPost(url);
            post.setConfig(requestConfig);
            post.addHeader("Accept", "application/json");
            post.addHeader("Content-type", "application/json; charset=utf-8");

            ByteArrayEntity requestEntity = new ByteArrayEntity(requestData.getBytes());
            post.setEntity(requestEntity);

            CloseableHttpResponse response = httpClient.execute(post);
            resultString = EntityUtils.toString(response.getEntity(), "UTF-8");

            int httpCode = response.getStatusLine().getStatusCode();
            // 判断返回状态是否为200
            if (httpCode == 200) {
                HttpEntity responseEntity = response.getEntity();
                StringBuilder result = new StringBuilder();
                BufferedReader reader = new BufferedReader(new InputStreamReader(responseEntity.getContent()));
                String text;
                while ((text = reader.readLine()) != null) {
                    result.append(text);
                }
                EntityUtils.consume(requestEntity);
                return result.toString();
            } else {
                throw new IOException("请求微信支付Https响应错误: " + resultString);
            }

        } catch (IOException e) {
            log.error("请求微信异常, url:{}, data:{}", url, requestData, e);
        }
        return null;

    }

    /**
     * GET微信支付公共请求
     *
     * @param url      请求地址
     * @param verifier 证书
     * @param config   微信支付配置
     * @return 请求结果
     */
    public static String doGetRequest(String url, Map<String, String> param,
                                      Verifier verifier, WechatConfig config) {

        String resultString;
        try {

            httpClient = WechatPayHttpClientBuilder.create()
                    .withMerchant(config.getMchId(), config.getMchSerialNo(), config.getPrivateKey())
                    .withValidator(new WechatPay2Validator(verifier))
                    .build();

            RequestConfig requestConfig = RequestConfig.custom()
                    .setConnectTimeout(3000)
                    .setSocketTimeout(6000)
                    .build();

            // 创建uri
            URIBuilder builder = new URIBuilder(url);
            if (param != null) {
                for (String key : param.keySet()) {
                    builder.addParameter(key, param.get(key));
                }
            }

            URI uri = builder.build();
            HttpGet get = new HttpGet(uri);
            get.setConfig(requestConfig);
            get.addHeader("Accept", "application/json");
            get.addHeader("Content-type", "application/json; charset=utf-8");

            CloseableHttpResponse response = httpClient.execute(get);

            resultString = EntityUtils.toString(response.getEntity(), "UTF-8");
            int httpCode = response.getStatusLine().getStatusCode();
            // 判断返回状态是否为200
            if (httpCode == 200) {
                return resultString;
            } else {
                log.error("请求微信支付Https响应错误: " + resultString);
            }
        } catch (IOException | URISyntaxException e) {
            log.error("请求微信异常, url:{}", url, e);
        }
        return null;
    }

    /**
     * 账单下载请求
     * <p>
     * 账单文件的下载地址的有效时间为30s。
     * • 强烈建议商户将实际账单文件的哈希值和之前从接口获取到的哈希值进行比对，以确认数据的完整性。
     * • 该接口响应的信息请求头中不包含微信接口响应的签名值，因此需要跳过验签的流程。
     * • 微信在次日9点启动生成前一天的对账单，建议商户10点后再获取。
     * <p>
     * 因为下载的账单文件可能会很大，为了平衡系统性能和签名验签的实现成本，账单下载API被分成了两个步骤：
     * /v3/bill/tradebill 获取账单下载链接和账单摘要
     * /v3/billdownload/file 账单文件下载，请求需签名但应答不签名
     * 因为第二步不包含应答签名，我们可以参考上一个问题下载平台证书的方法，使用withValidator(response -> true)“跳过”应答的签名校验。
     */
    public static String download(String url, WechatConfig config) {

        try {

            httpClient = WechatPayHttpClientBuilder.create()
                    .withMerchant(config.getMchId(), config.getMchSerialNo(), config.getPrivateKey())
                    .withValidator(response -> true)
                    .build();

            RequestConfig requestConfig = RequestConfig.custom()
                    .setConnectTimeout(3000)
                    .setSocketTimeout(6000)
                    .build();

            HttpGet get = new HttpGet(url);
            get.setConfig(requestConfig);
            get.addHeader("Accept", "application/json");
            get.addHeader("Content-type", "application/json; charset=utf-8");

            CloseableHttpResponse response = httpClient.execute(get);

            int httpCode = response.getStatusLine().getStatusCode();
            // 判断返回状态是否为200
            if (httpCode == 200) {
                return EntityUtils.toString(response.getEntity(), "UTF-8");
            } else {
                log.error("请求微信支付Https响应错误: " + response.getEntity());
            }

        } catch (IOException e) {
            log.error("请求微信异常, url:{}", url, e);
        }

        return null;

    }

    /**
     * 微信账单下载
     */
    public static List<AWechatBill> getWechatBill(String url, WechatConfig config, String tarType)
            throws IOException, ParseException {

        httpClient = WechatPayHttpClientBuilder.create()
                .withMerchant(config.getMchId(), config.getMchSerialNo(), config.getPrivateKey())
                .withValidator(response -> true)
                .build();

        RequestConfig requestConfig = RequestConfig.custom()
                .setConnectTimeout(3000)
                .setSocketTimeout(6000)
                .build();

        HttpGet get = new HttpGet(url);
        get.setConfig(requestConfig);
        get.addHeader("Accept", "application/json");
        get.addHeader("Content-type", "application/json; charset=utf-8");

        CloseableHttpResponse response = httpClient.execute(get);

        HttpEntity responseEntity = response.getEntity();
        BufferedReader reader;
        if (!StringUtils.isEmpty(tarType)) {
            // 解压
            GZIPInputStream gz = new GZIPInputStream(responseEntity.getContent());
            reader = new BufferedReader(
                    new InputStreamReader(gz, StandardCharsets.UTF_8));
        } else {
            reader = new BufferedReader(
                    new InputStreamReader(responseEntity.getContent(), StandardCharsets.UTF_8));
        }
        String line;
        List<AWechatBill> dataList = new ArrayList<>();
        //第2行开始为数据
        reader.readLine();
        while ((line = reader.readLine()) != null) {
            if (line.contains("总交易单数"))
                break;
            String[] row = line.split(",");
            dataList.add(new AWechatBill(row));
        }
        reader.close();
        return dataList;
    }

    /**
     * 分账账单下载
     */
    public static List<AWechatShareBill> getShareBill(String url, WechatConfig config, String tarType)
            throws IOException, ParseException {

        httpClient = WechatPayHttpClientBuilder.create()
                .withMerchant(config.getMchId(), config.getMchSerialNo(), config.getPrivateKey())
                .withValidator(response -> true)
                .build();

        RequestConfig requestConfig = RequestConfig.custom()
                .setConnectTimeout(3000)
                .setSocketTimeout(6000)
                .build();

        HttpGet get = new HttpGet(url);
        get.setConfig(requestConfig);
        get.addHeader("Accept", "application/json");
        get.addHeader("Content-type", "application/json; charset=utf-8");

        CloseableHttpResponse response = httpClient.execute(get);

        HttpEntity responseEntity = response.getEntity();
        BufferedReader reader;
        if (!StringUtils.isEmpty(tarType)) {
            // 解压
            GZIPInputStream gz = new GZIPInputStream(responseEntity.getContent());
            reader = new BufferedReader(
                    new InputStreamReader(gz, StandardCharsets.UTF_8));
        } else {
            reader = new BufferedReader(
                    new InputStreamReader(responseEntity.getContent(), StandardCharsets.UTF_8));
        }
        String line;
        List<AWechatShareBill> dataList = new ArrayList<>();
        //第2行开始为数据
        reader.readLine();
        while ((line = reader.readLine()) != null) {
            if (line.contains("总条数"))
                break;
            String[] row = line.split(",");
            dataList.add(new AWechatShareBill(row));
        }
        reader.close();
        return dataList;
    }
}
