package com.ruoyi.pay.share.dto;

import lombok.Data;

@Data
public class ShareRuleDto {

    private String type;

    private String account;

    private int amount;// 单位为分，注意！！！

    private String description;

    public ShareRuleDto(String type, String account, int amount, String description) {
        this.type = type;
        this.account = account;
        this.amount = amount;
        this.description = description;
    }
}
