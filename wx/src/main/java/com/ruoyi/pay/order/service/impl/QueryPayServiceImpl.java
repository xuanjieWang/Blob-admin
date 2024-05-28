package com.ruoyi.pay.order.service.impl;//package com.belong.pay.service.impl;
//
//
//
//import com.belong.common.utils.spring.SpringUtils;
//import com.belong.pay.service.CertificatesManagerService;
//
//import com.belong.pay.service.QueryPayService;
//import com.belong.system.config.WechatConfig;
//
//import com.wechat.pay.contrib.apache.httpclient.WechatPayHttpClientBuilder;
//import com.wechat.pay.contrib.apache.httpclient.auth.Verifier;
//import com.wechat.pay.contrib.apache.httpclient.auth.WechatPay2Validator;
//import org.apache.http.client.methods.CloseableHttpResponse;
//import org.apache.http.client.methods.HttpGet;
//
//import org.apache.http.impl.client.CloseableHttpClient;
//import org.apache.http.util.EntityUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//
//
//@Service
//public class QueryPayServiceImpl implements QueryPayService {
//
//    @Autowired
//    private CertificatesManagerService certificatesManagerService;
//
//    WechatConfig config =  SpringUtils.getBean(WechatConfig.class);
//    HttpGet httpGet = new HttpGet("https://api.mch.weixin.qq.com/v3/pay/partner/transactions/id/");
//    private CloseableHttpClient httpClient;
//
//    @Override
//    public  String queryTradeNo(String out_trade_no) throws Exception {
//
//        // 校验是否需要下载证书（如需要会自动下载证书）
//        Verifier verifier = certificatesManagerService.getCertificate();
//        // 构造httpclient
//        httpClient = WechatPayHttpClientBuilder.create()
//                .withMerchant(config.getMchId(), config.getMchSerialNo(), config.getPrivateKey())
//                .withValidator(new WechatPay2Validator(verifier))
//                .build();;
//
//
//
//        httpGet.addHeader("Accept", "application/json");
//
//        CloseableHttpResponse response = httpClient.execute(httpGet);
//
//        String bodyAsString = EntityUtils.toString(response.getEntity());
//        System.out.println(bodyAsString);
//
//        return bodyAsString;
//    }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//}
