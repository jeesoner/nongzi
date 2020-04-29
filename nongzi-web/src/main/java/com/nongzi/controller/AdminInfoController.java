package com.nongzi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author saykuray
 * @date 2020/4/29 14:02
 */
@Controller
@RequestMapping("/admin/info")
public class AdminInfoController {

    @GetMapping("/profile")
    public String getPage() {
        return "admin/person/adminInfo";
    }

}
