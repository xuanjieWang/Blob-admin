package com.ruoyi.pay.order.enums;

/**
 * 业务类型
 */
public enum BusinessType {

    QC(1, "考前培训，从业资格证"),
    CE(2, "继续教育"),
    EXAM(3, "考试报名");

    private int code;

    private String desc;

    BusinessType(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public int getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }
}
