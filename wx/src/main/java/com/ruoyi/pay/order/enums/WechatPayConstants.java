package com.ruoyi.pay.order.enums;

/**
 * 微信支付常量
 */
public class WechatPayConstants {

    /**
     * JSAPI下单URL
     */
    public final static String MINI_JSAPI_URL = "https://api.mch.weixin.qq.com/v3/pay/partner/transactions/jsapi";

    /**
     * 微信支付订单号查询订单
     */
    public final static String JSAPI_QUERY_TRANS_URL = "https://api.mch.weixin.qq.com/v3/pay/partner/transactions/id/{transaction_id}";

    /**
     * 商户订单号查询订单
     */
    public final static String JSAPI_QUERY_TRADE_URL = "https://api.mch.weixin.qq.com/v3/pay/partner/transactions/out-trade-no/{out_trade_no}";

    /**
     * Native下单URL
     */
    public final static String WEB_NATIVE_URL = "https://api.mch.weixin.qq.com/v3/pay/partner/transactions/native";

    /**
     * H5预下单
     */
    public final static String H5_PAY_URL = "https://api.mch.weixin.qq.com/v3/pay/partner/transactions/h5";

    /**
     * 分账请求
     */
    public final static String PROFIT_SHARE_ORDER = "https://api.mch.weixin.qq.com/v3/profitsharing/orders";

    /**
     * 查询分账
     */
    public final static String QUERY_PROFIT_SHARE_ORDER = "https://api.mch.weixin.qq.com/v3/profitsharing/orders/{out_order_no}";

    /**
     * 请求分账回退
     */
    public final static String PROFIT_SHARE_ORDER_REFUND = "https://api.mch.weixin.qq.com/v3/profitsharing/return-orders";

    /**
     * 查询分账回退
     */
    public final static String QUERY_PROFIT_SHARE_ORDER_REFUND = "https://api.mch.weixin.qq.com/v3/profitsharing/return-orders/{out_return_no}";

    /**
     * JSAPI申请交易账单
     */
    public final static String JSAPI_TRADE_BILL = "https://api.mch.weixin.qq.com/v3/bill/tradebill";

    /**
     * JSAPI申请资金账单
     */
    public final static String JSAPI_FLOW_BILL = "https://api.mch.weixin.qq.com/v3/bill/fundflowbill";

    /**
     * JSAPI申请单个子商户资金账单
     */
    public final static String JSAPI_SUBMERCHANT_FLOW_BILL = "https://api.mch.weixin.qq.com/v3/bill/sub-merchant-fundflowbill";

    /**
     * 申请分账账单
     */
    public final static String PROFIT_SHARE_BILL = "https://api.mch.weixin.qq.com/v3/profitsharing/bills";

}
