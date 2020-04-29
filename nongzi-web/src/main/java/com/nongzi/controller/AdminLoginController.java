package com.nongzi.controller;

import com.nongzi.pojo.Admin;
import com.nongzi.pojo.enums.ResultCode;
import com.nongzi.pojo.vo.ResultVO;
import com.nongzi.service.AdminChildMenuService;
import com.nongzi.service.AdminMenuService;
import com.nongzi.service.AdminService;
import com.nongzi.util.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 后台管理人员登陆控制器，处理管理员登陆注销
 *
 * @author saykuray
 * @date 2020/4/23 16:34
 */
@Controller
@RequestMapping("/admin")
public class AdminLoginController {

    @Resource
    private AdminService adminService;
    @Resource
    private AdminMenuService adminMenuService;
    @Resource
    private AdminChildMenuService adminChildMenuService;

    /**
     * @return 返回登陆页面
     */
    @GetMapping("/login")
    public String getPage() {
        return "admin/adminLogin";
    }

    /**
     * 处理登陆逻辑
     *
     * @return 成功去后台管理页面，失败重新登陆
     */
    @PostMapping("/login")
    public String adminGoLogin(@RequestParam("adUsername")String username,
                               @RequestParam("adPassword")String password,
                               HttpServletRequest request) {
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            request.setAttribute("msg", "用户名或密码不能为空");
            return "admin/adminLogin";
        }
        username = StringUtils.trimWhitespace(username);
        password = StringUtils.trimWhitespace(password);
        Admin admin = adminService.login(username, password);
        if (admin == null) {
            System.out.println("用户错误");
            request.setAttribute("msg", "用户名或者密码错误");
            return "admin/adminLogin";
        }
        request.getSession().setAttribute("adminName", admin.getAdUsername());
        request.getSession().setAttribute("adminId", admin.getAdId());
        return "redirect:main";
    }

    /**
     * 后台主页面
     *
     * @return 主页面
     */
    @GetMapping("/main")
    public String adminMain(Model model) {
        model.addAttribute("adminMenu", adminMenuService.findAll());
        model.addAttribute("adminChildMenu", adminChildMenuService.findAll());
        return "admin/adminMain";
    }

    /**
     * admin注销
     *
     * @return 登陆页面
     */
    @DeleteMapping("/login")
    @ResponseBody
    public ResultVO logout(HttpSession session) {
        session.removeAttribute("adminName");
        session.removeAttribute("adminId");
        return new ResultVO(ResultCode.USER_NOT_LOGIN, "注销登陆");
    }

}
