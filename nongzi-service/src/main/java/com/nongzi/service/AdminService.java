package com.nongzi.service;

import com.github.pagehelper.PageInfo;
import com.nongzi.pojo.Admin;
import com.nongzi.pojo.AdminInfoDO;

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

    /**
     * 通过主键更新管理员名和密码
     * @param admin
     * @return 更新的条数
     */
    int updateAdminById(Admin admin);

    /**
     * 添加管理员
     */
    int insertAdmin(Admin admin);

    /**
     * 删除管理员
     */
    int deleteAdminById(int id);

    /**
     * 分页查询管理员
     */
    PageInfo<AdminInfoDO> selectAdminByPage(int currentPage, int pageSize, AdminInfoDO adminInfo);

}
