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
import java.time.LocalDateTime;

/**
 * 微信支付商户管理
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("a_wechat_merchant")
@ApiModel(value = "AWechatMerchant对象", description = "微信支付商户管理")
public class AWechatMerchant implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId("id")
    private String id;

    @ApiModelProperty(value = "商户号")
    @TableField("mch_id")
    private String mchId;

    @ApiModelProperty(value = "商户名称")
    @TableField("mch_name")
    private String mchName;

    @ApiModelProperty(value = "商户类型")
    @TableField("mch_type")
    private String mchType = "特约商户";

    @ApiModelProperty(value = "最大分润百分比")
    @TableField("share_max_ratio")
    private BigDecimal shareMaxRatio = BigDecimal.valueOf(30);

    @ApiModelProperty(value = "是否逻辑删除")
    @TableField("deleted")
    private int deleted;

    @ApiModelProperty(value = "创建时间")
    @TableField("create_time")
    private LocalDateTime createTime;


}
