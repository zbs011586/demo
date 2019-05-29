package com.shadowdata.zhiyi.searchengine.bean.dto;

import lombok.*;

import java.util.Date;
import java.util.List;

/**
 * 内容传输对象，用于往web端传值
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ContentDTO {
    private String title;
    private String content;
    private List<String> keyWords;
    private int type;
    private Date updateTime;
}
