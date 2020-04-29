package com.nongzi.service.impl;

import com.nongzi.exception.ServiceException;
import com.nongzi.dao.AdminMapper;
import com.nongzi.pojo.Admin;
import com.nongzi.pojo.AdminExample;
import com.nongzi.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author sakura
 * @date 2020/4/23 23:00
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Resource
    private AdminMapper adminMapper;

    @Override
    public Admin findById(Integer id) {
        return adminMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Admin> findAll() {
        return adminMapper.selectByExample(null);
    }

    public Admin login(String username, String password) {
        AdminExample adminExample = new AdminExample();
        adminExample.createCriteria().andAdUsernameEqualTo(username).andAdPasswordEqualTo(password);
        List<Admin> admins = adminMapper.selectByExample(adminExample);
        if (admins.size() == 1) {
            return admins.get(0);
        } else if (admins.size() == 0){
            // 查询不到数据
            return null;
        } else {
            return null;
        }
    }
}
