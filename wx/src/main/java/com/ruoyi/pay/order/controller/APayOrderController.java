//package com.ruoyi.pay.order.controller;
//
//import com.baomidou.mybatisplus.core.metadata.IPage;
//import com.ruoyi.common.core.domain.AjaxResult;
//import com.ruoyi.common.core.domain.entity.SysUser;
//import com.ruoyi.common.core.page.TableDataInfo;
//import com.ruoyi.common.utils.poi.ExcelUtil;
//import com.ruoyi.pay.order.entity.APayOrder;
//import com.ruoyi.pay.order.service.IAPayOrderService;
//import com.ruoyi.pay.order.vo.OrderVO;
//import io.swagger.annotations.Api;
//import io.swagger.annotations.ApiOperation;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.access.prepost.PreAuthorize;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import java.util.List;
//
///**
// * 用户订单表 前端控制器
// */
//@Api(consumes = "微信支付订单")
//@RestController
//@RequestMapping("/pay/order")
//public class APayOrderController extends Handler {
//
//    @Autowired
//    private IAPayOrderService payOrderService;
//
//    //查询改用户的订单
//    @GetMapping("/mini/orderList")
//    public AjaxResult queryTradeNo(BusinessType type) throws Exception {
//
//        List<OrderVO> userOrderList = payOrderService.getUserOrderList(currentMiniUser().getUserId(), type);
//        return AjaxResult.success(userOrderList);
//    }
//
//    /**
//     * 支付订单查询
//     */
//    @PreAuthorize("@ss.hasPermi('pay:order:list')")
//    @GetMapping("/list")
//    @ApiOperation("分页查询")
//    public TableDataInfo list(APayOrder order) {
//
//        SysUser sysUser = currentSysUser();
//        IPage<APayOrder> list = payOrderService.queryList(order);
//        return getDataTable(list);
//    }
//
//    /**
//     * 导出支付订单
//     */
//    @PreAuthorize("@ss.hasPermi('pay:order:export')")
//    @GetMapping("/export")
//    public AjaxResult export(APayOrder order) {
//        List<APayOrder> list = payOrderService.queryList(order).getRecords();
//        ExcelUtil<APayOrder> util = new ExcelUtil<>(APayOrder.class);
//        return util.exportExcel(list, "payOrder");
//    }
//
//}
