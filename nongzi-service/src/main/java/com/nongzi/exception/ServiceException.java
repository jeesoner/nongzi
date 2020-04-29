package com.nongzi.exception;

/**
 * 业务异常类
 *
 * @author saykuray
 * @date 2020/4/27 21:47
 */
public class ServiceException extends RuntimeException{

    /**
     * @param reason 描述业务失败的原因
     */
    public ServiceException(String reason) {
        super(reason);
    }
}