package com.nongzi.service;

import com.github.pagehelper.PageInfo;
import com.nongzi.pojo.User;

/**
 * @author saykuray
 * @date 2020/5/2 22:53
 */
public interface UserService {

    /**
     * 分页查询用户
     * @param start
     * @param length
     * @param user
     * @return
     */
    PageInfo<User> selectAllByPage(int start, int length, User user);

    /**
     * 根据id查询用户
     */
    User selectUserById(int uid);

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    int updateUserById(User user);

    /**
     * 删除用户信息
     * @param uid
     * @return
     */
    int deleteUserById(int uid);
}
