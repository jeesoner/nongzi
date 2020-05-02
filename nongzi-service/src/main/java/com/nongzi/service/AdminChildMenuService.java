package com.nongzi.service;

import com.nongzi.pojo.AdminChildMenu;

import java.util.List;

/**
 * @author saykuray
 * @date 2020/4/28 13:44
 */
public interface AdminChildMenuService {

    /**
     * 根据角色查询用户的菜单
     *
     * @return
     */
    List<AdminChildMenu> findAll();

}
