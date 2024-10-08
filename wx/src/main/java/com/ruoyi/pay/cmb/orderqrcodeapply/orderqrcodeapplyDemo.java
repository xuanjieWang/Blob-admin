package com.ruoyi.pay.cmb.orderqrcodeapply;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ruoyi.pay.cmb.util.MD5Utils;
import com.ruoyi.pay.cmb.util.SignatureUtil;
import com.ruoyi.pay.cmb.util.Utils;

import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

/**
 * 密钥设置
 */
public class orderqrcodeapplyDemo {
    //private static final String url = "https://api.cmburl.cn:8065/polypay/v1.0/mchkey/keyset";
    private static final String url = "http://polypay-api.paasuat.cmbchina.cn/api/close";

    private static final String appId = "8ab74856-8772-45c9-96db-54cb30ab9f74";

    private static final String appSecret = "5b96f20a-011f-4254-8be8-9a5ceb2f317f";


    public static void main(String[] args) {
        // 组装requestBody并加签
        String signResult = signMethod();

        try {
            ObjectMapper mapper = new ObjectMapper();
            Map<String, String> signResultMap = mapper.readValue(signResult, Map.class);

            // 组apiSign加密Map
            String timestamp = "" + System.currentTimeMillis() / 1000;
            Map<String, String> apiSign = new TreeMap<>();
            apiSign.put("appid", appId);
            apiSign.put("secret", appSecret);
            apiSign.put("sign", signResultMap.get("sign"));
            apiSign.put("timestamp", "" + System.currentTimeMillis() / 1000);

            // MD5加密
            String MD5Content = SignatureUtil.getSignContent(apiSign);
            String apiSignString = MD5Utils.getMD5Content(MD5Content).toLowerCase();

            // 组request头部Map
            Map<String, String> apiHeader = new HashMap<>();
            apiHeader.put("appid", appId);
            apiHeader.put("timestamp", timestamp);
            apiHeader.put("apisign", apiSignString);

            // 发送HTTP post请求
            Map<String, String> response = Utils.postForEntity(url, signResult, apiHeader);

            // 返回结果验签
            Boolean checkResult1 = checkSign(mapper.writeValueAsString(response));
            if (!checkResult1) {
                return;
            }

            String success = response.get("returnCode");
            System.out.println("返回结果：" + success);
        } catch (Exception e) {
            return;
        }

    }

