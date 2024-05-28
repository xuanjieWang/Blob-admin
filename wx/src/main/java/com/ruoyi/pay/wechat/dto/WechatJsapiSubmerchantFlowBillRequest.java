package com.ruoyi.pay.wechat.dto;

import lombok.Data;

/**
 * JSAPI微信支付子商户资金账单申请参数
 */
@Data
public class WechatJsapiSubmerchantFlowBillRequest {

    /**
     * 子商户号
     * <p>
     * 下载指定子商户的账单
     */
    private String subMchId;

    /**
     * 账单日期
     * <p>
     * 格式yyyy-MM-dd
     * 仅支持三个月内的账单下载申请。
     */
    private String billDate;

    /**
     * 资金账户类型
     * <p>
     * 不填则默认是BASIC
     * 枚举值：
     * BASIC：基本账户
     * OPERATION：运营账户
     * FEES：手续费账户
     */
    private String accountType;

    /**
     * 加密算法
     * <p>
     * 枚举值：
     * AEAD_AES_256_GCM：AEAD_AES_256_GCM加密算法
     * SM4_GCM：SM4_GCM加密算法，密钥长度128bit
     */
    private String algorithm;

    /**
     * 压缩类型
     * <p>
     * 不填则默认是数据流
     * 枚举值：
     * GZIP：返回格式为.gzip的压缩包账单
     */
    private String tarType;

}
