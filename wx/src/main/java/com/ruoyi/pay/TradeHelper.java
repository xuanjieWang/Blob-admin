package com.ruoyi.pay;

import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * 支付帮助类
 */
public class TradeHelper {

    private static final String CHARSET = "01234567890abcdefghijklmnopqrstuvwxyz";

    private static final String NUMBER_CHARSET = "01234567890";

    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

    /**
     * 订单号生成
     */
    public static String generateTradeId() {
        return sdf.format(new Date()) + generateNumberCode(8);
    }

    /**
     * 生成带数字的随机字符串
     *
     * @param length 字符串长度
     * @return 随机字符串
     */
    public static String generateCode(int length) {
        StringWriter sw = new StringWriter();
        Random random = new Random();
        for (int i = 0; i < length; ++i) {
            sw.append(CHARSET.charAt(random.nextInt(CHARSET.length())));
        }
        return sw.toString();

    }

    /**
     * 生成数字的随机字符串
     *
     * @param length 字符串长度
     * @return 数字随机字符串
     */
    public static String generateNumberCode(int length) {
        StringWriter sw = new StringWriter();
        Random random = new Random();
        for (int i = 0; i < length; ++i) {
            sw.append(NUMBER_CHARSET.charAt(random.nextInt(NUMBER_CHARSET
                    .length())));
        }
        return sw.toString();
    }
}
