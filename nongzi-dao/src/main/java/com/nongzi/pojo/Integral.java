package com.nongzi.pojo;

import java.io.Serializable;
import java.util.Date;

public class Integral implements Serializable {
    private Integer iId;

    private Integer uId;

    private Integer iNumber;

    private Date iTime;

    private String iDese;

    private static final long serialVersionUID = 1L;

    public Integer getiId() {
        return iId;
    }

    public void setiId(Integer iId) {
        this.iId = iId;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Integer getiNumber() {
        return iNumber;
    }

    public void setiNumber(Integer iNumber) {
        this.iNumber = iNumber;
    }

    public Date getiTime() {
        return iTime;
    }

    public void setiTime(Date iTime) {
        this.iTime = iTime;
    }

    public String getiDese() {
        return iDese;
    }

    public void setiDese(String iDese) {
        this.iDese = iDese == null ? null : iDese.trim();
    }
}