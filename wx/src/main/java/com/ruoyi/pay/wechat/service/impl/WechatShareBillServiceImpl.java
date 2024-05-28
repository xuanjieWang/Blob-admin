package com.ruoyi.pay.wechat.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.pay.wechat.entity.AWechatShareBill;
import com.ruoyi.pay.wechat.mapper.AWechatShareBillMapper;
import com.ruoyi.pay.wechat.service.WechatShareBillService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 * 微信账单 服务实现类
 */
@Service
public class WechatShareBillServiceImpl extends ServiceImpl<AWechatShareBillMapper, AWechatShareBill> implements WechatShareBillService {

    @Autowired
    private AWechatShareBillMapper shareBillMapper;

    @Override
    public void saveByDate(List<AWechatShareBill> bills, String date) {

        LocalDate dateTime;
        if (StringUtils.isNotEmpty(date)) {
            dateTime = LocalDate.parse(date, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        } else {
            dateTime = LocalDate.now();
        }

        LocalDateTime startDate = dateTime.atTime(LocalTime.MIN);
        LocalDateTime endDate = dateTime.atTime(LocalTime.MAX);

        LambdaQueryWrapper<AWechatShareBill> query = Wrappers.lambdaQuery();
        query.between(AWechatShareBill::getShareDate, startDate, endDate);
        shareBillMapper.delete(query);
        this.saveBatch(bills);

    }
}
