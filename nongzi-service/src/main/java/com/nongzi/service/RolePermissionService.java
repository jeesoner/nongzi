package com.nongzi.service;

import com.nongzi.pojo.Permission;

import java.util.List;

/**
 * @author saykuray
 * @date 2020/5/2 14:08
 */
public interface RolePermissionService {

    List<Permission> findAll();

    List<Permission> findPermissionByRoleId(int id);
}
