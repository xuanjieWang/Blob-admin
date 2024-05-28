package com.ruoyi.pay.order.controller;//package com.belong.pay.controller;
//
//
//import cn.hutool.http.ContentType;
//import cn.hutool.json.JSONUtil;
//import com.alibaba.fastjson.JSONObject;
//import com.belong.common.core.domain.AjaxResult;
//import com.belong.pay.dto.SharingDto;
//import com.belong.pay.service.CertificatesManagerService;
//import com.belong.pay.service.NotificationService;
//import com.belong.pay.service.PrePayService;
//import com.belong.pay.service.ProfitSharingService;
//import com.wechat.pay.contrib.apache.httpclient.notification.Notification;
//import io.lettuce.core.dynamic.annotation.Param;
//
//import lombok.extern.slf4j.Slf4j;
//import org.junit.Assert;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.*;
//
//import javax.servlet.ServletInputStream;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.BufferedReader;
//import java.io.IOException;
//import java.io.InputStreamReader;
//import java.nio.charset.StandardCharsets;
//import java.util.HashMap;
//import java.util.Map;
//
//@Slf4j
//@RestController
//@RequestMapping("/backend/pay")
//public class BackEndPayController {
//
//    @Autowired
//    NotificationService notificationService;
//    @Autowired
//    ProfitSharingService profitSharingService;
//
//
//    //批量下载订单并对账
//    @GetMapping("/billdownload")
//    public AjaxResult billdownload() throws Exception {
//        return AjaxResult.success(1);
//    }
//
//    /**
//     * 微信支付成功后.异步请求该接口
//     * @param request
//     * @return
//     * @throws IOException
//     */
//    @PostMapping(value="/notification")
//    @ResponseBody
//    public void weChatNotifyUrl(HttpServletRequest request, HttpServletResponse response) throws Exception {
//
//       // log.info("微信支付回调: {}",jsonString);
//
//        String body = getRequestBody(request);
//
//        String nonceStr = request.getHeader("Wechatpay-Nonce");
//        String signature = request.getHeader("Wechatpay-Signature");
//        String serialNo = request.getHeader("Wechatpay-Serial");
//        String timestamp = request.getHeader("Wechatpay-Timestamp");
//
//        //验签数据是否来自微信支付的返回
//        Notification notification = notificationService.ChecknotificationHandler(serialNo,nonceStr,timestamp,signature,body);
//        Assert.assertNotNull(notification);
//
//        //应答
//        Map<String, String> map = new HashMap<>(12);
//
//        response.setStatus(200);
//        map.put("code", "SUCCESS");
//        map.put("message", "SUCCESS");
//        response.setHeader("Content-type", ContentType.JSON.toString());
//        response.getOutputStream().write(JSONUtil.toJsonStr(map).getBytes(StandardCharsets.UTF_8));
//        response.flushBuffer();
//
//        //分润
//        String notfi =  notification.getDecryptData();
//
//        JSONObject jso = JSONObject.parseObject(notfi);
//        String out_trade_no = jso.getString("out_trade_no");
//        String transaction_id = jso.getString("transaction_id");
//
//        SharingDto parm = new SharingDto();
//        parm.setTransaction_id(transaction_id);
//        parm.setOut_order_no(out_trade_no);
//        profitSharingService.profitSharing(parm);
//
//
//
//
//    }
//
//    /**
//     * 读取请求数据流
//     *
//     * @param request
//     * @return
//     */
//    private String getRequestBody(HttpServletRequest request) {
//
//        StringBuffer sb = new StringBuffer();
//
//        try (ServletInputStream inputStream = request.getInputStream();
//             BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
//        ) {
//            String line;
//
//            while ((line = reader.readLine()) != null) {
//                sb.append(line);
//            }
//
//        } catch (IOException e) {
//            log.error("读取数据流异常:{}", e);
//        }
//
//        return sb.toString();
//
//    }
//
//
//
//
//}
