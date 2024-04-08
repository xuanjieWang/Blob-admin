package com.ruoyi.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.blog.entity.Comment;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author wangxuanjie
 * @since 2024-04-07
 */
public interface ICommentService extends IService<Comment> {

    List<Comment> listComm(Long blogId);

    void addComm(Comment comment);
}
