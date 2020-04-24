package com.nongzi.pojo;

import java.io.Serializable;

public class AdminChildMenu implements Serializable {
    private Integer id;

    private String childMenuName;

    private Integer parentid;

    private String childMenuUrl;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getChildMenuName() {
        return childMenuName;
    }

    public void setChildMenuName(String childMenuName) {
        this.childMenuName = childMenuName == null ? null : childMenuName.trim();
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public String getChildMenuUrl() {
        return childMenuUrl;
    }

    public void setChildMenuUrl(String childMenuUrl) {
        this.childMenuUrl = childMenuUrl == null ? null : childMenuUrl.trim();
    }
}