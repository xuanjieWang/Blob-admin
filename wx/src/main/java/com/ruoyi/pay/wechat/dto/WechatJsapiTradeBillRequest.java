package com.ruoyi.pay.wechat.dto;

import lombok.Data;

/**
 * JSAPI微信支付交易账单申请参数
 */
@Data
public class WechatJsapiTradeBillRequest {

    /**
     * 账单日期
     * <p>
     * 格式yyyy-MM-dd
     * 仅支持三个月内的账单下载申请。
     */
    private String billDate;

    /**
     * 子商户号
     * <p>
     * 商户是服务商：
     * ● 不填则默认返回服务商下的交易或退款数据。
     * ● 如需下载某个子商户下的交易或退款数据，则该字段必填。
     */
    private String subMchId;

    /**
     * 账单类型
     * <p>
     * 不填则默认是ALL
     * 枚举值：
     * ALL：返回当日所有订单信息（不含充值退款订单）
     * SUCCESS：返回当日成功支付的订单（不含充值退款订单）
     * REFUND：返回当日退款订单（不含充值退款订单）
     */
    private String billType;

    /**
     * 压缩类型
     * <p>
     * 不填则默认是数据流
     * 枚举值：
     * GZIP：返回格式为.gzip的压缩包账单
     */
    private String tarType;

}
