package com.ruoyi.pay.share.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.pay.share.entity.AWechatShareRule;

/**
 * 分润规则表 服务类
 * 支付特约商户号可能存在多种场景值下对应不同的分账规则，故预留业务类型businessItem做扩展
 * 前期按照一个支付特约商户一种分账规则来处理
 */
public interface IWechatShareRuleService extends IService<AWechatShareRule> {

    /**
     * 新增规则
     */
    AWechatShareRule create(AWechatShareRule rule) throws Exception;

    /**
     * 查询规则
     */
    AWechatShareRule queryByMchId(String payMchId) throws Exception;

    /**
     * 更新规则
     */
    boolean updateRule(AWechatShareRule rule) throws Exception;

}
