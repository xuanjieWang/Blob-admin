//package com.ruoyi.pay.order.service.impl;
//
//import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
//import com.baomidou.mybatisplus.core.metadata.IPage;
//import com.baomidou.mybatisplus.core.toolkit.Wrappers;
//import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
//import com.ruoyi.common.enums.BusinessType;
//import com.ruoyi.pay.order.entity.APayOrder;
//import com.ruoyi.pay.order.mapper.APayOrderMapper;
//import com.ruoyi.pay.order.service.IAPayOrderService;
//import com.ruoyi.pay.order.vo.OrderVO;
//import com.ruoyi.pay.wechat.dto.WechatQueryParam;
//import org.springframework.stereotype.Service;
//
//import java.util.ArrayList;
//import java.util.List;
//import java.util.stream.Collectors;
//
///**
// * 支付订单信息 服务实现类
// */
//@Service
//public class APayOrderServiceImpl
//        extends ServiceImpl<APayOrderMapper, APayOrder>
//        implements IAPayOrderService {
////
////    @Autowired
////    private APayOrderMapper payOrderMapper;
////    @Autowired
////    private IAPeixunApplyService peixunApplyService;
////    @Autowired
////    private IARestudyRecordService restudyRecordService;
////    @Autowired
////    private IAExamApplyService examApplyService;
//
//    @Override
//    public APayOrder create(APayOrder payOrder) {
//
////        payOrder.setId(UUID.randomUUID().toString());
////        payOrder.setStatus(PaymentStatus.CREATE);
////        payOrder.setDelFlag(YesOrNo.NO);
////        payOrder.setCreateTime(LocalDateTime.now());
////        this.save(payOrder);
////        return payOrder;
//        return null;
//    }
//
//    @Override
//    public IPage<APayOrder> queryList(APayOrder payOrder) {
//
////        LambdaQueryWrapper<APayOrder> lqw = Wrappers.lambdaQuery();
////        if (StringUtils.isNotBlank(payOrder.getOrderNo())) {
////            lqw.eq(APayOrder::getOrderNo, payOrder.getOrderNo());
////        }
////        if (payOrder.getBusinessType() != null) {
////            lqw.eq(APayOrder::getBusinessType, payOrder.getBusinessType());
////        }
////        if (StringUtils.isNotBlank(payOrder.getApplyInfo())) {
////            lqw.eq(APayOrder::getApplyInfo, payOrder.getApplyInfo());
////        }
////        if (payOrder.getStatus() != null) {
////            lqw.eq(APayOrder::getStatus, payOrder.getStatus());
////        }
////        if (StringUtils.isNotBlank(payOrder.getSubMchId())) {
////            lqw.eq(APayOrder::getSubMchId, payOrder.getSubMchId());
////        }
////        if (StringUtils.isNotBlank(payOrder.getFlowNumber())) {
////            lqw.eq(APayOrder::getFlowNumber, payOrder.getFlowNumber());
////        }
////        if (payOrder.getStartDate() != null && payOrder.getEndDate() != null) {
////            lqw.between(APayOrder::getCreateTime, payOrder.getStartDate(), payOrder.getEndDate());
////        }
////
////        lqw.eq(APayOrder::getDelFlag, YesOrNo.NO);
////        lqw.orderByDesc(APayOrder::getCreateTime);
////
////        Page<APayOrder> page = new Page<>(payOrder.getPageNum(), payOrder.getPageSize());
////        IPage<APayOrder> iPage = payOrderMapper.selectPage(page, lqw);
////        return iPage;
//        return null;
//    }
//
//    @Override
//    public APayOrder getByOrderNo(String orderNo) {
//
//        return this.lambdaQuery()
//                .eq(APayOrder::getOrderNo, orderNo)
//                .one();
//    }
//
//    @Override
//    public List<OrderVO> getUserOrderList(String userId, BusinessType type) {
//        LambdaQueryWrapper<APayOrder> lqw = Wrappers.lambdaQuery();
//        lqw.eq(APayOrder::getUserId, userId);
//        lqw.eq(APayOrder::getBusinessType, type);
//        List<APayOrder> list = this.list(lqw);
//
//        List<OrderVO> listvo = new ArrayList<>();
//        if (list.size() > 0) {
//            listvo = list.stream()
//                    .map(payOrder -> payOrderToOrderVO(payOrder, type))
//                    .collect(Collectors.toList());
//        }
//
//        return listvo;
//    }
//
//    @Override
//    public List<APayOrder> queryByCondition(WechatQueryParam param) {
//
////        LambdaQueryWrapper<APayOrder> lqw = Wrappers.lambdaQuery();
////        if (StringUtils.isNotEmpty(param.getStatus())) {
////            lqw.in(APayOrder::getStatus, Arrays.asList(param.getStatus()));
////        }
////        if (param.getStartTime() != null || param.getEndTime() != null) {
////            lqw.between(APayOrder::getCreateTime, param.getStartTime(), param.getEndTime());
////        }
////        if (param.isSharing()) {
////            lqw.eq(APayOrder::getProfitShare, YesOrNo.YES);
////        }
////        return payOrderMapper.selectList(lqw);
//        return null;
//    }
//
//    private OrderVO payOrderToOrderVO(APayOrder payOrder, BusinessType type) {
////        OrderVO orderVO = new OrderVO();
////        String businessId = payOrder.getBusinessId();
////        orderVO.setAmount(payOrder.getPaidAmount().toString());
////        orderVO.setDatetime(payOrder.getCreateTime());
////        orderVO.setResult(StringUtils.isEmpty(payOrder.getTradeState()) ? payOrder.getTradeState() : "FAIL");
////        if (type == BusinessType.QC) {
////            // 考前培训
////            APeixunApply apply = peixunApplyService.lambdaQuery()
////                    .eq(APeixunApply::getId, businessId)
////                    .select(APeixunApply::getApplyInfo)
////                    .one();
////            orderVO.setApplyInfo(apply.getApplyInfo());
////
////        } else if (type == BusinessType.CE) {
////            // 继续教育
////            ARestudyRecord record = restudyRecordService.lambdaQuery()
////                    .eq(ARestudyRecord::getId, businessId)
////                    .select(ARestudyRecord::getApplyInfo)
////                    .one();
////            orderVO.setApplyInfo(record.getApplyInfo());
////
////        } else if (type == BusinessType.EXAM) {
////            // 考试报名
////            AExamApply apply = examApplyService.lambdaQuery()
////                    .eq(AExamApply::getId, businessId)
////                    .select(AExamApply::getApplyInfo)
////                    .one();
////            orderVO.setApplyInfo(apply.getApplyInfo());
////        }
//
////        return orderVO;
//        return null;
//    }
//
//}
