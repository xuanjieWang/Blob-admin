//package com.ruoyi.pay.wechat.service;
//
//import com.ruoyi.pay.order.entity.APayOrder;
//import com.ruoyi.pay.wechat.dto.*;
//import com.ruoyi.pay.wechat.entity.AWechatBill;
//import com.ruoyi.pay.wechat.entity.AWechatShareBill;
//import com.wechat.pay.contrib.apache.httpclient.auth.Verifier;
//import com.wechat.pay.contrib.apache.httpclient.notification.Notification;
//
//import java.util.List;
//
///**
// * 微信支付业务
// */
//public interface WechatPayService {
//
//    /**
//     * JSAPI支付下单
//     */
//    WechatUnifiedOrderResponse unifiedOrder(WechatPayParam payParam) throws Exception;
//
//    /**
//     * H5支付下单
//     */
//    String unifiedH5Order(WechatPayParam payParam) throws Exception;
//
//    /**
//     * Native支付下单
//     */
//    @Deprecated
//    String unifiedNativeOrder(WechatPayParam payParam) throws Exception;
//
//    /**
//     * 回调处理
//     */
//    void handlePayNotification(Notification notification) throws Exception;
//
//    /**
//     * 商户订单号查询
//     */
//    WechatQueryOrderResponse queryOrder(String orderNo) throws Exception;
//
//    /**
//     * 微信支付订单号查询
//     */
//    WechatQueryOrderResponse queryOrderByTrans(String transId) throws Exception;
//
//    /**
//     * 订单分润
//     */
//    void profitShare(APayOrder order) throws Exception;
//
//    /**
//     * 查询分账
//     */
//    void queryProfitShare(APayOrder payOrder) throws Exception;
//
//    /**
//     * 更新证书
//     * 校验是否需要下载证书（如需要会自动下载证书）
//     */
//    Verifier getCertificate() throws Exception;
//
//    /**
//     * JSAPI申请交易账单
//     * <p>
//     * 微信支付按天提供交易账单文件，服务商可以通过该接口获取账单文件的下载地址。
//     * 文件内包含交易相关的金额、时间、营销等信息，供商户核对订单、退款、银行到账等情况。
//     */
//    String getJsapiTradeBill(WechatJsapiTradeBillRequest request) throws Exception;
//
//    /**
//     * JSAPI申请资金账单
//     * <p>
//     * 微信支付按天提供微信支付账户的资金流水账单文件，服务商可以通过该接口获取账单文件的下载地址。
//     * 文件内包含该账户资金操作相关的业务单号、收支金额、记账时间等信息，供商户进行核对。
//     */
//    String getJsapiFlowBill(WechatJsapiFlowBillRequest request) throws Exception;
//
//    /**
//     * JSAPI申请单个子商户资金账单
//     * <p>
//     * 微信支付按天提供微信支付账户的资金流水账单文件，服务商可以通过该接口获取子商户账单文件的下载地址。
//     * 文件内包含子商户资金操作相关的业务单号、收支金额、记账时间等信息，供商户进行核对。
//     */
//    String getJsapiSubmerchantFlowBill(WechatJsapiSubmerchantFlowBillRequest request) throws Exception;
//
//    /**
//     * JSAPI下载账单
//     */
//    void getBill(String billUrl);
//
//    /**
//     * JSAPI下载账单
//     */
//    List<AWechatBill> getBill(String billUrl, String tarType);
//
//    /**
//     * 申请分账账单
//     * <p>
//     * 微信支付按天提供分账账单文件，商户可以通过该接口获取账单文件的下载地址。
//     * 文件内包含分账相关的金额、时间等信息，供商户核对到账等情况。
//     * 注意：
//     * • 微信侧未成功的分账单不会出现在对账单中。
//     * • 对账单中涉及金额的字段单位为“元”。
//     * • 对账单接口只能下载三个月以内的账单。
//     */
//    String getProfitShareBill(WechatShareBillRequest request) throws Exception;
//
//    /**
//     * 下载分账账单
//     */
//    List<AWechatShareBill> getShareBill(String billUrl, String tarType);
//
//}
