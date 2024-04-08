package com.ruoyi.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.blog.entity.Blog;
import com.ruoyi.blog.entity.Comment;
import com.ruoyi.blog.mapper.CommentMapper;
import com.ruoyi.blog.service.IBlogService;
import com.ruoyi.blog.service.ICommentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

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

    @Autowired
    private IBlogService blogService;


    // 查询出一篇文章的所有评论


    /**
     * 1. 查询出这篇文章的所有id评论（10条，根据时间查询），相当于是root评论
     * 2. 查询root评论下面的3条评论信息
     * 3.
     **/
    @Override
    public List<Comment> listComm(Long blogId) {
        LambdaQueryWrapper<Comment> lqw = new LambdaQueryWrapper<>();
        lqw.eq(Comment::getBlogId, blogId);
        lqw.orderByDesc(Comment::getCreateTime);
        List<Comment> resultList = this.list(lqw);

        //遍历将所有的子元素赋值
        return resultList.stream().filter(item -> item.getRootCommentId() == null).map(item -> {
            item.setChildComment(getChirdComments(resultList, item));
            return item;
        }).collect(Collectors.toList());
    }

    /**
     * 递归获取到子元素的评论信息
     * 查询出评论之后应该带上用户的头像信息
     **/
    public List<Comment> getChirdComments(List<Comment> list, Comment parent) {
        List<Comment> result = null;
        for (Comment child : list) {
            // 循环，如果子元素的rootid，等于父元素的id，就是上下关系，同一级的出现
            if (null != child.getRootCommentId() && child.getRootCommentId().equals(parent.getId())) {
                List<Comment> chirdsComments = getChirdComments(list, child);
                if (null != chirdsComments) child.setChildComment(chirdsComments);
                result.add(child);
            }
        }
        return result;
    }

    /**
     * 添加评论
     **/
    @Override
    public void addComm(Comment comment) {
        this.save(comment);
        Blog blog = blogService.getById(Long.valueOf(comment.getBlogId()));
        blog.setCommonCount(blog.getCommonCount() + 1);
        blogService.updateById(blog);
    }
}
