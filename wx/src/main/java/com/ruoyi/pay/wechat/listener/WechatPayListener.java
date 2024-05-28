package com.ruoyi.pay.wechat.listener;


import com.ruoyi.pay.order.entity.APayOrder;
import com.wechat.pay.contrib.apache.httpclient.exception.WechatPayException;

/**
 * 微信支付事件监听
 */
public interface WechatPayListener {

    /**
     * 下单前触发
     */
    default void beforeUnifiedOrder() throws WechatPayException {

    }

    /**
     * 下单后触发
     */
    default void afterUnifiedOrder() throws WechatPayException {

    }

    /**
     * 支付后事件
     */
    default void afterPaid(APayOrder payOrder) throws WechatPayException {

    }
}
