//package com.ruoyi.pay.wechat;
//
//import com.ruoyi.pay.order.entity.APayOrder;
//import com.ruoyi.pay.order.enums.BusinessType;
//import com.ruoyi.pay.wechat.listener.WechatPayListener;
//import com.wechat.pay.contrib.apache.httpclient.exception.WechatPayException;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import java.time.LocalDateTime;
//
///**
// * 支付监听处理
// */
//@Slf4j
//@Service
//public class wechatPayListener implements WechatPayListener {
//
//    @Autowired
//    private IAPeixunApplyService peixunApplyService;
//    @Autowired
//    private IAExamApplyService examApplyService;
//    @Autowired
//    private IARestudyRecordService restudyRecordService;
//
//    @Override
//    public void afterPaid(APayOrder payOrder) throws WechatPayException {
//
//        BusinessType businessType = payOrder.getBusinessType();
//        if (BusinessType.QC == businessType) {
//            processQC(payOrder);
//        } else if (BusinessType.CE == businessType) {
//            processCE(payOrder);
//        } else if (BusinessType.EXAM == businessType) {
////            processExam(payOrder);
//        } else {
//            log.error("未知业务类型");
//        }
//    }
//
//    private void processQC(APayOrder payOrder) {
//
//        APeixunApply apply = peixunApplyService.getById(payOrder.getBusinessId());
////        if (apply != null && (apply.getStatus() == PeixunApplyStatus.CONFIRM)) {
////            apply.setPayOrder(payOrder.getOrderNo());
//////            apply.setStatus(PeixunApplyStatus.PAID_SUCCESS);
////            apply.setUpdateTime(LocalDateTime.now());
////            peixunApplyService.updateStatusToPaidSuccess(apply);
////        }
//        // TODO 可以log非PASS情况下的状态，可直接抛出异常
//    }
//
//    private void processCE(APayOrder payOrder) {
//
//        ARestudyRecord record = restudyRecordService.getById(payOrder.getBusinessId());
//        if (record != null && record.getStatus() == RestudyStatus.CREATE) {
//            record.setPayOrder(payOrder.getOrderNo());
//            record.setStatus(RestudyStatus.PAID_SUCCESS);
//            record.setUpdateTime(LocalDateTime.now());
//            restudyRecordService.updateById(record);
//        }
//
//    }
//
////    private void processExam(APayOrder payOrder) {
////
////        AExamApply apply = examApplyService.getById(payOrder.getBusinessId());
////        if (apply != null && apply.getStatus() == ExamApplyStatus.SIGNUPED) {
////
////            examApplyService.update(new UpdateWrapper<AExamApply>()
////                    .eq("id",apply.getId())
////                    .set("status",ExamApplyStatus.EXAM_PAID_SUCCESS.toString())
////                    .set("pay_order",payOrder.getOrderNo())
////            );
////
//////            apply.setPayOrder(payOrder.getOrderNo());
//////            apply.setStatus(ExamApplyStatus.EXAM_PAID_SUCCESS);
//////            apply.setUpdateTime(LocalDateTime.now());
//////            examApplyService.updateById(apply);
////        }
////    }
//
//}
