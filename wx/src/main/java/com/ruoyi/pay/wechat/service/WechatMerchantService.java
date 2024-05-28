package com.ruoyi.pay.wechat.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.pay.wechat.entity.AWechatMerchant;

/**
 * 微信支付商户管理 服务类
 */
public interface WechatMerchantService extends IService<AWechatMerchant> {

    /**
     * 新增商户
     */
    AWechatMerchant create(AWechatMerchant merchant);


    /**
     * 商户查询
     */
    AWechatMerchant queryBy(String mchId);

    /**
     * 逻辑删除商户
     */
    boolean delete(String id) throws Exception;

    /**
     * 更新商户
     */
    boolean updateBy(AWechatMerchant merchant) throws Exception;


}
