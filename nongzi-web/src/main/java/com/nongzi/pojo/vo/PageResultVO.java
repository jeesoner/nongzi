package com.nongzi.pojo.vo;

import java.io.Serializable;
import java.util.List;

/**
 * 通用的分页VO
 *
 * @author saykuray
 * @date 2020/5/2 15:05
 */
public class PageResultVO<T> implements Serializable {

    private int draw;
    /**
     * 查询到的总记录数
     */
    private int recordsTotal;
    /**
     * 过滤后的记录数
     */
    private int recordsFiltered;

    /**
     * 数据列表
     */
    private List<T> data;

    /**
     * 错误信息
     */
    private String error;

    public PageResultVO(int recordsTotal, int recordsFiltered, List<T> data) {
        this.recordsTotal = recordsTotal;
        this.recordsFiltered = recordsFiltered;
        this.data = data;
    }

    public int getDraw() {
        return draw;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }

    public int getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(int recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public int getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(int recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
}
