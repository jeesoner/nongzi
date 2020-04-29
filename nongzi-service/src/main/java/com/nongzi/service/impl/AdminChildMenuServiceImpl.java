package com.nongzi.service.impl;

import com.nongzi.dao.AdminChildMenuMapper;
import com.nongzi.pojo.AdminChildMenu;
import com.nongzi.service.AdminChildMenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author saykuray
 * @date 2020/4/28 13:47
 */
@Service
public class AdminChildMenuServiceImpl implements AdminChildMenuService {

    @Resource
    private AdminChildMenuMapper adminChildMenuMapper;

    @Override
    public List<AdminChildMenu> findAll() {
        return adminChildMenuMapper.selectByExample(null);
    }
}
