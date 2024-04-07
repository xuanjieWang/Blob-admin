package com.ruoyi.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.blog.entity.Comment;
import com.ruoyi.blog.mapper.CommentMapper;
import com.ruoyi.blog.service.ICommentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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


    // 查询出一篇文章的所有评论


    /**
     * 1. 查询出这篇文章的所有id评论（10条，根据时间查询），相当于是root评论
     * 2. 查询root评论下面的3条评论信息
     * 3.
     **/
    @Override
    public List<Comment> listComm(Comment comment) {
        LambdaQueryWrapper<Comment> lqw = new LambdaQueryWrapper<>();
        lqw.eq(Comment::getBlogId, comment.getBlogId());
        lqw.orderByDesc(Comment::getCreateTime);
        List<Comment> resultList = this.list(lqw);
        //遍历获取子元素

        return resultList.stream().filter(item -> item.getRootCommentId() != null).map(item -> {
            item.setChildComment(getChirdComments(resultList, item));
            return item;
        }).collect(Collectors.toList());
    }

    //
    public List<Comment> getChirdComments(List<Comment> list, Comment comment) {
        List<Comment> result = new ArrayList<>();
        for (Comment item : list) {
            if (null != item.getRootCommentId() && item.getRootCommentId().equals(comment.getId())) {
                result.add(item);
                //子元素如果还有子元素，递归查询
//                getChirdComments(list, item);
            }
        }
        return result;
    }

    @Override
    public int addComm(Comment comment) {
        return 0;
    }
}
