package com.nongzi.service;

import com.nongzi.pojo.Admin;

import java.util.List;

/**
 * @author: sakura
 * @date: 2020/4/23 22:59
 */
public interface AdminService {

    /**
     * 根据id查询admin
     *
     * @param id
     * @return
     */
    Admin findById(Integer id);

    /**
     * 查询所有的admin用户
     *
     * @return
     */
    List<Admin> findAll();

}
