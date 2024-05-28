package com.ruoyi.pay.order.enums;

import com.ruoyi.common.utils.sign.Base64;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.InitializingBean;

import java.io.InputStream;
import java.net.URL;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.spec.PKCS8EncodedKeySpec;

/**
 * 微信支付配置
 */
@Data
@Slf4j
public class WechatConfig implements InitializingBean {

    private String appId;

    private String AppSecret;

    private String mchId;//商户号

    private String subMchId;//特约商户

    private String nonTaxMchId;//非税对公账户

    private String apiV3Key;

    private String notifyUrl;

    private String privateKeyStr;

    private String mchSerialNo;

    private PrivateKey privateKey;

    private String pemFilePath;

    @Override
    public void afterPropertiesSet() throws Exception {
        initPrivateKey();
    }

    private void initPrivateKey() {

        URL url = getClass().getClassLoader().getResource(pemFilePath);
        if (url == null) {
            throw new IllegalStateException("微信支付未找到私钥:" + pemFilePath);
        }
        try (InputStream in = url.openStream()) {
            byte[] bs = new byte[in.available()];
            if (in.read(bs) < 0) {
                throw new IllegalStateException("微信支付读取私钥异常");
            }
            this.privateKeyStr = new String(bs).trim();
            PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(Base64.decode(this.privateKeyStr));
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            this.privateKey = keyFactory.generatePrivate(keySpec);
        } catch (Exception e) {
            log.error("微信支付私钥初始化异常, pemFilePath:{}",
                    pemFilePath, e);
            throw new IllegalStateException("微信支付私钥初始化异常", e);
        }
    }

}
