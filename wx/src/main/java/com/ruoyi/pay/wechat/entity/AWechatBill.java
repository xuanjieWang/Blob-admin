package com.ruoyi.pay.wechat.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * 微信账单
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("a_wechat_bill")
@ApiModel(value = "AWechatBill对象", description = "微信账单")
public class AWechatBill implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键ID")
    @TableId("id")
    private String id;

    @ApiModelProperty(value = "交易时间")
    @TableField("trade_date")
    private LocalDateTime tradeDate;

    @ApiModelProperty(value = "公众账号ID")
    @TableField("public_account_id")
    private String publicAccountId;

    @ApiModelProperty(value = "商户号")
    @TableField("mch_id")
    private String mchId;

    @ApiModelProperty(value = "特约商户号")
    @TableField("special_mch_id")
    private String specialMchId;

    @ApiModelProperty(value = "设备号")
    @TableField("device_no")
    private String deviceNo;

    @ApiModelProperty(value = "微信订单号")
    @TableField("wechat_order_id")
    private String wechatOrderId;

    @ApiModelProperty(value = "商户订单号")
    @TableField("order_id")
    private String orderId;

    @ApiModelProperty(value = "用户标识")
    @TableField("user_id")
    private String userId;

    @ApiModelProperty(value = "交易类型")
    @TableField("trade_type")
    private String tradeType;

    @ApiModelProperty(value = "交易状态")
    @TableField("trade_status")
    private String tradeStatus;

    @ApiModelProperty(value = "付款银行")
    @TableField("pay_bank")
    private String payBank;

    @ApiModelProperty(value = "货币种类")
    @TableField("currency")
    private String currency;

    @ApiModelProperty(value = "应结单金额")
    @TableField("should_amount")
    private BigDecimal shouldAmount;

    @ApiModelProperty(value = "代金券金额")
    @TableField("voucher")
    private BigDecimal voucher;

    @ApiModelProperty(value = "微信退款单号")
    @TableField("wechat_refund_no")
    private String wechatRefundNo;

    @ApiModelProperty(value = "商户退款单号")
    @TableField("refund_no")
    private String refundNo;

    @ApiModelProperty(value = "退款金额")
    @TableField("refund_fee")
    private BigDecimal refundFee;

    @ApiModelProperty(value = "充值券退款金额")
    @TableField("voucher_refund_fee")
    private BigDecimal voucherRefundFee;

    @ApiModelProperty(value = "退款类型")
    @TableField("refund_type")
    private String refundType;

    @ApiModelProperty(value = "退款状态")
    @TableField("refund_status")
    private String refundStatus;

    @ApiModelProperty(value = "商品名称")
    @TableField("product_name")
    private String productName;

    @ApiModelProperty(value = "商户数据包")
    @TableField("data_package")
    private String dataPackage;

    @ApiModelProperty(value = "手续费")
    @TableField("charge")
    private BigDecimal charge;

    @ApiModelProperty(value = "费率")
    @TableField("rate")
    private String rate;

    @ApiModelProperty(value = "订单金额")
    @TableField("order_fee")
    private BigDecimal orderFee;

    @ApiModelProperty(value = "申请退款金额")
    @TableField("apply_refund_fee")
    private BigDecimal applyRefundFee;

    @ApiModelProperty(value = "费率备注")
    @TableField("rate_remark")
    private String rateRemark;

    public AWechatBill(String[] row) throws ParseException {

//        id = UUID.randomUUID().toString();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        tradeDate = LocalDateTime.parse(row[0].replace("`", ""), dtf);
        publicAccountId = row[1].replace("`", "");
        mchId = row[2].replace("`", "");
        specialMchId = row[3].replace("`", "");
        deviceNo = row[4].replace("`", "");
        wechatOrderId = row[5].replace("`", "");
        orderId = row[6].replace("`", "");
        userId = row[7].replace("`", "");
        tradeType = row[8].replace("`", "");
        tradeStatus = row[9].replace("`", "");
        payBank = row[10].replace("`", "");
        currency = row[11].replace("`", "");
        shouldAmount = new BigDecimal(row[12].replace("`", ""));
        voucher = new BigDecimal(row[13].replace("`", ""));
        wechatRefundNo = row[14].replace("`", "");
        refundNo = row[15].replace("`", "");
        refundFee = new BigDecimal(row[16].replace("`", ""));
        voucherRefundFee = new BigDecimal(row[17].replace("`", ""));
        refundType = row[18].replace("`", "");
        refundStatus = row[19].replace("`", "");
        productName = row[20].replace("`", "");
        dataPackage = row[21].replace("`", "");
        charge = new BigDecimal(row[22].replace("`", "")).negate();
        rate = row[23].replace("`", "");
        if (row.length > 24) {
            orderFee = new BigDecimal(row[24].replace("`", ""));
            applyRefundFee = new BigDecimal(row[25].replace("`", ""));
            rateRemark = row[26].replace("`", "");
        }
    }

}
