package com.ruoyi.pay.wechat.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.pay.wechat.entity.AWechatBill;

import java.util.List;

/**
 * 微信账单 服务类
 */
public interface WechatBillService extends IService<AWechatBill> {

    /**
     * 按日期保存对账单
     */
    void saveByDate(List<AWechatBill> bills, String date);

}
