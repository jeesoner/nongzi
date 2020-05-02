package com.nongzi.service.impl;

import com.nongzi.dao.AdminMenuMapper;
import com.nongzi.pojo.AdminMenu;
import com.nongzi.service.AdminMenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author saykuray
 * @date 2020/4/28 13:47
 */
@Service
public class AdminMenuServiceImpl implements AdminMenuService {

    @Resource
    private AdminMenuMapper adminMenuMapper;

    @Override
    public List<AdminMenu> findAllByRoleId(int id) {
        List<AdminMenu> adminMenus = adminMenuMapper.selectByExample(null);
        if (id == 2) { // 客服
            adminMenus.remove(5);
            adminMenus.remove(1);
        }
        return adminMenus;
    }
}
