package com.ruoyi.pay.order.service.impl;//package com.belong.pay.service.impl;
//
//
//import com.belong.common.utils.spring.SpringUtils;
//import com.belong.pay.service.CertificatesManagerService;
//import com.belong.system.config.WechatConfig;
//import com.wechat.pay.contrib.apache.httpclient.auth.PrivateKeySigner;
//import com.wechat.pay.contrib.apache.httpclient.auth.Verifier;
//import com.wechat.pay.contrib.apache.httpclient.auth.WechatPay2Credentials;
//import com.wechat.pay.contrib.apache.httpclient.cert.CertificatesManager;
//import com.wechat.pay.contrib.apache.httpclient.util.PemUtil;
//import org.springframework.stereotype.Service;
//import java.nio.charset.StandardCharsets;
//import java.security.*;
//
//
//
//@Service
//public class CertificatesManagerServiceImpl implements CertificatesManagerService {
//
//    WechatConfig config =  SpringUtils.getBean(WechatConfig.class);
//    CertificatesManager certificatesManager;
//    Verifier verifier;
//
//
//
//    @Override
//    public  Verifier getCertificate() throws Exception {
//
//        PrivateKey merchantPrivateKey = PemUtil.loadPrivateKey(config.getPrivateKeyStr());
//        // 获取证书管理器实例
//        certificatesManager = CertificatesManager.getInstance();
//        // 向证书管理器增加需要自动更新平台证书的商户信息
//        certificatesManager.putMerchant(config.getMchId(), new WechatPay2Credentials(config.getMchId(),
//                new PrivateKeySigner(config.getMchSerialNo(), merchantPrivateKey)), config.getApiV3Key().getBytes(StandardCharsets.UTF_8));
//        // 从证书管理器中获取verifier
//        verifier = certificatesManager.getVerifier(config.getMchId());
//
//       return verifier;
//    }
//
//
//}
