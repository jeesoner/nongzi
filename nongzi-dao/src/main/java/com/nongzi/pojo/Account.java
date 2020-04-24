package com.nongzi.pojo;

import java.io.Serializable;
import java.util.Date;

public class Account implements Serializable {
    private Integer mId;

    private Integer uId;

    private Date mTime;

    private String mType;

    private String mAmoney;

    private static final long serialVersionUID = 1L;

    public Integer getmId() {
        return mId;
    }

    public void setmId(Integer mId) {
        this.mId = mId;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Date getmTime() {
        return mTime;
    }

    public void setmTime(Date mTime) {
        this.mTime = mTime;
    }

    public String getmType() {
        return mType;
    }

    public void setmType(String mType) {
        this.mType = mType == null ? null : mType.trim();
    }

    public String getmAmoney() {
        return mAmoney;
    }

    public void setmAmoney(String mAmoney) {
        this.mAmoney = mAmoney == null ? null : mAmoney.trim();
    }
}