    private static String signMethod() {
        Map<String, String> requestPublicParams = new TreeMap<>();
        String requestStr = null;
        try {
            //公共请求参数
            requestPublicParams.put("version", "0.0.1");    //版本号，固定为0.0.1(必传字段)
            requestPublicParams.put("encoding", "UTF-8");   //编码方式，固定为UTF-8(必传)
            requestPublicParams.put("signMethod", "01");    //签名方法，固定为01，表示签名方式为RSA2(必传)
            //业务要素
            Map<String, String> requestTransactionParams = new HashMap<>();
            requestTransactionParams.put("merId", "30899917012000T");   //商户号(必传)
            requestTransactionParams.put("origCmbOrderId", "100419070210595371147326");  //原交易平台订单号,被关闭交易招行订单号，此字段和被关闭交易商户订单号字段至少要上送一个，若两个都上送，则以此字段为准
            requestTransactionParams.put("origOrderId", "1562036392778"); //原交易商户订单号，被关闭交易的商户订单号，此字段和被关闭交易平台订单号字段至少要上送一个，若两个都上送，则以被关闭交易平台订单号为准
            requestTransactionParams.put("userId", "N002852494");   //收银员(必传)
            ObjectMapper mapper = new ObjectMapper();
            requestPublicParams.put("biz_content", mapper.writeValueAsString(requestTransactionParams));

            System.out.println("加签前的报文内容：" + mapper.writeValueAsString(requestPublicParams));

            //私钥
            String privateKey = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCc540quYC9xzCMZeFOe8UmE3W5LWrqFd/2DDSHQASxq8vmOiwFRSG2hsVXtjfmNLQNhtpTR0SGDUjkCsx+SJH0JDnOfQ2xXHasO65Rnv2wrHs64P6U0aUrMWjgapjkmLwzRV12AKNAX77MGIocpcB0KZhk+0AVc6oQCBybV65JTGu+pAyFLMJRtIP5kH3VMuXmig6VeiZAsjEewD/emxgK3cXejMQvqlNYFnCLsZ7ovAhr+bhz6SHkOws3p80O6zfQbKfLzdSVaZK8FnwNPznUxAK77bRZN0zF3V9mL9+zrarvFPD5VkcVHNLj0DRzLmr2c5TbiCigs4+I+NMfhpoLAgMBAAECggEAbM8GzoImDXV87WAZhtu+NFF6ahhc9EiHL5H3O3PhzXRdyiK9NEpkvrdnUxRCX5pc4qSJ8waRNoUv7zSt60VYMf6NN+zw+fYtNfONR30CYOq76nDtGzbnW7TADiDeNmjU2plX3uVCUPoUzmSWIpevht7xl9XE8xtq7AM0E2YSrzEADcxtqQslM0uVOf+ki1eu0/OwCz13FzPlPtnDwt2Lw9xxCxWqTgpN4oD5m6EWTqbognUIJ0EFD0dHXjrYnHXc+/Za5e+CDXYApHuhR9bifa1e4HMN084oLY+rkSXUV3+Te0APPCfbeEeqvubziDmKxxKaWUq1wPbYi4c06ZQdgQKBgQDhF7zDWgiJFTgrLGmExJRKiR/3QZN4sugYE1itdRDJmiPV4xhWPXSsND3WtqR5+0otb/hbzRa3cyl/RXV/1ZmBbE46fX2DKnmLQ1gP74iOuqWpfxjh/qpk+3kEY9aP57le/O0QEEPsJmqCsGM7XnzfNsxGAFYaDHooRbcGtv++AwKBgQCycuvRUQjV4dxTuRJuwFbmdq4odSBMu7yCS4i5I9I73d3TGZBWfiXQWFmuiPh+pf3HdvMbgyA243Uv/NGapSmNvARXm0/eEyfTxV7+GVdwLf3sSe8DQMCR1eJA9VzuS+jhCrHkFgyW3V/3ki66W8YITENlgC+VebOatfFE8i/ZWQKBgQCZ2VmhxFX1LFW53J86qgoZb+QzYdTkOJQ+cGq6FDunL/2yYYfu2g527TYfHbMJ1OH8cH22cVVHiiUg4l7PQzWqqlZF0CQLlOqCb0MvkS8rLxOv6DkfrqrUXrV2dK7gqSegbwuxYQyryg4eyWTp3UlIX/H7Hpu7LjAIeq4Anu/p9QKBgFMtpiYHM6segGi2F5VwKhF6uGs7TTb3O0MwmiZSQCiPnlpLzC/E1TNsO0FTryC5lrVnCKKGWHm9RF595eXDnr7mKM/9IRlOrH3VvhWLEmrDxVxiifpmMFzJ6ZCFzi91SrO7HHhIns2jmpv3k7hiFsi/Y5roSUXPWJyAull82jjhAoGAaKujjF4HL91UXZFetkkKiBIpIrH5+XbiX9z7H9/Tv8NSy/zTvXp3hFl3dr9gO722i/96dTq4th23Gqtih4cA9x8Wd7RChR9yAK/ffSj1lW6RhBWj1j2JCPFCm1TJD5iO3bIeuHm2sAuafKKoWT/VCUkKRwt9Wwh9yF20vMQ3kFw=";
            //对待加签内容进行排序拼接
            String signContent = SignatureUtil.getSignContent(requestPublicParams);
            //加签
            requestPublicParams.put("sign", SignatureUtil.rsaSign(signContent, privateKey, "UTF-8"));

            requestStr = mapper.writeValueAsString(requestPublicParams);

            System.out.println("加签后的报文内容：" + requestStr);
            return requestStr;

        } catch (Exception e) {
            System.out.println("加签发生异常！");
            e.printStackTrace();
            return requestStr;
        }
    }

    private static Boolean checkSign(String string) {
        System.out.println("要验签的报文内容：" + string);
        try {
            //公钥
            String publicKey = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjutZyxP2L9eYM6DhZ11jk5lZieyyA6Wsr4baAU7PT+E0fv3KlERoh0edHLsLVff2I4AzuEqSoKDywKIBw1aSkIXGAaESj/FzA/V1jtmorq1RpPFmaqAOGDocMiaqukBBemwFnsYrTegsZUf88fU7KujwEMffLhhpwnM/Vf0NJ2s3ZwEZCgPWDa5cm1YpMLgopzc5HozENI5K9VFL92ThjHiTiutE28Bpi2xgSt6Cx+S8Nxqhy6/r/YVxvfgP66YCccnWOObN3fWo5TXepP6uBReTwjqNajlcSC5JqINqUUEAqief87y3NAFKRbE7Bu312y6zqcJgC/TIrWLXXB1/XQIDAQAB";
            //验签
            ObjectMapper objectMapper = new ObjectMapper();
            Map<String, String> responseBodyMap = objectMapper.readValue(string, Map.class);
            String sign = responseBodyMap.remove("sign");
            String contentStr = SignatureUtil.getSignContent(responseBodyMap);
            boolean result = SignatureUtil.rsaCheck(contentStr, sign, publicKey, "UTF-8");

            if (result) {
                System.out.println("报文验签成功!");
            } else {
                System.out.println("报文验签失败!");
            }
            return result;
        } catch (Exception e) {
            System.out.println("验签发生异常！");
            e.printStackTrace();
            return false;
        }
    }
}
