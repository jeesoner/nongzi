package com.nongzi.test;

import com.nongzi.pojo.Admin;
import com.nongzi.service.AdminService;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author: sakura
 * @date: 2020/4/24 12:08
 */
public class MybatisTest {

    @Test
    public void test() {
        ClassPathXmlApplicationContext classPathXmlApplicationContext = new ClassPathXmlApplicationContext("spring/spring-mybatis.xml");
        AdminService adminService = classPathXmlApplicationContext.getBean(AdminService.class);
        Admin admin = adminService.findById(1);
        System.out.println(admin.getAdUsername());
    }

}
