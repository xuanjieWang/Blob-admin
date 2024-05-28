package com.ruoyi.pay.order.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 考试报名申请状态
 */
public enum ExamApplyStatus {

    //    SUBMIT(1,"信息已保存"),
//    REVIEW(2,"待审核"),
//    PASS(3,"已通过"),//审核通过。待缴费
//    FAIL(4,"未通过"),
//    PAYING(5,"缴费中"),
//    PAID_SUCCESS(6,"培训缴费成功"), //缴费成功。待考试
//    PAID_FAIL(7,"缴费失败"),
//    PROMISED(8,"已承诺"),//已承诺，跳报名选择考试科目页面
    CAN_ARRANGE(1, "待安排场次"),//已报名，跳缴费页面
    ARRANGED(2, "待报名"),
    //    EXAM_PAID_SUCCESS(10,"考试缴费成功"),//缴费成功，跳选择考试计划页面
//    CHOICE_PLAN(2,"已报名"),//已选定考试计划，跳准考证
//    REVIEW(3,"待审核"),
    CHOICE_PLAN(4, "打印准考证"),//已选定考试计划，跳准考证
    //    FAIL(5,"未通过"),
    EXAM_END(12, "考试中"),
    //    EXAM_PART_PASS(13,"部分科目考试通过"),//部分科目通过，可补考，点考试报名跳承诺书页面
    EXAM_PASS(14, "考试通过"),//定时任务更新或者考试答题后更新
    EXAM_FAIL(15, "考试不通过"),
    DOC_CREATED(16, "档案生成"),//定时任务考试通过的生成档案
    DOC_PASS(17, "档案审核通过"),//驾培档案审核通过
    DOC_PUSHED_SUCCESS(18, "档案推送成功"),//档案自动推送宜网统管成功
    DOC_PUSHED_FAIL(19, "档案推送失败"),//档案自动推送宜网统管成功
    ;

    private int code;
    private String desc;

    ExamApplyStatus(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }


    public static List<String> getOverExamEndList() {
        List<String> result = new ArrayList<>();
        for (ExamApplyStatus item : ExamApplyStatus.values()) {
            if (12 <= item.getCode()) {
                result.add(item.toString());
            }
        }

        return result;
    }

    public int getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }
}
