//package com.ruoyi.pay.wechat.service.impl;
//
//
//import com.alibaba.fastjson2.JSONObject;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.fasterxml.jackson.databind.node.ObjectNode;
//import com.ruoyi.pay.TradeHelper;
//import com.ruoyi.pay.order.entity.APayOrder;
//import com.ruoyi.pay.order.enums.PaymentStatus;
//import com.ruoyi.pay.order.enums.YesOrNo;
//import com.ruoyi.pay.share.service.IWechatShareRuleService;
//import com.ruoyi.pay.wechat.dto.*;
//import com.ruoyi.pay.wechat.entity.AWechatBill;
//import com.ruoyi.pay.wechat.entity.AWechatShareBill;
//import com.ruoyi.pay.wechat.listener.WechatPayListener;
//import com.ruoyi.pay.wechat.service.WechatPayService;
//import com.wechat.pay.contrib.apache.httpclient.auth.Verifier;
//import com.wechat.pay.contrib.apache.httpclient.notification.Notification;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import java.time.LocalDateTime;
//import java.util.List;
//
///**
// * 微信支付业务实现
// */
//@Slf4j
//@Service
//public class WechatPayServiceImpl implements WechatPayService {
//
//    //    @Autowired
////    private WechatConfig wechatConfig;
////    @Autowired
////    private IAPayOrderService payOrderService;
//    @Autowired
//    private List<WechatPayListener> listeners;
//    @Autowired
//    private IWechatShareRuleService shareRuleService;
//
//    public WechatPayServiceImpl(List<WechatPayListener> listeners) {
//        this.listeners = listeners;
//    }
//
//    @Override
//    public WechatUnifiedOrderResponse unifiedOrder(WechatPayParam payParam)
//            throws Exception {
//
//        processBeforeUnifiedOrder();
//        String orderNo = TradeHelper.generateTradeId();
//        String mchId;
//        String shareRuleId = null;
////        if (payParam.getBusiness() == BusinessType.QC) {
////            payParam.setProfitShare(true);
////            APeixunApply peixunApply = peixunApplyService.getById(payParam.getBusinessId());
////            if (peixunApply == null)
////                throw new Exception("未找到对应的培训申请");
////            ADriverSchool school = schoolService.getById(peixunApply.getSchoolId());
////            if (school == null)
////                throw new Exception("未找到对应的驾校信息");
////            mchId = school.getMchId();
////            if (StringUtils.isEmpty(mchId))
////                throw new Exception("未找到驾校商户号配置");
////            AWechatShareRule rule = shareRuleService.queryByMchId(mchId);
////            shareRuleId = rule.getId();
////            if (StringUtils.isEmpty(shareRuleId))
////                throw new Exception("未找到驾校支付配置参数");
////        } else if (payParam.getBusiness() == BusinessType.EXAM) {
////            mchId = wechatConfig.getNonTaxMchId();
////            if (StringUtils.isEmpty(mchId))
////                throw new Exception("未找到考试支付参数配置");
////        } else if (payParam.getBusiness() == BusinessType.CE) {
////            // TODO 继续再教育功能阉割，暂时没有在此处处理
////            throw new Exception("暂不支持该业务");
////        } else {
////            throw new Exception("未知业务，请核对参数信息");
////        }
//
////        String requestData = composeUnifiedOrder(payParam, orderNo, mchId);
////        log.info("支付下单请求: {}", requestData);
////        Verifier verifier = this.getCertificate();
////        String response = WechatPayHelper.doPostRequest(WechatPayConstants.MINI_JSAPI_URL,
////                requestData, verifier, wechatConfig);
////        log.info("支付下单请求响应: {}", response);
//
////        JSONObject resObj = JSONObject.parseObject(response);
////        String prepayId = resObj.getString("prepay_id");
////        WechatUnifiedOrderResponse orderResponse = composeResponse(prepayId);
////        // 记录支付订单
////        addPayOrder(payParam, orderResponse, orderNo, mchId, shareRuleId);
//
////        return orderResponse;
//        return null;
//    }
//
//    @Override
//    public String unifiedH5Order(WechatPayParam payParam) throws Exception {
//
////        processBeforeUnifiedOrder();
////        String orderNo = TradeHelper.generateTradeId();
////        String mchId;
////        String shareRuleId = null;
////        if (payParam.getBusiness() == BusinessType.QC) {
////            payParam.setProfitShare(true);
////            APeixunApply peixunApply = peixunApplyService.getById(payParam.getBusinessId());
////            if (peixunApply == null)
////                throw new Exception("未找到对应的培训申请");
////            ADriverSchool school = schoolService.getById(peixunApply.getSchoolId());
////            if (school == null)
////                throw new Exception("未找到对应的驾校信息");
////            mchId = school.getMchId();
////            if (StringUtils.isEmpty(mchId))
////                throw new Exception("未找到驾校商户号配置");
////            AWechatShareRule rule = shareRuleService.queryByMchId(mchId);
////            shareRuleId = rule.getId();
////            if (StringUtils.isEmpty(shareRuleId))
////                throw new Exception("未找到驾校支付配置参数");
////        } else if (payParam.getBusiness() == BusinessType.EXAM) {
////            mchId = wechatConfig.getNonTaxMchId();
////            if (StringUtils.isEmpty(mchId))
////                throw new Exception("未找到考试支付参数配置");
////        } else if (payParam.getBusiness() == BusinessType.CE) {
////            // TODO 继续再教育功能阉割，暂时没有在此处处理
////            throw new Exception("暂不支持该业务");
////        } else {
////            throw new Exception("未知业务，请核对参数信息");
////        }
////
////        String requestData = composeH5UnifiedOrder(payParam, orderNo, mchId);
////        log.info("支付下单请求: {}", requestData);
////        Verifier verifier = this.getCertificate();
////        String response = WechatPayHelper.doPostRequest(WechatPayConstants.H5_PAY_URL,
////                requestData, verifier, wechatConfig);
////        log.info("支付下单请求响应: {}", response);
////
////        JSONObject resObj = JSONObject.parseObject(response);
////        String h5Url = resObj.getString("h5_url");
////        // 记录支付订单
////        addPayOrder(payParam, new WechatUnifiedOrderResponse(), orderNo, mchId, shareRuleId);
////
////        return h5Url;
//        return null;
//    }
//
//    @Override
//    public String unifiedNativeOrder(WechatPayParam payParam)
//            throws Exception {
//
//        processBeforeUnifiedOrder();
//        String orderNo = TradeHelper.generateTradeId();
//        String requestData = composeNativeUnifiedOrder(payParam, orderNo);
//
//        Verifier verifier = this.getCertificate();
////        String response = WechatPayHelper.doPostRequest(WechatPayConstants.WEB_NATIVE_URL,
////                requestData, verifier, wechatConfig);
////        log.info("支付下单请求响应: {}", response);
////
////        JSONObject resObj = JSONObject.parseObject(response);
////        String codeUrl = resObj.getString("code_url");
////        WechatUnifiedOrderResponse orderResponse = composeResponse(prepayId);
////        log.info("请求返回: {}", orderResponse);
////        // 记录支付订单
////        addPayOrder(payParam, orderResponse, orderNo);
//
////        return codeUrl;
//        return null;
//    }
//
//    @Override
//    public void handlePayNotification(Notification notification) throws Exception {
//
//        DecryptDataDTO dataDTO = JSONObject.parseObject(
//                notification.getDecryptData(), DecryptDataDTO.class);
//        log.info("支付结果: 订单号:{}, result: {}", dataDTO.getOutTradeNo(), dataDTO.getTradeState());
//        if ("SUCCESS".equals(dataDTO.getTradeState())) {
//            APayOrder payOrder = updatePaid(dataDTO);
//            processAfterPaid(payOrder);
//        }
//    }
//
//    @Override
//    public WechatQueryOrderResponse queryOrder(String orderNo) throws Exception {
//
////        String url = WechatPayConstants.JSAPI_QUERY_TRADE_URL;
////        url = url.replace("{" + "out_trade_no" + "}", orderNo);
////
////        Map<String, String> param = new HashMap<>();
////        param.put("sp_mchid", wechatConfig.getMchId());
////        param.put("sub_mchid", wechatConfig.getSubMchId());
////
////        Verifier verifier = this.getCertificate();
////        String response = WechatPayHelper.doGetRequest(url, param, verifier, wechatConfig);
////        WechatQueryOrderResponse query = JSONObject.parseObject(response, WechatQueryOrderResponse.class);
////        log.info("订单查询响应: {}", query);
////
////        APayOrder order = payOrderService.getByOrderNo(orderNo);
////        assert query != null;
////        if (!order.getStatus().name().equals(query.getTradeState())) {
////            order.setStatus(PaymentStatus.valueOf(query.getTradeState()));
////            order.setTradeState(query.getTradeState());
////            order.setTradeStateDesc(query.getTradeStateDesc());
////            order.setUpdateTime(LocalDateTime.now());
////            order.setUpdateBy("order check job");
////            payOrderService.updateById(order);
////        }
////        return query;
//        return null;
//    }
//
//    @Override
//    public WechatQueryOrderResponse queryOrderByTrans(String transId) throws Exception {
//
////        String url = WechatPayConstants.JSAPI_QUERY_TRANS_URL;
////        url = url.replace("{" + "transaction_id" + "}", transId);
////
////        Map<String, String> param = new HashMap<>();
////        param.put("sp_mchid", wechatConfig.getMchId());
////        param.put("sub_mchid", wechatConfig.getSubMchId());
////
////        Verifier verifier = this.getCertificate();
////        String response = WechatPayHelper.doGetRequest(url, param, verifier, wechatConfig);
////        WechatQueryOrderResponse queryOrderResponse = JSONObject.parseObject(response, WechatQueryOrderResponse.class);
////        log.info("订单查询响应: {}", queryOrderResponse);
////        return queryOrderResponse;
//        return null;
//    }
//
//    @Override
//    public void profitShare(APayOrder order) throws Exception {
//
////        if (order.getProfitShare() != YesOrNo.YES || order.getShareRuleId() == null)
////            throw new Exception("分账规则未找到！");
////        AWechatShareRule rule = shareRuleService.getById(order.getShareRuleId());
////        if (rule == null)
////            throw new Exception("分账规则未找到！");
////
////        String outOrderNo = TradeHelper.generateTradeId();
////        String requestData = composeProfitShare(order, rule.getShareRule(), outOrderNo);
////
////        Verifier verifier = this.getCertificate();
////        String response = WechatPayHelper.doPostRequest(WechatPayConstants.PROFIT_SHARE_ORDER,
////                requestData, verifier, wechatConfig);
////
////        if (response != null) {
////            WechatProfitShareResponse shareResponse = JSONObject.parseObject(response, WechatProfitShareResponse.class);
////            log.info("分账请求响应: {}", shareResponse);
////            // 请求成功或者是处理中，记录请求
////            assert shareResponse != null;
////            updateDoShare(order, shareResponse);
////        }
//    }
//
//    @Override
//    public void queryProfitShare(APayOrder payOrder) throws Exception {
//
////        String url = WechatPayConstants.QUERY_PROFIT_SHARE_ORDER;
////        url = url.replace("{" + "out_order_no" + "}", payOrder.getShareOrderNo());
////
////        Map<String, String> param = new HashMap<>();
////        param.put("sub_mchid", wechatConfig.getSubMchId());
////        param.put("transaction_id", payOrder.getFlowNumber());
////
////        Verifier verifier = this.getCertificate();
////        String response = WechatPayHelper.doGetRequest(url, param, verifier, wechatConfig);
////
////        if (response != null) {
////            WechatProfitShareResponse shareResponse = JSONObject.parseObject(response, WechatProfitShareResponse.class);
////            log.info("分账查询响应: {}", shareResponse);
////            // 请求成功或者是处理中，记录请求
////            assert shareResponse != null;
////            if (!payOrder.getShareState().equals(shareResponse.getState())) {
////                updateDoShare(payOrder, shareResponse);
////            }
////        }
//
//    }
//
//    @Override
//    public Verifier getCertificate() throws Exception {
//
////        PrivateKeySigner privateKeySigner = new PrivateKeySigner(
////                wechatConfig.getMchSerialNo(), wechatConfig.getPrivateKey());
////        // 获取证书管理器实例
////        CertificatesManager manager = CertificatesManager.getInstance();
////        // 向证书管理器增加需要自动更新平台证书的商户信息
////        manager.putMerchant(wechatConfig.getMchId(),
////                new WechatPay2Credentials(wechatConfig.getMchId(), privateKeySigner),
////                wechatConfig.getApiV3Key().getBytes(StandardCharsets.UTF_8));
////        // 从证书管理器中获取verifier
////        return manager.getVerifier(wechatConfig.getMchId());
//        return null;
//    }
//
//    @Override
//    public String getJsapiTradeBill(WechatJsapiTradeBillRequest request) throws Exception {
//
////        String url = WechatPayConstants.JSAPI_TRADE_BILL;
////
////        Map<String, String> param = new HashMap<>();
////        param.put("bill_date", request.getBillDate());
////        if (request.getSubMchId() != null) {
////            param.put("sub_mchid", request.getSubMchId());
////        }
////        if (request.getBillType() != null) {
////            param.put("bill_type", request.getBillType());
////        }
////        if (request.getTarType() != null) {
////            param.put("tar_type", request.getTarType());
////        }
////
////        Verifier verifier = this.getCertificate();
////        String response = WechatPayHelper.doGetRequest(url, param, verifier, wechatConfig);
////
////        if (response != null) {
////            WechatJsapiTradeBillResponse billResponse = JSONObject.parseObject(response, WechatJsapiTradeBillResponse.class);
////            log.info("申请交易账单请求响应: {}", billResponse);
////            return billResponse.getDownloadUrl();
////        }
//        return null;
//    }
//
//    @Override
//    public String getJsapiFlowBill(WechatJsapiFlowBillRequest request) throws Exception {
//
////        String url = WechatPayConstants.JSAPI_FLOW_BILL;
////
////        Map<String, String> param = new HashMap<>();
////        param.put("bill_date", request.getBillDate());
////        if (request.getAccountType() != null) {
////            param.put("account_type", request.getAccountType());
////        }
////        if (request.getTarType() != null) {
////            param.put("tar_type", request.getTarType());
////        }
////
////        Verifier verifier = this.getCertificate();
////        String response = WechatPayHelper.doGetRequest(url, param, verifier, wechatConfig);
////
////        if (response != null) {
////            WechatJsapiFlowBillResponse billResponse = JSONObject.parseObject(response, WechatJsapiFlowBillResponse.class);
////            log.info("申请交易账单请求响应: {}", billResponse);
////            return billResponse.getDownloadUrl();
////        }
//        return null;
//    }
//
//    @Override
//    public String getJsapiSubmerchantFlowBill(WechatJsapiSubmerchantFlowBillRequest request) throws Exception {
//
////        String url = WechatPayConstants.JSAPI_SUBMERCHANT_FLOW_BILL;
////
////        Map<String, String> param = new HashMap<>();
////        param.put("sub_mchid", request.getSubMchId());
////        param.put("bill_date", request.getBillDate());
////        param.put("account_type", request.getAccountType());
////        param.put("algorithm", request.getAlgorithm());
////        if (request.getTarType() != null) {
////            param.put("tar_type", request.getTarType());
////        }
////
////        Verifier verifier = this.getCertificate();
////        String response = WechatPayHelper.doGetRequest(url, param, verifier, wechatConfig);
////
////        if (response != null) {
////            log.info("申请子商户资金账单请求响应: {}", response);
////        }
//        return null;
//    }
//
//    @Override
//    public void getBill(String billUrl) {
//
////        if (billUrl != null) {
////            String response = WechatPayHelper.download(billUrl, wechatConfig);
////            log.info("下载账单请求响应: {}", response);
////        }
//    }
//
//    @Override
//    public List<AWechatBill> getBill(String billUrl, String tarType) {
//
////        if (billUrl != null) {
////            try {
////                List<AWechatBill> wechatBills = WechatPayHelper.getWechatBill(billUrl, wechatConfig, tarType);
////                log.info("微信交易账单: {}", wechatBills.size());
////                return wechatBills;
////            } catch (IOException | ParseException e) {
////                e.printStackTrace();
////            }
////        }
//        return null;
//    }
//
//    @Override
//    public String getProfitShareBill(WechatShareBillRequest request) throws Exception {
////
////        String url = WechatPayConstants.PROFIT_SHARE_BILL;
////
////        Map<String, String> param = new HashMap<>();
////        param.put("bill_date", request.getBillDate());
////        if (request.getSubMchId() != null) {
////            param.put("sub_mchid", request.getSubMchId());
////        }
////        if (request.getTarType() != null) {
////            param.put("tar_type", request.getTarType());
////        }
////
////        Verifier verifier = this.getCertificate();
////        String response = WechatPayHelper.doGetRequest(url, param, verifier, wechatConfig);
////
////        if (response != null) {
////            WechatJsapiTradeBillResponse billResponse = JSONObject.parseObject(response, WechatJsapiTradeBillResponse.class);
////            log.info("申请分账账单请求响应: {}", billResponse);
////            return billResponse.getDownloadUrl();
////        }
//        return null;
//    }
//
//    @Override
//    public List<AWechatShareBill> getShareBill(String billUrl, String tarType) {
//
////        if (billUrl != null) {
////            try {
////                List<AWechatShareBill> bills = WechatPayHelper.getShareBill(billUrl, wechatConfig, tarType);
////                log.info("微信分账账单: {}", bills.size());
////                return bills;
////            } catch (IOException | ParseException e) {
////                e.printStackTrace();
////            }
////        }
//        return null;
//    }
//
//    /**
//     * 构建支付下单参数
//     */
//    private String composeUnifiedOrder(WechatPayParam payParam, String orderNo, String mchId) {
//
////        ObjectMapper objectMapper = new ObjectMapper();
////        ObjectNode rootNode = objectMapper.createObjectNode();
////        rootNode.put("sp_appid", wechatConfig.getAppId())
////                .put("sp_mchid", wechatConfig.getMchId())
////                .put("sub_mchid", mchId)
////                .put("description", "mini jsapi pay order")
////                .put("out_trade_no", orderNo)
////                .put("notify_url", wechatConfig.getNotifyUrl());
////        rootNode.putObject("amount")
////                .put("total", payParam.getPaidAmount().multiply(new BigDecimal(100)).intValue());
////        rootNode.putObject("settle_info")
////                .put("profit_sharing", payParam.isProfitShare());
////        rootNode.putObject("payer")
////                .put("sp_openid", payParam.getOpenId());
////
////        return rootNode.toString();
//        return null;
//    }
//
//    /**
//     * 构建支付下单参数
//     */
//    private String composeNativeUnifiedOrder(WechatPayParam payParam, String orderNo) {
//
////        ObjectMapper objectMapper = new ObjectMapper();
////        ObjectNode rootNode = objectMapper.createObjectNode();
////        rootNode.put("sp_appid", wechatConfig.getAppId())
////                .put("sp_mchid", wechatConfig.getMchId())
////                .put("sub_mchid", wechatConfig.getSubMchId())
////                .put("description", "mini jsapi pay order")
////                .put("out_trade_no", orderNo)
////                .put("notify_url", wechatConfig.getNotifyUrl());
////        rootNode.putObject("amount")
////                .put("total", payParam.getPaidAmount().multiply(new BigDecimal(100)));
////        rootNode.putObject("settle_info")
////                .put("profit_sharing", true);
////
////        return rootNode.toString();
//        return null;
//    }
//
//    /**
//     * 构建支付下单参数
//     */
//    private String composeH5UnifiedOrder(WechatPayParam payParam, String orderNo, String mchId) {
////
////        ObjectMapper objectMapper = new ObjectMapper();
////        ObjectNode rootNode = objectMapper.createObjectNode();
////        rootNode.put("sp_appid", wechatConfig.getAppId())
////                .put("sp_mchid", wechatConfig.getMchId())
////                .put("sub_mchid", mchId)
////                .put("description", "H5 pay order")
////                .put("out_trade_no", orderNo)
////                .put("notify_url", wechatConfig.getNotifyUrl());
////        rootNode.putObject("amount")
////                .put("total", payParam.getPaidAmount().multiply(new BigDecimal(100)).intValue());
////        rootNode.putObject("settle_info")
////                .put("profit_sharing", payParam.isProfitShare());
////        rootNode.putObject("scene_info")
////                .put("payer_client_ip", payParam.getIpAddress())
////                .putObject("h5_info").put("type", payParam.getSceneType());
////
////        return rootNode.toString();
//        return null;
//    }
//
//    /**
//     * 构建分账参数
//     */
//    private String composeProfitShare(APayOrder order, String shareRule, String outOrderNo) {
//
////        // 获取分账规则
////        List<ShareRuleDto> dtos = JSONArray.parseArray(shareRule, ShareRuleDto.class);
////
////        ObjectMapper objectMapper = new ObjectMapper();
////        ObjectNode node = objectMapper.createObjectNode();
////        ArrayNode arrayNode = objectMapper.createArrayNode();
////
////        node.put("sub_mchid", wechatConfig.getSubMchId()) //子商户号
////                .put("appid", wechatConfig.getAppId()) //appid
////                .put("transaction_id", order.getFlowNumber()) //支付流水号
////                .put("out_order_no", outOrderNo); //out_trade_no
////
////        for (ShareRuleDto rule : dtos) {
////            ObjectNode ruleNode = objectMapper.createObjectNode();
////            ruleNode.put("type", rule.getType())
////                    .put("account", rule.getAccount())
////                    .put("amount", rule.getAmount())
////                    .put("description", rule.getDescription());
////            arrayNode.add(ruleNode);
////        }
////
////        node.put("receivers", arrayNode);
////        node.put("unfreeze_unsplit", true);
////
////        return node.toString();
//        return null;
//    }
//
//    /**
//     * 构建分账查询参数
//     */
//    private String composeQueryProfitShare(String transId, String outOrderNo) {
//
//        ObjectMapper objectMapper = new ObjectMapper();
//        ObjectNode rootNode = objectMapper.createObjectNode();
//        rootNode.put("transaction_id", transId) //支付流水号
//                .put("out_order_no", outOrderNo); //out_trade_no
//        return rootNode.toString();
//    }
//
//    private void processBeforeUnifiedOrder() {
//        if (listeners != null) {
////            listeners.forEach(WechatPayListener::beforeUnifiedOrder);
//        }
//    }
//
//    private void processAfterUnifiedOrder() {
//        if (listeners != null) {
////            listeners.forEach(WechatPayListener::afterUnifiedOrder);
//        }
//    }
//
//    private void processAfterPaid(APayOrder payOrder) {
//        if (listeners != null) {
////            listeners.forEach(l -> l.afterPaid(payOrder));
//        }
//    }
//
//    /**
//     * JSAPI下单参数组装
//     */
//    private WechatUnifiedOrderResponse composeResponse(String prepayId)
//            throws Exception {
////
////        String timestamp = String.valueOf(TimeUnit.MILLISECONDS.toSeconds(System.currentTimeMillis()));
////        String nonceStr = TradeHelper.generateCode(32);
////        String pkg = "prepay_id=" + prepayId;
////        String dataStr = wechatConfig.getAppId() + "\n" + timestamp + "\n" + nonceStr + "\n" + pkg + "\n";
//////        String paySign = RSAUtils.rsaSign(dataStr, wechatConfig.getPrivateKey());
////
////        WechatUnifiedOrderResponse orderResponse = new WechatUnifiedOrderResponse();
////        orderResponse.setAppId(wechatConfig.getAppId());
////        orderResponse.setTimestamp(timestamp);
////        orderResponse.setNonceStr(nonceStr);
////        orderResponse.setPkg(pkg);
//////        orderResponse.setPaySign(paySign);
////        orderResponse.setPrepayId(prepayId);
//
//        return null;
////        return orderResponse;
//    }
//
//    /**
//     * 生成支付订单
//     */
//    private APayOrder addPayOrder(WechatPayParam payParam, WechatUnifiedOrderResponse response,
//                                  String orderNo, String mchId, String shareRuleId) {
//
//        APayOrder payOrder = new APayOrder();
//        payOrder.setOrderNo(orderNo);
//        payOrder.setUserId(payParam.getUserId());
////        payOrder.setBusinessType(payParam.getBusiness());
//        payOrder.setBusinessId(payParam.getBusinessId());
//        payOrder.setApplyInfo(payParam.getApplyInfo());
//        payOrder.setStatus(PaymentStatus.CREATE);
//        payOrder.setTotalAmount(payParam.getTotalAmount());
//        payOrder.setDiscountAmount(payParam.getDiscountAmount());
//        payOrder.setPaidAmount(payParam.getPaidAmount());
//
////        payOrder.setSpAppId(wechatConfig.getAppId());
////        payOrder.setSpMchId(wechatConfig.getMchId());
//        payOrder.setSubMchId(mchId);
//        payOrder.setOpenId(payParam.getOpenId());
//        payOrder.setTimestamp(response.getTimestamp());
//        payOrder.setNonceStr(response.getNonceStr());
//        payOrder.setPrepayId(response.getPrepayId());
//        payOrder.setDelFlag(YesOrNo.NO);
//        payOrder.setCreateBy(payParam.getUserId());
//        payOrder.setCreateTime(LocalDateTime.now());
//
//        if (payParam.isProfitShare()) {
//            payOrder.setProfitShare(YesOrNo.YES);
//            payOrder.setShareRuleId(shareRuleId);
//            payOrder.setShareState("CREATE");//待分账
//        } else {
//            payOrder.setProfitShare(YesOrNo.NO);
//        }
//
////        payOrderService.create(payOrder);
//
//        return payOrder;
//    }
//
//    /**
//     * 回调支付成功
//     */
//    private APayOrder updatePaid(DecryptDataDTO dataDTO) {
//
////        APayOrder payOrder = payOrderService.getByOrderNo(dataDTO.getOutTradeNo());
////        payOrder.setFlowNumber(dataDTO.getTransactionId());
////        payOrder.setPaidTime(dataDTO.getSuccessTime());
////        payOrder.setTradeState(dataDTO.getTradeState());
////        payOrder.setTradeStateDesc(dataDTO.getTradeStateDesc());
////        payOrder.setTradeType(dataDTO.getTradeType());
////        payOrder.setStatus(PaymentStatus.SUCCESS);
////        payOrder.setUpdateBy("wechat notify");
////        payOrder.setUpdateTime(LocalDateTime.now());
////        payOrderService.updateById(payOrder);
////
////        return payOrder;
//        return null;
//    }
//
//    /**
//     * 订单分润修改
//     */
//    private APayOrder updateDoShare(APayOrder payOrder, WechatProfitShareResponse response) {
//
////        payOrder.setShareOrderNo(response.getOutOrderNo());
////        payOrder.setShareWechatOrderNo(response.getOrderId());
////        payOrder.setShareState(response.getState());
////        payOrder.setReceivers(response.getReceivers());
////
////        payOrderService.updateById(payOrder);
////
////        return payOrder;
//        return null;
//    }
//
//}
