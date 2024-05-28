package com.ruoyi.pay.share.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 分润规则表
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("a_wechat_share_rule")
@ApiModel(value = "AWechatShareRule对象", description = "分润规则表")
public class AWechatShareRule implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId("id")
    private String id;

    @ApiModelProperty(value = "支付特约商户号")
    @TableField("pay_mch_id")
    private String payMchId;

    @ApiModelProperty(value = "业务来源项")
    @TableField("business_item")
    private String businessItem;

    @ApiModelProperty(value = "分润规则")
    @TableField("share_rule")
    private String shareRule;

    @ApiModelProperty(value = "是否逻辑删除")
    @TableField("deleted")
    private Integer deleted;

    @ApiModelProperty(value = "创建时间")
    @TableField("create_time")
    private LocalDateTime createTime;

}
