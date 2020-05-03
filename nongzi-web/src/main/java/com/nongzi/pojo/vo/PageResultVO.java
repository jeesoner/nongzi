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
    private long recordsTotal;
    /**
     * 过滤后的记录数
     */
    private long recordsFiltered;

    /**
     * 数据列表
     */
    private List<T> data;

    /**
     * 错误信息
     */
    private String error;

    public PageResultVO(long recordsTotal, long recordsFiltered, List<T> data) {
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

    public long getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(long recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public long getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(long recordsFiltered) {
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
