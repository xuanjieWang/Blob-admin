package com.ruoyi.pay.wechat.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

/**
 * 微信支付订单请求分账响应
 */
@Data
public class WechatProfitShareResponse {

    @JsonProperty("sub_mchid")
    private String subMchId;//子商户号

    @JsonProperty("transaction_id")
    private String transactionId;//微信订单号

    @JsonProperty("out_order_no")
    private String outOrderNo;//商户分账单号

    @JsonProperty("order_id")
    private String orderId;//微信分账单号

    /**
     * 分账单状态（每个接收方的分账结果请查看receivers中的result字段），枚举值：
     * 1、PROCESSING：处理中
     * 2、FINISHED：分账完成
     */
    private String state;//分账状态

    private String receivers;//分账接收方

}
