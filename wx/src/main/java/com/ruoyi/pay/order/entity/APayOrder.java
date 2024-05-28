package com.ruoyi.pay.order.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.pay.order.enums.PaymentStatus;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 用户订单表
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("a_pay_order")
@ApiModel(value = "APayOrder对象", description = "用户订单表")
public class APayOrder implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键ID")
    @TableId("id")
    private String id;

    @ApiModelProperty(value = "订单号")
    @TableField("order_no")
    @Excel(name = "订单号")
    private String orderNo;

    @ApiModelProperty(value = "用户ID")
    @TableField("user_id")
    private String userId;

    @ApiModelProperty(value = "业务来源")
    @TableField("business_type")
    @Excel(name = "业务来源")
    private BusinessType businessType;

    @ApiModelProperty(value = "业务ID")
    @TableField("business_id")
    @Excel(name = "业务来源ID")
    private String businessId;

    @ApiModelProperty(value = "申请类型")
    @TableField("apply_info")
    @Excel(name = "申请类型")
    private String applyInfo;

    @ApiModelProperty(value = "订单状态")
    @TableField("status")
    @Excel(name = "订单状态")
    private PaymentStatus status;

    @ApiModelProperty(value = "订单金额")
    @TableField("total_amount")
    @Excel(name = "订单金额")
    private BigDecimal totalAmount;

    @ApiModelProperty(value = "优惠金额")
    @TableField("discount_amount")
    private BigDecimal discountAmount;

    @ApiModelProperty(value = "实付金额")
    @TableField("paid_amount")
    @Excel(name = "实付金额")
    private BigDecimal paidAmount;

    @ApiModelProperty(value = "服务商ID")
    @TableField("sp_app_id")
    private String spAppId;

    @ApiModelProperty(value = "服务商户号")
    @TableField("sp_mch_id")
    private String spMchId;

    @ApiModelProperty(value = "子商户应用ID")
    @TableField("sub_app_id")
    private String subAppId;

    @ApiModelProperty(value = "子商户号")
    @TableField("sub_mch_id")
    @Excel(name = "商户号")
    private String subMchId;

    @ApiModelProperty(value = "支付者openID")
    @TableField("open_id")
    private String openId;

    @ApiModelProperty(value = "支付时间")
    @TableField("paid_time")
    @Excel(name = "支付时间")
    private LocalDateTime paidTime;

    @ApiModelProperty(value = "支付流水号")
    @TableField("flow_number")
    @Excel(name = "交易流水号")
    private String flowNumber;

    @ApiModelProperty(value = "是否逻辑删除")
    @TableField("del_flag")
    private Integer delFlag;

    @ApiModelProperty(value = "创建人")
    @TableField("create_by")
    private String createBy;

    @ApiModelProperty(value = "创建时间")
    @TableField("create_time")
    private LocalDateTime createTime;

    @ApiModelProperty(value = "更新人")
    @TableField("update_by")
    private String updateBy;

    @ApiModelProperty(value = "更新时间")
    @TableField("update_time")
    private LocalDateTime updateTime;

    @ApiModelProperty(value = "下单时间戳")
    @TableField("timestamp")
    private String timestamp;

    @ApiModelProperty(value = "随机字符串")
    @TableField("nonce_str")
    private String nonceStr;

    @ApiModelProperty(value = "预下单返回ID")
    @TableField("prepay_id")
    private String prepayId;

    @ApiModelProperty(value = "交易类型")
    @TableField("trade_type")
    private String tradeType;

    @ApiModelProperty(value = "交易状态")
    @TableField("trade_state")
    private String tradeState;

    @ApiModelProperty(value = "交易状态描述")
    @TableField("trade_state_desc")
    private String tradeStateDesc;

    @ApiModelProperty(value = "是否分账")
    @TableField("profit_share")
    @Excel(name = "是否分账", readConverterExp = "0=否,1=是")
    private int profitShare;

    @ApiModelProperty(value = "分账规则，当分账为true时必填")
    @TableField("share_rule_id")
    private String shareRuleId;

    @ApiModelProperty(value = "分账单号")
    @TableField("share_order_no")
    @Excel(name = "分账单号")
    private String shareOrderNo;

    @ApiModelProperty(value = "微信分账单号")
    @TableField("share_wechat_order_no")
    private String shareWechatOrderNo;

    @ApiModelProperty(value = "分账状态")
    @TableField("share_state")
    @Excel(name = "分账状态")
    private String shareState;

    @ApiModelProperty(value = "分账明细")
    @TableField("receivers")
    @Excel(name = "分账明细")
    private String receivers;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @TableField(exist = false)
    private LocalDate startDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @TableField(exist = false)
    private LocalDate endDate;

    @TableField(exist = false)
    private long pageNum;

    @TableField(exist = false)
    private long pageSize;

}
