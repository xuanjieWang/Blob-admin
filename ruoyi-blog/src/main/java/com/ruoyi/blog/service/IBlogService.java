package com.ruoyi.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.blog.entity.Blog;
import com.ruoyi.common.core.domain.AjaxResult;

import java.util.List;

public interface IBlogService extends IService<Blog> {
    AjaxResult addBlog(Blog blog);

    List<Blog> listBlog(Blog blog);

    Blog getBlog(Long id);
}
