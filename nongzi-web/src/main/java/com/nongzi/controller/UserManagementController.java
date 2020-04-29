package com.nongzi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author saykuray
 * @date 2020/4/29 14:13
 */
@Controller
@RequestMapping("/admin/people")
public class UserManagementController {

    @GetMapping("/user-list")
    public String getPage() {
        return "admin/user/adminUserInfo";
    }

}
