package com.nongzi.service;

import com.nongzi.pojo.AdminChildMenu;

import java.util.List;

/**
 * @author saykuray
 * @date 2020/4/28 13:44
 */
public interface AdminChildMenuService {

    /**
     * 查询所有的用户子菜单
     *
     * @return
     */
    List<AdminChildMenu> findAll();

}
