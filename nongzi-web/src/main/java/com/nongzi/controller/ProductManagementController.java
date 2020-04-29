package com.nongzi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author saykuray
 * @date 2020/4/29 14:34
 */
@Controller
@RequestMapping("admin/product")
public class ProductManagementController {

    @GetMapping("/list")
    public String getPage() {
        return "admin/product/adminProduct";
    }
}
