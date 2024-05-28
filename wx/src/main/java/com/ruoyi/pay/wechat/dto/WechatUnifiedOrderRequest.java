package com.ruoyi.pay.wechat.dto;

import lombok.Data;

/**
 * 小程序JSAPI下单请求
 */
@Data
public class WechatUnifiedOrderRequest {

    private String spAppId;//服务商应用ID

    private String spMchId;//服务商户号

    private String subAppId;//子商户应用ID

    private String subMchId;//子商户号

    private String description;//商品描述

    private String outTradeNo;//商户系统内部订单号

    private String timeExpire;//订单失效时间,格式为yyyyMMddHHmmss

    private String attach;//附加数据,非必传

    private String notifyUrl;//回调地址

    private String goodsTag;//订单优惠标记

    private SettleInfo settleInfo;//结算信息

    private Amount amount;//订单金额

    private Payer payer;//支付者信息

    public String build() {
        return "";
    }

    @Data
    class SettleInfo {

        private boolean profitSharing;//是否指定分账
    }

    @Data
    class Amount {

        private int total;//总金额，单位分

        private String[] currency;//货币类型
    }

    @Data
    class Payer {

        private String spOpenId;//用户服务标识

        private String subOpenId;//用户子标识
    }

}
