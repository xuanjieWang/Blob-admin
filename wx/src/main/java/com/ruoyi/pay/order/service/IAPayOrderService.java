//package com.ruoyi.pay.order.service;
//
//import com.baomidou.mybatisplus.core.metadata.IPage;
//import com.baomidou.mybatisplus.extension.service.IService;
//import com.ruoyi.pay.order.entity.APayOrder;
//import com.ruoyi.pay.order.enums.BusinessType;
//import com.ruoyi.pay.order.vo.OrderVO;
//import com.ruoyi.pay.wechat.dto.WechatQueryParam;
//
//import java.util.List;
//
///**
// * 支付订单信息 服务类
// */
//public interface IAPayOrderService extends IService<APayOrder> {
//
//    /**
//     * 新增
//     */
//    APayOrder create(APayOrder payOrder);
//
//    /**
//     * 分页查询
//     */
//    IPage<APayOrder> queryList(APayOrder payOrder);
//
//    /**
//     * 订单号查询
//     */
//    APayOrder getByOrderNo(String orderNo);
//
//
//    List<OrderVO> getUserOrderList(String UserId, BusinessType type);
//
//    /**
//     * 获取当前日期以及前一天的支付订单
//     * 条件：订单状态，是否分账，分账状态，业务来源等
//     */
//    List<APayOrder> queryByCondition(WechatQueryParam param);
//}
