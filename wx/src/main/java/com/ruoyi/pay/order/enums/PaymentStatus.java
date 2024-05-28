package com.ruoyi.pay.order.enums;

/**
 * 支付状态
 */
public enum PaymentStatus {

    CREATE,//待支付

    SUCCESS,//支付成功

    REFUND,//转入退款

    NOTPAY,//未支付

    CLOSED,//已关闭

    REVOKED,//已撤销（付款码支付）

    USERPAYING,//用户支付中（付款码支付）

    PAYERROR,//支付失败(其他原因，如银行返回失败)

}
