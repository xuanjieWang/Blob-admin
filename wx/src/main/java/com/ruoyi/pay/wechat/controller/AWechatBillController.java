//package com.ruoyi.pay.wechat.controller;
//
//import com.ruoyi.common.core.domain.AjaxResult;
//import com.ruoyi.pay.wechat.dto.WechatJsapiTradeBillRequest;
//import com.ruoyi.pay.wechat.entity.AWechatBill;
//import com.ruoyi.pay.wechat.service.WechatBillService;
//import com.ruoyi.pay.wechat.service.WechatPayService;
//import io.swagger.annotations.Api;
//import io.swagger.annotations.ApiOperation;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
//
//import java.time.LocalDate;
//import java.time.format.DateTimeFormatter;
//import java.util.List;
//import java.util.concurrent.ExecutionException;
//import java.util.concurrent.ExecutorService;
//import java.util.concurrent.Executors;
//import java.util.concurrent.Future;
//
///**
// * 微信账单 前端控制器
// */
//@Api(tags = "微信账单下载API")
//@Slf4j
//@RestController
//@RequestMapping("/pay/wechat/bill")
//public class AWechatBillController {
//
////    @Autowired
////    private WechatPayService payService;
//    @Autowired
//    private WechatBillService billService;
//
//    private ExecutorService executor = Executors.newFixedThreadPool(10);
//
//    @ApiOperation("下载微信账单")
//    @PostMapping("/download")
//    public AjaxResult download(@RequestParam String startDate,
//                               @RequestParam String endDate) {
//        try {
//            String tarType = "GZIP";
//            LocalDate today = LocalDate.now();
//
//            Future future = executor.submit(() -> {
//                LocalDate start = LocalDate.parse(startDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
//                LocalDate end = LocalDate.parse(endDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
//                while (start.isBefore(end) && start.compareTo(today) <= 0) {
//                    WechatJsapiTradeBillRequest request = new WechatJsapiTradeBillRequest();
//                    request.setBillDate(start.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
//                    log.info("账单请求日期: {}", startDate);
//                    String downloadUrl = null;
//                    try {
//                        downloadUrl = payService.getJsapiTradeBill(request);
//                    } catch (Exception e) {
//                        log.error("获取账单下载地址失败: {}", e.getMessage());
//                    }
//                    List<AWechatBill> bills = payService.getBill(downloadUrl, tarType);
//                    if (bills != null && bills.size() > 0) {
//                        billService.saveByDate(bills, start.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
//                        bills.clear();
//                    }
//                    //下一天
//                    start = start.plusDays(1);
//                }
//            });
//            try {
//                future.get();
//            } catch (InterruptedException | ExecutionException e) {
//                log.error("执行下载微信账单错误");
//            }
//            return AjaxResult.success("执行中……");
//        } catch (Exception e) {
//            log.error("执行下载微信账单失败: {}", e.getMessage());
//            return AjaxResult.error("下载失败");
//        }
//    }
//
//}
