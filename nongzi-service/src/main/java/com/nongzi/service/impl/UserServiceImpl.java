package com.nongzi.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nongzi.dao.UserMapper;
import com.nongzi.pojo.User;
import com.nongzi.pojo.UserExample;
import com.nongzi.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author saykuray
 * @date 2020/5/2 22:57
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public PageInfo<User> selectAllByPage(int start, int length, User user) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        if (user.getuUsername() != null) {
            criteria.andUUsernameEqualTo(user.getuUsername());
        }
        if (user.getuPhone() != null) {
            criteria.andUPhoneEqualTo(user.getuPhone());
        }
        userExample.or(criteria);
        PageHelper.startPage(start, length);
        List<User> users = userMapper.selectByExample(userExample);
        return new PageInfo<>(users);
    }

    @Override
    public User selectUserById(int uid) {
        return userMapper.selectByPrimaryKey(uid);
    }

    @Override
    public int updateUserById(User user) {
        return userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public int deleteUserById(int uid) {
        return userMapper.deleteByPrimaryKey(uid);
    }
}
