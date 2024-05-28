package com.ruoyi.pay.wechat.dto;

import com.ruoyi.pay.order.enums.ExamApplyStatus;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 微信一些查询参数
 */
@Data
public class WechatQueryParam {

    /**
     * 订单状态
     */
    private ExamApplyStatus[] status;

    /**
     * 开始时间
     */
    private LocalDateTime startTime;

    /**
     * 结束时间
     */
    private LocalDateTime endTime;

    /**
     * 是否查询分账
     */
    private boolean sharing;

}
