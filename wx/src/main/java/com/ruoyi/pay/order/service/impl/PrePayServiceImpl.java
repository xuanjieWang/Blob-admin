package com.ruoyi.pay.order.service.impl;//package com.belong.pay.service.impl;
//
//
//import com.alibaba.fastjson.JSONObject;
//import com.belong.common.utils.spring.SpringUtils;
//import com.belong.pay.service.CertificatesManagerService;
//import com.belong.pay.service.PrePayService;
//import com.belong.system.config.WechatConfig;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.fasterxml.jackson.databind.node.ObjectNode;
//import com.github.wxpay.sdk.WXPayUtil;
//import com.wechat.pay.contrib.apache.httpclient.WechatPayHttpClientBuilder;
//import com.wechat.pay.contrib.apache.httpclient.auth.Verifier;
//import com.wechat.pay.contrib.apache.httpclient.auth.WechatPay2Validator;
//import org.apache.http.client.methods.CloseableHttpResponse;
//import org.apache.http.client.methods.HttpPost;
//import org.apache.http.entity.StringEntity;
//import org.apache.http.impl.client.CloseableHttpClient;
//import org.apache.http.util.EntityUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import java.io.*;
//import java.security.*;
//import java.util.*;
//
//
//@Service
//public class PrePayServiceImpl implements PrePayService {
//
//    @Autowired
//    private CertificatesManagerService certificatesManagerService;
//
//    WechatConfig config =  SpringUtils.getBean(WechatConfig.class);
//    HttpPost httpPost = new HttpPost("https://api.mch.weixin.qq.com/v3/pay/partner/transactions/jsapi");
//    private CloseableHttpClient httpClient;
//
//    @Override
//    public  Map<String, String> makeJsAPI(String openid) throws Exception {
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
//        //下单参数构造，生成httpPost
//        httpPost.addHeader("Accept", "application/json");
//        httpPost.addHeader("Content-type","application/json; charset=utf-8");
//
//        ByteArrayOutputStream bos = new ByteArrayOutputStream();
//        ObjectMapper objectMapper = new ObjectMapper();
//
//          //订单号生成，待完善
//        Random random = new Random();
//
//        String out_trade_no = random.nextInt(9999999) + "";
//
//        ObjectNode rootNode = objectMapper.createObjectNode();
//        rootNode.put("sp_appid",config.getAppId())
//                .put("sp_mchid", config.getMchId())
//                .put("sub_mchid", config.getSubMchId())
//                .put("description", "测试描述")
//                .put("out_trade_no", out_trade_no)
//                .put("notify_url", config.getNotifyUrl());
//        rootNode.putObject("amount")
//                .put("total", 10);
//        rootNode.putObject("settle_info")
//                .put("profit_sharing", true);
//        rootNode.putObject("payer")
//                .put("sp_openid", openid);
//        objectMapper.writeValue(bos, rootNode);
//        httpPost.setEntity(new StringEntity(bos.toString("UTF-8"), "UTF-8"));
//
//        //发送请求得到并处理prepay_id
//        CloseableHttpResponse response = httpClient.execute(httpPost);
//        String jsonprepay_id = EntityUtils.toString(response.getEntity());
//        JSONObject jso = JSONObject.parseObject(jsonprepay_id);
//        String prepay_id = jso.getString("prepay_id");
//
//
//        //签名后返回给前端小程序调起付款框的参数
//        long timeStamp = System.currentTimeMillis() / 1000;
//        String nonceStr = WXPayUtil.generateNonceStr();
//        String dataStr = config.getAppId() + "\n" + timeStamp + "\n" + nonceStr + "\n" + "prepay_id=" + prepay_id + "\n";
//        String signature = sign(dataStr.getBytes("utf-8"));
//        Map<String, String> payMap = new HashMap<>();
//        payMap.put("appId", config.getAppId());
//        payMap.put("timeStamp", timeStamp + "");
//        payMap.put("nonceStr", nonceStr);
//        payMap.put("signType", "RSA");
//        payMap.put("package", "prepay_id=" + prepay_id);
//        payMap.put("prepay_id", prepay_id);
//        payMap.put("out_trade_no", out_trade_no);
//        payMap.put("paySign", signature);
//
//        return payMap;
//    }
//
//
//    //使用私钥签名函数
//    String sign(byte[] message) throws NoSuchAlgorithmException, SignatureException, InvalidKeyException {
//        Signature sign = Signature.getInstance("SHA256withRSA");
//        sign.initSign(config.getPrivateKey());
//        sign.update(message);
//
//        return Base64.getEncoder().encodeToString(sign.sign());
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
//}
