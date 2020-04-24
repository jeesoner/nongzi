package com.nongzi.controller;

import com.nongzi.pojo.Admin;
import com.nongzi.service.AdminService;
import com.nongzi.service.impl.AdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * @author: sakura
 * @date: 2020/4/23 23:19
 */
@Controller
public class TestController {

    @Resource
    private AdminService adminService;

    @RequestMapping("/test/admin")
    public String adminService(Model model) {
        Admin admin = adminService.findById(1);
        model.addAttribute("admin", admin);
        return "test/test";
    }
}
