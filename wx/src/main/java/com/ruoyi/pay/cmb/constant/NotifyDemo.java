package com.ruoyi.pay.cmb.constant;


import com.ruoyi.pay.cmb.util.SignatureUtil;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 退款(或支付)结果通知
 */
@RestController
public class NotifyDemo {
    /**
     * 通知接收
     *
     * @param requestBodyString
     * @return
     */
    @RequestMapping(value = "/notify_demo", method = RequestMethod.POST)
    public Map<String, String> refundNotify(@RequestBody String requestBodyString) {
        System.out.println(requestBodyString);
        Map<String, String> respData = new HashMap<>();
        //设置响应数据
        respData.put("version", "0.0.1");//版本号，固定为0.0.1(必传)
        respData.put("encoding", "UTF-8");//编码方式，固定为UTF-8(必传)
        respData.put("signMethod", "01");//签名方法，固定为01,表示签名方法为RSA2(必传)
        try {
            respData.put("returnCode", "SUCCESS"); //SUCCESS表示商户接收通知成功并校验成功
            //非空校验
            if (requestBodyString == null || "".equals(requestBodyString.trim())) {
                respData.put("returnCode", "FAIL");
                return respData;
            }
            Map<String, String> requestBodyMap = str2Map(requestBodyString);
            Map<String, String> resultMap = requestBodyMap.entrySet().stream().collect(Collectors.toMap(e -> SignatureUtil.decode(e.getKey()), e -> SignatureUtil.decode(e.getValue())));
            if (resultMap == null) {
                respData.put("returnCode", "FAIL");
                return respData;
            }
            String sign = resultMap.remove("sign");
            //对待加签内容进行排序拼接
            String contentStr = SignatureUtil.getSignContent(resultMap);
            //验证签名-使用招行公钥进行验签
            boolean flag = SignatureUtil.rsaCheck(contentStr, sign, Constant.CMB_PUBLIC_KEY, "UTF-8");
            if (!flag) {
                //验签失败
                System.out.println("验签失败");
                respData.put("returnCode", "FAIL");
                return respData;
            }
            System.out.println("验签成功");
            //......（处理自身业务逻辑）
            //......
            //......
            respData.put("respCode", "SUCCESS");//业务错误码，成功为SUCCESS，失败为FAIL
            /*如果处理自身业务逻辑发生错误，返回
            respData.put("respCode","FAIL");
            respData.put("respMsg","error_msg");
             */
            //对待加签内容进行排序拼接
            String signContent = SignatureUtil.getSignContent(respData);
            //加签-使用商户私钥加签
            respData.put("sign", SignatureUtil.rsaSign(signContent, Constant.PRIVATE_KEY, "UTF-8"));
            System.out.println("加签成功");
            return respData;
        } catch (Exception e) {
            e.printStackTrace();
            respData.put("returnCode", "FAIL");
            return respData;
        }
    }

    private Map<String, String> str2Map(String str) {
        Map<String, String> result = new HashMap<>();
        String[] results = str.split("&");
        if (results != null && results.length > 0) {
            for (int var = 0; var < results.length; ++var) {
                String pair = results[var];
                String[] kv = pair.split("=", 2);
                if (kv != null && kv.length == 2) {
                    result.put(kv[0], kv[1]);
                }
            }
        }
        return result;
    }
}
