package com.ruoyi.blog.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.*;

/**
 * <p>
 *
 * </p>
 *
 * @author wangxuanjie
 * @since 2024-03-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("a_blog")
public class Blog implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @TableField("title")
    private String title;

    @TableField("text")
    private String text;

    @TableField(exist = false)
    private String image;

    @TableField("image_url")
    private String imageUrl;

    @TableField("common_count")
    private Integer commonCount;

    @TableField("video_count")
    private Integer videoCount;


    @TableField("status")
    private String status;

    @TableField("type")
    private String type;

    @TableField(exist = false)
    private Map<String, Object> params = new HashMap<>();

    @TableField(exist = false)
    private List timeRange = new ArrayList<>();

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

}
