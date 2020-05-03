package com.nongzi.controller;

import com.nongzi.pojo.RecordDO;
import com.nongzi.pojo.enums.ResultCode;
import com.nongzi.pojo.vo.ResultVO;
import com.nongzi.service.ChartService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author saykuray
 * @date 2020/4/29 14:35
 */
@Controller
@RequestMapping("admin/chart")
public class ChartController {

    @Resource
    private ChartService chartService;

    @GetMapping("/show")
    public String getPage() {
        return "admin/table/pieMap";
    }

    @PostMapping("/statistic")
    @ResponseBody
    public ResultVO<List<RecordDO>> statistic(@RequestParam("startDate") String startDate,
                                        @RequestParam("endDate") String endDate) {
        List<RecordDO> list = chartService.selectGroupByType(startDate, endDate);
        return new ResultVO<>(ResultCode.REQUIRED_SUCCESS, list);
    }
}
