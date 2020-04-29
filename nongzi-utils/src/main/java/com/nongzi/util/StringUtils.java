package com.nongzi.util;

/**
 * @author sakura
 * @date 2020/4/27 9:33
 */
public class StringUtils {

    /**
     * 判断字符串是否为空值
     *
     * @param
     * @return
     */
    public static boolean isEmpty(String str) {
        return str == null || str.length() == 0;
    }

    /**
     * 去首尾空字符
     *
     * @param str
     * @return
     */
    public static String trimWhitespace(String str) {
        return isEmpty(str) ? str : str.trim();
    }
}
