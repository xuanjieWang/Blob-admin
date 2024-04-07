package com.ruoyi.blog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.blog.entity.Comment;
import com.ruoyi.blog.mapper.CommentMapper;
import com.ruoyi.blog.service.ICommentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author wangxuanjie
 * @since 2024-04-07
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements ICommentService {
    protected static final Logger log = LoggerFactory.getLogger(ICommentService.class);
}
