package com.nongzi.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nongzi.dao.OrderDetailMapper;
import com.nongzi.dao.OrderMapper;
import com.nongzi.dao.ReceiptInfoMapper;
import com.nongzi.pojo.*;
import com.nongzi.service.AdminOrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author saykuray
 * @date 2020/5/3 13:51
 */
@Service
public class AdminOrderServiceImpl implements AdminOrderService {

    @Resource
    private OrderMapper orderMapper;

    @Resource
    private OrderDetailMapper orderDetailMapper;

    @Resource
    private ReceiptInfoMapper receiptInfoMapper;

    @Override
    public PageInfo<AdminOrderDO> findOrderByPage(int start, int length, AdminOrderDO adminOrder) {
        PageHelper.startPage(start, length);
        List<AdminOrderDO> adminOrderPage = orderMapper.selectAdminOrder(adminOrder);
        return new PageInfo<>(adminOrderPage);
    }

    @Override
    public int deleteOrderById(int oid) {
        return orderMapper.deleteByPrimaryKey(oid);
    }

    @Override
    public PageInfo<OrderDetailDO> selectDetailById(int start, int length, String oid) {
        PageHelper.startPage(start, length);
        List<OrderDetailDO> orderDetails = orderDetailMapper.selectOrderDetailByoId(oid);
        return new PageInfo<>(orderDetails);
    }

    @Override
    public ReceiptInfo selectReceiptInfoById(int id) {
        return receiptInfoMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateReceiptInfo(ReceiptInfo receiptInfo) {
        return receiptInfoMapper.updateByPrimaryKey(receiptInfo);
    }

    @Override
    public int updateOrderTypeById(Order order) {
        return orderMapper.updateTypeById(order);
    }

    @Override
    public List<ExcelOrderDO> outExcelOrder(String oid) {
        return orderDetailMapper.selectExcelOrderById(oid);
    }
}
