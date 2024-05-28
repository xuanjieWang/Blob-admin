package com.ruoyi.pay.wechat.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.pay.order.enums.UUID;
import com.ruoyi.pay.order.enums.YesOrNo;
import com.ruoyi.pay.wechat.entity.AWechatMerchant;
import com.ruoyi.pay.wechat.mapper.AWechatMerchantMapper;
import com.ruoyi.pay.wechat.service.WechatMerchantService;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

/**
 * 微信支付商户管理 服务实现类
 */
@Service
public class WechatMerchantServiceImpl
        extends ServiceImpl<AWechatMerchantMapper, AWechatMerchant>
        implements WechatMerchantService {

    @Override
    public AWechatMerchant create(AWechatMerchant merchant) {

        AWechatMerchant wechatMerchant = this.queryBy(merchant.getMchId());
        if (wechatMerchant == null) {
            merchant.setId(UUID.randomUUID().toString());
            merchant.setCreateTime(LocalDateTime.now());
            this.save(merchant);
        }
        return merchant;
    }

    @Override
    public AWechatMerchant queryBy(String mchId) {

        return this.lambdaQuery()
                .eq(AWechatMerchant::getMchId, mchId)
                .one();
    }

    @Override
    public boolean delete(String id) throws Exception {

        AWechatMerchant merchant = this.getById(id);
        merchant.setDeleted(YesOrNo.YES);
        return this.updateById(merchant);
    }

    @Override
    public boolean updateBy(AWechatMerchant merchant) throws Exception {

        return this.updateById(merchant);
    }
}
