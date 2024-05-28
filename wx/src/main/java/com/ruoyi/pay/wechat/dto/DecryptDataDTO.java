package com.ruoyi.pay.wechat.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 微信支付通知解析
 */
@Data
public class DecryptDataDTO {

    @JsonProperty("sp_appid")
    private String spAppId;//服务商ID

    @JsonProperty("sp_mchid")
    private String spMchId;//服务商户号

    @JsonProperty("sub_appid")
    private String subAppId;//子商户应用ID

    @JsonProperty("sub_mchid")
    private String subMchId;//子商户号

    @JsonProperty("out_trade_no")
    private String outTradeNo;//商户订单号

    @JsonProperty("transaction_id")
    private String transactionId;//微信支付订单号

    /**
     * 交易类型，枚举值：
     * JSAPI：公众号支付
     * NATIVE：扫码支付
     * APP：APP支付
     * MICROPAY：付款码支付
     * MWEB：H5支付
     * FACEPAY：刷脸支付
     */
    @JsonProperty("trade_type")
    private String tradeType;

    /**
     * 交易状态，枚举值：
     * SUCCESS：支付成功
     * REFUND：转入退款
     * NOTPAY：未支付
     * CLOSED：已关闭
     * REVOKED：已撤销（付款码支付）
     * USERPAYING：用户支付中（付款码支付）
     * PAYERROR：支付失败(其他原因，如银行返回失败)
     */
    @JsonProperty("trade_state")
    private String tradeState;

    @JsonProperty("trade_state_desc")
    private String tradeStateDesc;//交易状态描述

    @JsonProperty("bank_type")
    private String bankType;//付款银行

    @JsonProperty("attach")
    private String attach;//附加数据

    @JsonProperty("success_time")
    private LocalDateTime successTime;//支付完成时间

    @JsonProperty("payer")
    private Payer payer;//支付者信息

    @JsonProperty("amount")
    private Amount amount;//订单金额信息

    @Data
    @JsonIgnoreProperties(ignoreUnknown = true)
    public class Payer {

        @JsonProperty("sp_openid")
        private String spOpenId;//用户服务标识

        @JsonProperty("sub_openid")
        private String subOpenId;//用户子标识
    }

    @Data
    @JsonIgnoreProperties(ignoreUnknown = true)
    public class Amount {

        @JsonProperty("total")
        private int total;//总金额

        @JsonProperty("payer_total")
        private int payerTotal;//用户支付金额

        @JsonProperty("currency")
        private String currency;//货币类型 CNY

        @JsonProperty("payer_currency")
        private String payerCurrency;//用户支付币种 CNY
    }

}
