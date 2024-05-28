package com.ruoyi.pay.share.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.pay.order.enums.YesOrNo;
import com.ruoyi.pay.share.entity.AWechatShareRule;
import com.ruoyi.pay.share.mapper.AWechatShareRuleMapper;
import com.ruoyi.pay.share.service.IWechatShareRuleService;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

/**
 * 分润规则表 服务实现类
 */
@Service
public class WechatShareRuleServiceImpl extends ServiceImpl<AWechatShareRuleMapper, AWechatShareRule> implements IWechatShareRuleService {

    @Override
    public AWechatShareRule create(AWechatShareRule rule) throws Exception {

//        rule.setId(UUID.randomUUID().toString());
        rule.setCreateTime(LocalDateTime.now());
        rule.setDeleted(YesOrNo.NO);
        this.save(rule);
        return rule;
    }

    @Override
    public AWechatShareRule queryByMchId(String payMchId) throws Exception {

        AWechatShareRule shareRule = this.lambdaQuery()
                .eq(AWechatShareRule::getPayMchId, payMchId)
                .one();
        return shareRule;
    }

    @Override
    public boolean updateRule(AWechatShareRule rule) throws Exception {

        return this.updateById(rule);
    }
}
