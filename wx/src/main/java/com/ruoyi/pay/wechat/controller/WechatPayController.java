//package com.ruoyi.pay.wechat.controller;
//
//import com.ruoyi.common.core.controller.BaseController;
//import com.ruoyi.common.core.domain.AjaxResult;
//import com.ruoyi.common.utils.ServletUtils;
//import com.ruoyi.pay.QcCodeController;
//import com.ruoyi.pay.order.enums.WechatConfig;
//import com.ruoyi.pay.wechat.dto.WechatPayParam;
//import com.ruoyi.pay.wechat.service.WechatPayService;
//import com.wechat.pay.contrib.apache.httpclient.auth.Verifier;
//import com.wechat.pay.contrib.apache.httpclient.notification.Notification;
//import com.wechat.pay.contrib.apache.httpclient.notification.NotificationHandler;
//import com.wechat.pay.contrib.apache.httpclient.notification.NotificationRequest;
//import io.swagger.annotations.Api;
//import io.swagger.annotations.ApiOperation;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.validation.annotation.Validated;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.nio.charset.StandardCharsets;
//
//@Api(tags = "微信支付API")
//@Slf4j
//@RestController
//@RequestMapping("/mini/pay")
//public class WechatPayController extends BaseController {
//
//    @Autowired
//    private WechatPayService wechatPayService;
//    @Autowired
//    private WechatConfig wechatConfig;
//
//    @ApiOperation("小程序服务商JSAPI下单支付")
//    @PostMapping("/unifiedOrder")
//    public AjaxResult unifiedOrder(@RequestBody @Validated WechatPayParam payParam) {
//        try {
//            log.info("下单请求参数: {}", payParam);
////            AUser user = currentMiniUser();
////            if (StringUtils.isEmpty(payParam.getUserId())) {
////                payParam.setUserId(user.getUserId());
////            }
//            return AjaxResult.success(wechatPayService.unifiedOrder(payParam));
//        } catch (Exception e) {
//            log.error("发起支付失败: {}", e.getMessage());
//            return AjaxResult.error("发起支付失败");
//        }
//    }
//
//    @ApiOperation("服务商Native下单支付")
//    @PostMapping("/unifiedNativeOrder")
//    public void unifiedNativeOrder(WechatPayParam payParam, HttpServletResponse response) {
//        try {
//            log.info("下单请求参数: {}", payParam);
////            AUser user = currentMiniUser();
////            if (StringUtils.isEmpty(payParam.getUserId())) {
////                payParam.setUserId(user.getUserId());
////            }
//            String codeUrl = wechatPayService.unifiedNativeOrder(payParam);
//            QcCodeController.qrCode(response, codeUrl, null, null);
////            return AjaxResult.success(wechatPayService.unifiedNativeOrder(payParam));
//        } catch (Exception e) {
//            log.error("发起支付失败: {}", e.getMessage());
////            return AjaxResult.error("发起支付失败");
//        }
//    }
//
//    @ApiOperation("微信支付回调")
//    @PostMapping("/notification")
//    public AjaxResult handlePayNotification(@RequestBody String body) {
//
//        try {
//            HttpServletRequest httpRequest = ServletUtils.getRequest();
//
//            String requestId = httpRequest.getHeader("Request-ID");
//            String nonce = httpRequest.getHeader("Wechatpay-Nonce");
//            String signature = httpRequest.getHeader("Wechatpay-Signature");
//            String serial = httpRequest.getHeader("Wechatpay-Serial");
//            String timestamp = httpRequest.getHeader("Wechatpay-Timestamp");
//
//            NotificationRequest request = new NotificationRequest.Builder()
//                    .withBody(body)
//                    .withNonce(nonce)
//                    .withSerialNumber(serial)
//                    .withSignature(signature)
//                    .withTimestamp(timestamp)
//                    .build();
//
//            Verifier verifier = wechatPayService.getCertificate();
//            NotificationHandler handler = new NotificationHandler(verifier,
//                    wechatConfig.getApiV3Key().getBytes(StandardCharsets.UTF_8));
//            Notification notification = handler.parse(request);
//            log.info("接收微信回调信息：{}", notification);
//            wechatPayService.handlePayNotification(notification);
//        } catch (Exception e) {
//            log.error("接收微信回调失败: {}", e.getMessage());
//        }
//
//        return AjaxResult.success();
//    }
//
////    //分润测试
////    @GetMapping("/profitSharing")
////    public AjaxResult profitSharing(@Param("Transaction_id") String Transaction_id, @Param("Out_order_no") String Out_order_no) throws Exception {
////
////        SharingDto parm = new SharingDto();
////
////        parm.setTransaction_id(Transaction_id);
////        parm.setOut_order_no(Out_order_no);
////
////        profitSharingService.profitSharing(parm);
////
////        return AjaxResult.success(1);
////
////    }
////
////
////    //单笔订单查询
////    @GetMapping("/queryTradeNo")
////    public AjaxResult queryTradeNo(@Param("out_trade_no") String out_trade_no) throws Exception {
////
////        String result = queryPayService.queryTradeNo(out_trade_no);
////        return AjaxResult.success(result);
////
////    }
//
//
//}
