package com.nongzi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author saykuray
 * @date 2020/4/29 14:33
 */
@Controller
@RequestMapping("/admin/order")
public class OrderManagementController {

    @GetMapping("/list")
    public String getPage() {
        return "admin/order/adminOrder";
    }
}
