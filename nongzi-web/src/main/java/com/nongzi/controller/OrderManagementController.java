package com.nongzi.controller;

import com.github.pagehelper.PageInfo;
import com.nongzi.pojo.*;
import com.nongzi.pojo.enums.ResultCode;
import com.nongzi.pojo.vo.PageResultVO;
import com.nongzi.pojo.vo.ResultVO;
import com.nongzi.service.AdminOrderService;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author saykuray
 * @date 2020/4/29 14:33
 */
@Controller
@RequestMapping("/admin/order")
public class OrderManagementController {

    @Resource
    private AdminOrderService adminOrderService;

    @GetMapping("/list")
    public String getPage() {
        return "admin/order/adminOrder";
    }

    /**
     * 返回分页查询的PageResult
     *
     * @param start      起始页码
     * @param length     页大小
     * @param adminOrder 封装的查询参数
     * @return
     */
    @PostMapping("/list")
    @ResponseBody
    public PageResultVO<AdminOrderDO> listPage(@RequestParam("start") Integer start,
                                               @RequestParam("length") Integer length,
                                               AdminOrderDO adminOrder) {
        PageInfo<AdminOrderDO> pageInfo = adminOrderService.findOrderByPage(start / length + 1, length, adminOrder);
        return new PageResultVO<>(pageInfo.getTotal(), pageInfo.getTotal(), pageInfo.getList());
    }

    @PostMapping("/del")
    @ResponseBody
    public ResultVO delete(@RequestParam("oId") Integer oid) {
        int count = adminOrderService.deleteOrderById(oid);
        if (count == 0) {
            return new ResultVO(ResultCode.BUSINESS_FAIL);
        } else {
            return new ResultVO(ResultCode.REQUIRED_SUCCESS);
        }
    }

    /**
     * 返回订单详情数据
     *
     * @return
     */
    @PostMapping("/detail")
    @ResponseBody
    public PageResultVO<OrderDetailDO> productInfo(@RequestParam("start") Integer start,
                                                   @RequestParam("length") Integer length,
                                                   @RequestParam("oId") String oid) {
        PageInfo<OrderDetailDO> pageInfo = adminOrderService.selectDetailById(start / length + 1, length, oid);
        return new PageResultVO<>(pageInfo.getTotal(), pageInfo.getTotal(), pageInfo.getList());
    }

    @PostMapping("/update")
    @ResponseBody
    public ResultVO update(ReceiptInfo receiptInfo) {
        int count = adminOrderService.updateReceiptInfo(receiptInfo);
        if (count == 0) {
            return new ResultVO(ResultCode.BUSINESS_FAIL);
        } else {
            return new ResultVO(ResultCode.REQUIRED_SUCCESS);
        }
    }

    @PostMapping("/receiptInfo")
    @ResponseBody
    public ResultVO<ReceiptInfo> integral(@RequestParam("rId") Integer id) {
        ReceiptInfo receiptInfo = adminOrderService.selectReceiptInfoById(id);
        if (receiptInfo == null) {
            return new ResultVO<>(ResultCode.BUSINESS_FAIL);
        } else {
            return new ResultVO<>(ResultCode.REQUIRED_SUCCESS, receiptInfo);
        }
    }

    /**
     * 确认发货
     *
     * @param session
     * @param id
     * @param typeNum
     * @return
     */
    @PostMapping("/confirm")
    @ResponseBody
    public ResultVO confirm(HttpSession session,
                            @RequestParam("id") Integer id,
                            @RequestParam("typeNum") Integer typeNum) {
        // 获取当前登录的管理员id
        Integer adminId = (Integer) session.getAttribute("adminId");
        Order order = new Order();
        order.setId(id);
        order.seteId(adminId);
        order.setoType(typeNum);
        int count = adminOrderService.updateOrderTypeById(order);
        if (count == 0) {
            return new ResultVO(ResultCode.NO_GOODS);
        } else {
            return new ResultVO(ResultCode.REQUIRED_SUCCESS);
        }
    }
}

