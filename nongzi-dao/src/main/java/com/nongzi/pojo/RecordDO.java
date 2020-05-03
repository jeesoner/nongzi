package com.nongzi.pojo;

import java.io.Serializable;

/**
 * @author saykuray
 * @date 2020/5/3 21:00
 */
public class RecordDO implements Serializable {

    private Integer value;
    private String name;

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
