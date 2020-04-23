package com.nongzi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 后台管理人员登陆控制器
 * @author: sakura
 * @date: 2020/4/23 16:34
 */
@Controller
public class AdminLoginController {

    @RequestMapping("/admin/login")
    public String Login() {
        return "admin/adminLogin";
    }
}
