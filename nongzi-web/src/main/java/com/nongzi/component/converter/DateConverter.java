package com.nongzi.component.converter;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author saykuray
 * @date 2020/5/2 23:56
 */
public class DateConverter implements Converter<String, Date> {

    private String [] pattern = {"yyyy-MM-dd","yyyy年MM月dd日"};

    @Override
    public Date convert(String s) {
        if (s == null || s.isEmpty()) return null;
        for (int i = 0; i < pattern.length; i++) {
            try {
                return new SimpleDateFormat(pattern[i]).parse(s);
            } catch (ParseException e) {
                continue;
            }
        }
        return null;
    }
}
