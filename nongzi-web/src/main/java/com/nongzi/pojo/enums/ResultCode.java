package com.nongzi.pojo.enums;

/**
 * 返回结果的状态码
 *
 * @Author saykuray
 */
public enum ResultCode {

    REQUIRED_SUCCESS(10000, "请求成功"),
    RESOURCE_NOT_EXIST(10001, "请求的资源不存在"),
    METHOD_NOT_SUPPORTED(10002, "请求的方法不支持！"),
    BAD_REQUEST(10003, "参数异常"),
    MORE_ACTION_NEEDED(10004, "需要更多的操作"),
    REFRESH_CAPTCHA(10005, "刷新验证码"),
    USER_NOT_LOGIN(20001, "未登录"),
    PERMISSION_NOT_ENOUGH(20002, "权限不足"),
    TOKEN_OUTDATED(20003, "Token过期"),
    BUSINESS_FAIL(30001, "业务逻辑错误"),
    SYSTEM_ERROR(30002, "系统错误"),
    NO_GOODS(40001, "货物不足");

    // 状态码
    private int code;
    // 状态名
    private String name;

    ResultCode(int code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getNameByCode(int code) {
        for (ResultCode resultCode : ResultCode.values()) {
            if (resultCode.getCode() == code) {
                return resultCode.getName();
            }
        }
        return null;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}