package com.nongzi.controller;

import com.nongzi.service.AdminService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * 后台管理人员登陆控制器
 * 处理管理员登陆注销
 *
 * @author: saykuray
 * @date: 2020/4/23 16:34
 */
@Controller
public class AdminLoginController {

    @Resource
    private AdminService adminService;

    @RequestMapping("/admin/login")
    public String Login() {
        return "admin/adminLogin";
    }

}
