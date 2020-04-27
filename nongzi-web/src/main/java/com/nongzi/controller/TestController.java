package com.nongzi.controller;

import com.nongzi.pojo.Admin;
import com.nongzi.pojo.enums.ResultCode;
import com.nongzi.pojo.vo.ResultVO;
import com.nongzi.service.AdminService;
import com.nongzi.service.impl.AdminServiceImpl;
import com.nongzi.util.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

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

    /**
     * 测试前台获取json数据
     *
     * 结果：成功
     * @return
     */
    @RequestMapping("/test/restful")
    @ResponseBody
    public ResultVO restful() {
        List<Admin> admins = adminService.findAll();
        return new ResultVO(ResultCode.REQUIRED_SUCCESS, "你好！", admins);
    }
}
