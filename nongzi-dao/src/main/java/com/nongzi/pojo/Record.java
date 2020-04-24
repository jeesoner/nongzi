package com.nongzi.pojo;

import java.io.Serializable;
import java.util.Date;

public class Record implements Serializable {
    private Integer recordId;

    private Integer sId;

    private Date recorddate;

    private Integer recordnumber;

    private static final long serialVersionUID = 1L;

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public Date getRecorddate() {
        return recorddate;
    }

    public void setRecorddate(Date recorddate) {
        this.recorddate = recorddate;
    }

    public Integer getRecordnumber() {
        return recordnumber;
    }

    public void setRecordnumber(Integer recordnumber) {
        this.recordnumber = recordnumber;
    }
}