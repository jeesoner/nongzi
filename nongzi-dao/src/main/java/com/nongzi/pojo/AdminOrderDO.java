package com.nongzi.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * @author saykuray
 * @date 2020/5/3 13:06
 */
public class AdminOrderDO implements Serializable {

    private Integer id; // 订单id
    private Integer uId; // 用户id
    private Integer eId; // 操作员id
    private String oId; // 订单流水号
    private String oTime; // 订单创建时间
    private Integer oType; // 订单状态
    private Integer rId; //收货人id
    private String oName; // 收货人名字
    private String oPhone; // 收货人电话
    private String oAddress; // 收货人地址
    private Integer adId; // 管理员id
    private String adUsername; // 管理员名
    private String uUsername; // 用户名
    private Date oTimeStart;
    private Date oTimeEnd;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Integer geteId() {
        return eId;
    }

    public void seteId(Integer eId) {
        this.eId = eId;
    }

    public String getoId() {
        return oId;
    }

    public void setoId(String oId) {
        this.oId = oId;
    }

    public String getoTime() {
        return oTime;
    }

    public void setoTime(String oTime) {
        this.oTime = oTime;
    }

    public Integer getoType() {
        return oType;
    }

    public void setoType(Integer oType) {
        this.oType = oType;
    }

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
    }

    public String getoName() {
        return oName;
    }

    public void setoName(String oName) {
        this.oName = oName;
    }

    public String getoPhone() {
        return oPhone;
    }

    public void setoPhone(String oPhone) {
        this.oPhone = oPhone;
    }

    public String getoAddress() {
        return oAddress;
    }

    public void setoAddress(String oAddress) {
        this.oAddress = oAddress;
    }

    public Integer getAdId() {
        return adId;
    }

    public void setAdId(Integer adId) {
        this.adId = adId;
    }

    public String getAdUsername() {
        return adUsername;
    }

    public void setAdUsername(String adUsername) {
        this.adUsername = adUsername;
    }

    public String getuUsername() {
        return uUsername;
    }

    public void setuUsername(String uUsername) {
        this.uUsername = uUsername;
    }

    public Date getoTimeStart() {
        return oTimeStart;
    }

    public void setoTimeStart(Date oTimeStart) {
        this.oTimeStart = oTimeStart;
    }

    public Date getoTimeEnd() {
        return oTimeEnd;
    }

    public void setoTimeEnd(Date oTimeEnd) {
        this.oTimeEnd = oTimeEnd;
    }
}
