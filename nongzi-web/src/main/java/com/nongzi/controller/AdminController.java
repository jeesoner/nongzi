package com.nongzi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author: sakura
 * @date: 2020/4/20 16:53
 */
@RequestMapping("/admin")
@Controller
public class AdminController {

    @RequestMapping("/index")
    public String adminIndex() {
        return "admin/adminMain";
    }

}
