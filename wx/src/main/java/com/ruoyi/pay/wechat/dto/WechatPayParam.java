package com.ruoyi.pay.wechat.dto;

import com.ruoyi.pay.order.enums.BusinessType;
import lombok.Data;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

/**
 * 微信支付参数
 */
@Data
public class WechatPayParam {

    /**
     * 业务类型
     */
    @NotNull(message = "请选择业务类型")
    private BusinessType business;

    /**
     * 业务编号
     * 考前培训：APeixunApply -> 主键ID
     * 考试报名：AExamApply -> 主键ID
     * 继续教育：AJXJYApply -> 主键ID
     */
    @NotNull(message = "请输入业务来源ID")
    private String businessId;

    /**
     * 用户ID
     */
    private String userId;

    /**
     * 订单金额
     */
    @NotNull(message = "请输入订单金额")
    @Min(value = 0, message = "最小金额0.01")
    private BigDecimal totalAmount;

    /**
     * 优惠金额
     */
    @NotNull(message = "请输入优惠金额")
    @Min(value = 0, message = "最小金额0.01")
    private BigDecimal discountAmount;

    /**
     * 实付金额
     */
    @NotNull(message = "请输入实付金额")
    @Min(value = 0, message = "最小金额0.01")
    private BigDecimal paidAmount;

    /**
     * openid
     */
//    @NotNull(message = "请先获取支付授权")
    private String openId;

    /**
     * 请求支付IP地址
     * H5 支付调用
     */
    private String ipAddress;

    /**
     * 场景类型
     * 示例值：iOS, Android, Wap
     */
    private String sceneType;

    /**
     * 证照类型
     */
    private String applyInfo;

    /**
     * 备注
     */
    private String remark;

    /**
     * 是否分润，默认不分账
     * 注意：不分账证明走非税对公账户，支付的时候特约商户选非税户
     */
    private boolean profitShare = false;

}
