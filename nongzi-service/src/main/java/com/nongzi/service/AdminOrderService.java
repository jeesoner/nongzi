package com.nongzi.service;

import com.github.pagehelper.PageInfo;
import com.nongzi.pojo.*;

import java.util.List;

/**
 * @author saykuray
 * @date 2020/5/3 13:48
 */
public interface AdminOrderService {

    /**
     * 分页查询订单
     * @param start
     * @param length
     * @param adminOrder
     * @return
     */
    PageInfo<AdminOrderDO> findOrderByPage(int start, int length, AdminOrderDO adminOrder);

    /**
     * 删除订单
     * @param oid
     * @return
     */
    int deleteOrderById(int oid);

    /**
     * 查看订单详情，分页返回
     * @param start
     * @param length
     * @param oid
     * @return
     */
    PageInfo<OrderDetailDO> selectDetailById(int start, int length, String oid);

    /**
     * 查询收货人信息
     * @param id
     * @return
     */
    ReceiptInfo selectReceiptInfoById(int id);

    /**
     * 更新收货人信息
     * @param receiptInfo
     * @return
     */
    int updateReceiptInfo(ReceiptInfo receiptInfo);

    /**
     * 更新收货的类型
     * @return
     */
    int updateOrderTypeById(Order order);

    /**
     * 查询订单详情，导出excel
     * @param oid
     * @return
     */
    List<ExcelOrderDO> outExcelOrder(String oid);
}
