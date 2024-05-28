package com.ruoyi.pay.wechat.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.pay.wechat.entity.AWechatShareBill;

import java.util.List;

/**
 * 微信账单 服务类
 */
public interface WechatShareBillService extends IService<AWechatShareBill> {

    /**
     * 按日期保存对账单
     */
    void saveByDate(List<AWechatShareBill> bills, String date);

}
