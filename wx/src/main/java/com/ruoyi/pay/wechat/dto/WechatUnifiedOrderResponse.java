package com.ruoyi.pay.wechat.dto;

import lombok.Data;

/**
 * 小程序JSAPI下单返回
 */
@Data
public class WechatUnifiedOrderResponse {

    private String appId;//小程序ID

    private String timestamp;//时间戳

    private String nonceStr;//随机字符串

    /**
     * 订单详情扩展字符串
     * 格式：prepay_id=***
     */
    private String pkg;//package is keyword in java

    private String signType = "RSA";//签名方式 default RSA

    private String paySign;//签名

    private String prepayId;//预下单返回ID

}
