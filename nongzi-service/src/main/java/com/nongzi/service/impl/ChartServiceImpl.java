package com.nongzi.service.impl;

import com.nongzi.dao.RecordMapper;
import com.nongzi.pojo.RecordDO;
import com.nongzi.service.ChartService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author saykuray
 * @date 2020/5/3 21:07
 */
@Service
public class ChartServiceImpl implements ChartService {

    @Resource
    private RecordMapper recordMapper;

    @Override
    public List<RecordDO> selectGroupByType(String startDate, String endDate) {
        Map<String, String> map = new HashMap<>();
        map.put("startDate", startDate);
        map.put("endDate", endDate);
        return recordMapper.selectGroupByType(map);
    }
}
