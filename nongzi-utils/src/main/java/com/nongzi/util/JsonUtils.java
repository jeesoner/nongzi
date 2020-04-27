package com.nongzi.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.ArrayList;
import java.util.List;

/**
 * @author: sakura
 * @date: 2020/4/27 12:09
 */
public class JsonUtils {

    /**
     * 定义jackson对象
     */
    private static final ObjectMapper MAPPER = new ObjectMapper();

    /**
     * 将对象转化为json
     * @param data
     * @return
     */
    public static String PojoToJson(Object data) {
        try {
            String json = MAPPER.writeValueAsString(data);
            return json;
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 将json转化为对象
     * @param json
     * @param beanType
     * @param <T>
     * @return
     */
    public static <T> T jsonToPojo(String json, Class<T> beanType) {
        try {
            T t = MAPPER.readValue(json, beanType);
            return t;
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 将json转化为list列表
     * @param json
     * @param beanType
     * @param <T>
     * @return
     */
    public static <T>List<T> jsonToList(String json, Class<T> beanType) {
        JavaType javaType = MAPPER.getTypeFactory().constructParametricType(ArrayList.class, beanType);
        try {
            List<T> list = MAPPER.readValue(json, javaType);
            return list;
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
