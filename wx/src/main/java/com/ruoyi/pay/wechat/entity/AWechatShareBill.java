package com.ruoyi.pay.wechat.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.pay.order.enums.UUID;
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
 * 微信分账账单
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("a_wechat_share_bill")
@ApiModel(value = "AWechatShareBill对象", description = "微信账单")
public class AWechatShareBill implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键ID")
    @TableId("id")
    private String id;

    @ApiModelProperty(value = "分账时间")
    @TableField("share_date")
    private LocalDateTime shareDate;

    @ApiModelProperty(value = "分账发起方")
    @TableField("start_mch_id")
    private String startMchId;

    @ApiModelProperty(value = "分账方")
    @TableField("share_mch_id")
    private String shareMchId;

    @ApiModelProperty(value = "微信订单号")
    @TableField("wechat_order_id")
    private String wechatOrderId;

    @ApiModelProperty(value = "微信分账/回退单号")
    @TableField("share_order_id")
    private String shareOrderId;

    @ApiModelProperty(value = "分账明细单号")
    @TableField("detail_order_id")
    private String detailOrderId;

    @ApiModelProperty(value = "商户分账/回退单号")
    @TableField("mch_order_id")
    private String mchOrderId;

    @ApiModelProperty(value = "订单金额")
    @TableField("order_fee")
    private BigDecimal orderFee;

    @ApiModelProperty(value = "分账接收方")
    @TableField("receive_mch_id")
    private String receiveMchId;

    @ApiModelProperty(value = "金额")
    @TableField("amount")
    private BigDecimal amount;

    @ApiModelProperty(value = "业务类型")
    @TableField("business_type")
    private String businessType;

    @ApiModelProperty(value = "处理状态")
    @TableField("status")
    private String status;

    @ApiModelProperty(value = "备注")
    @TableField("remark")
    private String remark;

    public AWechatShareBill(String[] row) throws ParseException {
        this.id = UUID.randomUUID().toString();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        this.shareDate = LocalDateTime.parse(row[0].replace("`", ""), dtf);
        ;
        this.startMchId = row[1].replace("`", "");
        this.shareMchId = row[2].replace("`", "");
        this.wechatOrderId = row[3].replace("`", "");
        this.shareOrderId = row[4].replace("`", "");
        this.detailOrderId = row[5].replace("`", "");
        this.mchOrderId = row[6].replace("`", "");
        this.orderFee = new BigDecimal(row[7].replace("`", ""));
        this.receiveMchId = row[8].replace("`", "");
        this.amount = new BigDecimal(row[9].replace("`", ""));
        this.businessType = row[10].replace("`", "");
        this.status = row[11].replace("`", "");
        this.remark = row[12].replace("`", "");
    }
}
