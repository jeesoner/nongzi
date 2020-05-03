package com.nongzi.dao;

import com.nongzi.pojo.Record;
import com.nongzi.pojo.RecordDO;
import com.nongzi.pojo.RecordExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface RecordMapper {
    long countByExample(RecordExample example);

    int deleteByExample(RecordExample example);

    int deleteByPrimaryKey(Integer recordId);

    int insert(Record record);

    int insertSelective(Record record);

    List<Record> selectByExample(RecordExample example);

    Record selectByPrimaryKey(Integer recordId);

    int updateByExampleSelective(@Param("record") Record record, @Param("example") RecordExample example);

    int updateByExample(@Param("record") Record record, @Param("example") RecordExample example);

    int updateByPrimaryKeySelective(Record record);

    int updateByPrimaryKey(Record record);

    List<RecordDO> selectGroupByType(Map<String, String> map);
}