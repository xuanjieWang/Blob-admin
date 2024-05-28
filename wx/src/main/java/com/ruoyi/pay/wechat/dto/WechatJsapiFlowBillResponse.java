package com.ruoyi.pay.wechat.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

/**
 * JSAPI微信支付资金账单申请响应
 */
@Data
public class WechatJsapiFlowBillResponse {

    /**
     * 下载地址
     * <p>
     * 供下一步请求账单文件的下载地址，该地址30s内有效。
     */
    @JsonProperty("download_url")
    private String downloadUrl;

    /**
     * 哈希类型
     * <p>
     * 枚举值：
     * SHA1：SHA1值
     */
    @JsonProperty("hash_type")
    private String hashType;

    /**
     * 哈希值
     * <p>
     * 原始账单（gzip需要解压缩）的摘要值，用于校验文件的完整性。
     */
    @JsonProperty("hash_value")
    private String hashValue;

}
