package com.nongzi.controller;

import com.nongzi.pojo.Admin;
import com.nongzi.pojo.enums.ResultCode;
import com.nongzi.pojo.vo.ResultVO;
import com.nongzi.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @author saykuray
 * @date 2020/4/29 14:02
 */
@Controller
@RequestMapping("/admin/info")
public class AdminInfoController {

    @Resource
    private AdminService adminService;

    /**
     * @return 请求个人信息页面
     */
    @GetMapping("/profile")
    public String getPage() {
        return "admin/person/adminInfo";
    }

    /**
     * @param session
     * @return 返回个人信息
     */
    @GetMapping("/profile/get")
    @ResponseBody
    public ResultVO<Admin> getAdminInfo(HttpSession session) {
        Integer id = (Integer) session.getAttribute("adminId");
        Admin admin = adminService.findById(id);
        return new ResultVO<Admin>(ResultCode.REQUIRED_SUCCESS, admin);
    }

    /**
     * 更新管理员信息
     * @param admin
     * @return
     */
    @PutMapping("/profile")
    @ResponseBody
    public ResultVO<Admin> updateAdminInfo(Admin admin) {
        if (admin == null) {
            return new ResultVO<Admin>(ResultCode.BAD_REQUEST);
        }
        int count = adminService.updateAdminById(admin);
        if (count == 1) {
            // 更新成功
            return new ResultVO<Admin>(ResultCode.REQUIRED_SUCCESS);
        } else {
            // 更新失败
            return new ResultVO<>(ResultCode.BUSINESS_FAIL);
        }
    }
}
