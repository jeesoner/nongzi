package com.nongzi.controller;

import com.github.pagehelper.PageInfo;
import com.nongzi.dao.AdminMapper;
import com.nongzi.pojo.Admin;
import com.nongzi.pojo.AdminInfoDO;
import com.nongzi.pojo.enums.ResultCode;
import com.nongzi.pojo.vo.PageResultVO;
import com.nongzi.pojo.vo.ResultVO;
import com.nongzi.service.AdminService;
import com.nongzi.util.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * @author saykuray
 * @date 2020/4/29 14:13
 */
@Controller
@RequestMapping("/admin/people")
public class AdminManagementController {

    @Resource
    private AdminService adminService;

    @GetMapping("/admin/get")
    public String getPage() {
        return "admin/user/adminAdmin";
    }

    /**
     * 返回数据
     */
    @PostMapping("/admin/limit")
    @ResponseBody
    public PageResultVO<AdminInfoDO> limit(@RequestParam("start") Integer start,
                                           @RequestParam("length") Integer length,
                                           AdminInfoDO adminInfo) {
        if (StringUtils.isEmpty(adminInfo.getAdUsername())) adminInfo.setAdUsername(null);
        if (StringUtils.isEmpty(adminInfo.getRoleName())) adminInfo.setRoleName(null);
        PageInfo<AdminInfoDO> pageInfo = adminService.selectAdminByPage(start / length + 1, length, adminInfo);
        return new PageResultVO<>(pageInfo.getTotal(), pageInfo.getTotal(), pageInfo.getList());
    }

    /**
     * 管理员添加
     */
    @PostMapping("/admin/addAdmin")
    @ResponseBody
    public ResultVO addNewAdmin(Admin admin) {
        int count = adminService.insertAdmin(admin);
        if (count == 0) return new ResultVO(ResultCode.BUSINESS_FAIL);
        else return new ResultVO(ResultCode.REQUIRED_SUCCESS);
    }

    /**
     * 获取管理员信息
     */
    @PostMapping("/admin/adminInfo")
    @ResponseBody
    public ResultVO<Admin> adminInfo(Integer adId) {
        return new ResultVO<>(ResultCode.REQUIRED_SUCCESS, adminService.findById(adId));
    }

    /**
     * 管理员修改
     */
    @PostMapping("/admin/updateAdmin")
    @ResponseBody
    public ResultVO<Admin> updateGoAdminById(Admin admin) {
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

    /**
     * 管理员删除
     */
    @PostMapping("/admin/delAdmin")
    @ResponseBody
    public ResultVO<Admin> delAdmin(Integer id) {
        int count = adminService.deleteAdminById(id);
        if (count == 0) return new ResultVO(ResultCode.BUSINESS_FAIL);
        else return new ResultVO(ResultCode.REQUIRED_SUCCESS);
    }
}
