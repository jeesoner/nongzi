package com.nongzi.service.impl;

import com.nongzi.dao.AdminMapper;
import com.nongzi.pojo.Admin;
import com.nongzi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author: sakura
 * @date: 2020/4/23 23:00
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Resource
    private AdminMapper adminMapper;

    @Override
    public Admin findById(Integer id) {
        return adminMapper.selectByPrimaryKey(id);
    }
}
