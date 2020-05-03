package com.nongzi.service;

import com.nongzi.dao.RecordMapper;
import com.nongzi.pojo.RecordDO;

import java.util.List;

/**
 * @author saykuray
 * @date 2020/5/3 21:04
 */
public interface ChartService {

    List<RecordDO> selectGroupByType(String startDate, String endDate);

}
