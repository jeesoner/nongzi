package com.nongzi.controller;

import com.github.pagehelper.PageInfo;
import com.nongzi.pojo.User;
import com.nongzi.pojo.enums.ResultCode;
import com.nongzi.pojo.vo.PageResultVO;
import com.nongzi.pojo.vo.ResultVO;
import com.nongzi.service.UserService;
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
public class UserManagementController {

    @Resource
    private UserService userService;

    @GetMapping("/user/get")
    public String getPage() {
        return "admin/user/adminUserInfo";
    }

    /**
     * 返回用户分页数据
     */
    @PostMapping("/user/page")
    @ResponseBody
    public PageResultVO<User> page(@RequestParam("start") Integer start,
                                            @RequestParam("length") Integer length,
                                            User user) {
        if (StringUtils.isEmpty(user.getuUsername())) user.setuUsername(null);
        if (StringUtils.isEmpty(user.getuPhone())) user.setuPhone(null);
        PageInfo<User> pageInfo = userService.selectAllByPage(start / length + 1, length, user);
        return new PageResultVO<>(pageInfo.getTotal(), pageInfo.getTotal(), pageInfo.getList());
    }

    /**
     * 根据id查询用户
     */
    @PostMapping("/user/id")
    @ResponseBody
    public ResultVO<User> findUserById(@RequestParam("uId") Integer uid) {
        User user = userService.selectUserById(uid);
        if (user == null) {
            return new ResultVO<User>(ResultCode.BUSINESS_FAIL);
        } else {
            return new ResultVO<User>(ResultCode.REQUIRED_SUCCESS, user);
        }
    }

    /**
     * 用户删除
     */
    @PostMapping("/user/del")
    @ResponseBody
    public ResultVO<User> delUser(@RequestParam("uId") Integer uid) {
        int count = userService.deleteUserById(uid);
        if (count == 0) {
            return new ResultVO<>(ResultCode.BUSINESS_FAIL);
        } else {
            return new ResultVO<>(ResultCode.REQUIRED_SUCCESS);
        }
    }

    /**
     * 用户修改
     */
    @PostMapping("/user/update")
    @ResponseBody
    public ResultVO<User> updateUser(User user) {
        int count = userService.updateUserById(user);
        if (count == 0) {
            return new ResultVO<>(ResultCode.BUSINESS_FAIL);
        } else {
            return new ResultVO<>(ResultCode.REQUIRED_SUCCESS);
        }
    }
}
