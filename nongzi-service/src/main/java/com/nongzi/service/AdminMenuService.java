package com.nongzi.service;

import com.nongzi.pojo.AdminMenu;

import java.util.List;

/**
 * @author saykuray
 * @date 2020/4/28 13:44
 */
public interface AdminMenuService {

    List<AdminMenu> findAll();

}
