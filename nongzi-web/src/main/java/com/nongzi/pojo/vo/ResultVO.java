package com.nongzi.pojo.vo;

import com.nongzi.pojo.enums.ResultCode;
import com.nongzi.util.StringUtils;

import java.io.Serializable;

/**
 * 用于封装返回结果的VO
 *
 * @author saykuray
 * @date 2020/4/27 10:56
 */
public class ResultVO<T> implements Serializable {

    // 状态码
    private int status;
    // 保存返回到前端的数据
    private T data;
    // 提示信息
    private String msg;

    public ResultVO() {}

    public ResultVO(T data) {
        this.data = data;
    }

    public ResultVO(ResultCode resultCode) {
        this.status = resultCode.getCode();
        this.msg = resultCode.getName();
    }

    public ResultVO(ResultCode resultCode, String msg) {
        this.status = resultCode.getCode();
        this.msg = msg;
    }

    public ResultVO(ResultCode resultCode, T data, String msg) {
        this.status = resultCode.getCode();
        this.msg = msg;
        this.data = data;
    }

    /**
     * 封装异常信息
     * @param e
     */
    public ResultVO(Throwable e) {
        this.msg = e.toString();
        this.status = ResultCode.SYSTEM_ERROR.getCode();
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(ResultCode resultCode) {
        this.status = resultCode.getCode();
    }

    public void setStatus(ResultCode resultCode, String msg) {
        this.status = resultCode.getCode();
        this.msg = StringUtils.isEmpty(msg) ? resultCode.getName() : msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    @Override
    public String toString() {
        return "ResultVO{" +
                "status=" + status +
                ", data=" + "data数据不打印" +
                ", msg='" + msg + '\'' +
                '}';
    }
}
