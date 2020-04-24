package com.nongzi.dao;

import com.nongzi.pojo.AdminChildMenu;
import com.nongzi.pojo.AdminChildMenuExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AdminChildMenuMapper {
    long countByExample(AdminChildMenuExample example);

    int deleteByExample(AdminChildMenuExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(AdminChildMenu record);

    int insertSelective(AdminChildMenu record);

    List<AdminChildMenu> selectByExample(AdminChildMenuExample example);

    AdminChildMenu selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") AdminChildMenu record, @Param("example") AdminChildMenuExample example);

    int updateByExample(@Param("record") AdminChildMenu record, @Param("example") AdminChildMenuExample example);

    int updateByPrimaryKeySelective(AdminChildMenu record);

    int updateByPrimaryKey(AdminChildMenu record);
}