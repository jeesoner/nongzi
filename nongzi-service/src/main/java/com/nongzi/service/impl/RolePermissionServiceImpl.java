package com.nongzi.service.impl;

import com.nongzi.dao.PermissionMapper;
import com.nongzi.pojo.Permission;
import com.nongzi.service.RolePermissionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author saykuray
 * @date 2020/5/2 14:10
 */
@Service
public class RolePermissionServiceImpl implements RolePermissionService {

    @Resource
    private PermissionMapper permissionMapper;

    @Override
    public List<Permission> findAll() {
        return permissionMapper.selectByExample(null);
    }

    @Override
    public List<Permission> findPermissionByRoleId(int id) {
        return permissionMapper.selectRolePermission(id);
    }
}
