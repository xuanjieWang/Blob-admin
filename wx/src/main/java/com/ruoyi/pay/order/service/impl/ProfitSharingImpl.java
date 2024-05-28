package com.ruoyi.pay.order.service.impl;//package com.belong.pay.service.impl;
//
//
//
//import com.alibaba.fastjson.JSONObject;
//import com.belong.common.utils.spring.SpringUtils;
//import com.belong.pay.dto.SharingDto;
//import com.belong.pay.service.CertificatesManagerService;
//
//import com.belong.pay.service.ProfitSharingService;
//import com.belong.system.config.WechatConfig;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.fasterxml.jackson.databind.node.ObjectNode;
//
//import com.wechat.pay.contrib.apache.httpclient.WechatPayHttpClientBuilder;
//import com.wechat.pay.contrib.apache.httpclient.auth.Verifier;
//import com.wechat.pay.contrib.apache.httpclient.auth.WechatPay2Validator;
//import org.apache.http.client.methods.CloseableHttpResponse;
//import org.apache.http.client.methods.HttpPost;
//import org.apache.http.entity.StringEntity;
//import org.apache.http.impl.client.CloseableHttpClient;
//
//import org.apache.http.util.EntityUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//
//import java.io.ByteArrayOutputStream;
//
//
//import java.io.IOException;
//import java.security.*;
//import java.security.cert.X509Certificate;
//
//import java.util.Arrays;
//import java.util.Base64;
//import javax.crypto.BadPaddingException;
//import javax.crypto.Cipher;
//import javax.crypto.IllegalBlockSizeException;
//import javax.crypto.NoSuchPaddingException;
//
//
//@Service
//public class ProfitSharingImpl implements ProfitSharingService {
//
//    @Autowired
//    private CertificatesManagerService certificatesManagerService;
//
//    WechatConfig config =  SpringUtils.getBean(WechatConfig.class);
//
//    HttpPost httpPost = new HttpPost("https://api.mch.weixin.qq.com/v3/profitsharing/orders");
//    private CloseableHttpClient httpClient;
//
//    @Override
//    public void profitSharing(SharingDto param) throws Exception {
//
//        // 校验是否需要下载证书（如需要会自动下载证书）
//        Verifier verifier = certificatesManagerService.getCertificate();
//        // 构造httpclient
//        httpClient = WechatPayHttpClientBuilder.create()
//                .withMerchant(config.getMchId(), config.getMchSerialNo(), config.getPrivateKey())
//                .withValidator(new WechatPay2Validator(verifier))
//                .build();
//
//
//        httpPost.addHeader("Accept", "application/json");
//        httpPost.addHeader("Content-type","application/json; charset=utf-8");
//
//
//        ObjectMapper objectMapper = new ObjectMapper();
//
//        ObjectNode rootNode = objectMapper.createObjectNode();
//        ObjectNode rootNode1 = objectMapper.createObjectNode();
//        rootNode.put("sub_mchid", config.getSubMchId()) //子商户号
//                .put("appid",config.getAppId()) //appid
//                .put("transaction_id", param.getTransaction_id()) //prepay_id
//                .put("out_order_no", param.getOut_order_no()); //out_trade_no
//        rootNode.putArray("receivers")
//                .add(rootNode1.put("type", "MERCHANT_ID")
//                              .put("account", config.getMchId())
//                              .put("amount", 1)
//                              .put("description", "服务商扣留培训费"));
//        rootNode.put("unfreeze_unsplit", true);
//
//        ByteArrayOutputStream bos = new ByteArrayOutputStream();
//        objectMapper.writeValue(bos, rootNode);
//        httpPost.setEntity(new StringEntity(bos.toString("UTF-8"), "UTF-8"));
//
//        CloseableHttpResponse responseShare = httpClient.execute(httpPost);
//
//        String res = EntityUtils.toString(responseShare.getEntity());
//
//        JSONObject jso = JSONObject.parseObject(res);
//
//
//    }
//
//
//
//}
