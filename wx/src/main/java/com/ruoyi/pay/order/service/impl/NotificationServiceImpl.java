package com.ruoyi.pay.order.service.impl;//package com.belong.pay.service.impl;
//
//import com.belong.common.utils.spring.SpringUtils;
//import com.belong.pay.service.CertificatesManagerService;
//import com.belong.pay.service.NotificationService;
//import com.belong.system.config.WechatConfig;
//import com.wechat.pay.contrib.apache.httpclient.auth.Verifier;
//import com.wechat.pay.contrib.apache.httpclient.notification.Notification;
//import com.wechat.pay.contrib.apache.httpclient.notification.NotificationHandler;
//import com.wechat.pay.contrib.apache.httpclient.notification.NotificationRequest;
//import org.junit.Assert;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import java.nio.charset.StandardCharsets;
//
//@Service
//public class NotificationServiceImpl implements NotificationService {
//
//    @Autowired
//    private CertificatesManagerService certificatesManagerService;
//    WechatConfig config =  SpringUtils.getBean(WechatConfig.class);
//
//    @Override
//    public Notification ChecknotificationHandler(String serialNo,String nonceStr,String timestamp,String signature,String body) throws Exception {
//        // 构建request，传入必要参数
//        NotificationRequest request = new NotificationRequest.Builder().withSerialNumber(serialNo)
//                .withNonce(nonceStr)
//                .withTimestamp(timestamp)
//                .withSignature(signature)
//                .withBody(body)
//                .build();
//        // 校验是否需要下载证书（如需要会自动下载证书）
//        Verifier verifier = certificatesManagerService.getCertificate();
//
//        NotificationHandler handler = new NotificationHandler(verifier, config.getApiV3Key().getBytes(StandardCharsets.UTF_8));
//        // 验签和解析请求体
//        Notification notification = handler.parse(request);
//
//
//        //System.out.println(notification.toString());
//
//
//        return notification;
//    }
//}
