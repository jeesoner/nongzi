package com.nongzi.dao;

import com.nongzi.pojo.ReceiptInfo;
import com.nongzi.pojo.ReceiptInfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ReceiptInfoMapper {
    long countByExample(ReceiptInfoExample example);

    int deleteByExample(ReceiptInfoExample example);

    int deleteByPrimaryKey(Integer rId);

    int insert(ReceiptInfo record);

    int insertSelective(ReceiptInfo record);

    List<ReceiptInfo> selectByExample(ReceiptInfoExample example);

    ReceiptInfo selectByPrimaryKey(Integer rId);

    int updateByExampleSelective(@Param("record") ReceiptInfo record, @Param("example") ReceiptInfoExample example);

    int updateByExample(@Param("record") ReceiptInfo record, @Param("example") ReceiptInfoExample example);

    int updateByPrimaryKeySelective(ReceiptInfo record);

    int updateByPrimaryKey(ReceiptInfo record);
}