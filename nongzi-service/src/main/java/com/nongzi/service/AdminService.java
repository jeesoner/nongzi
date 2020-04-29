package com.nongzi.service;

import com.nongzi.pojo.Admin;

import java.util.List;

/**
 * @author sakura
 * @date 2020/4/23 22:59
 */
public interface AdminService {

    /**
     * 根据id查询admin
     *
     * @param id
     * @return 管理员VO
     */
    Admin findById(Integer id);

    /**
     * 查询所有的admin用户
     *
     * @return
     */
    List<Admin> findAll();

    /**
     * 查询登陆用户密码是否正确
     *
     * @param username
     * @param password
     * @return
     */
    Admin login(String username, String password);

}
