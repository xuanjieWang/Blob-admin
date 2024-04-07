package com.ruoyi.blog.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author wangxuanjie
 * @since 2024-04-07
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("a_comment")
@ApiModel(value = "AComment对象", description = "")
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "评论id")
    @TableId("id")
    private Integer id;

    @ApiModelProperty(value = "博客信息id")
    @TableField("blog_id")
    private Integer blogId;


    @ApiModelProperty(value = "评论内容")
    @TableField("content")
    private String content;

    @ApiModelProperty(value = "是否删除")
    @TableField("id_delete")
    private Boolean idDelete;

    @ApiModelProperty(value = "用户id")
    @TableField("user_id")
    private Integer userId;

    @ApiModelProperty(value = "所属视频id")
    @TableField("video_id")
    private Integer videoId;

    @ApiModelProperty(value = "点赞数量")
    @TableField("like_count")
    private Integer likeCount;

    @ApiModelProperty(value = "顶级评论id")
    @TableField("root_comment_id")
    private Integer rootCommentId;

    @ApiModelProperty(value = "回复目标id")
    @TableField("to_comment_id")
    private Integer toCommentId;

    @ApiModelProperty(value = "创建时间")
    @TableField("create_time")
    private LocalDateTime createTime;

    @ApiModelProperty(value = "修改时间")
    @TableField("update_time")
    private LocalDateTime updateTime;

    @ApiModelProperty(value = "子评论")
    @TableField(exist = false)
    private List<Comment> ChildComment;


}
