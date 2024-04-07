package com.ruoyi.blog;

import com.ruoyi.blog.entity.Blog;
import com.ruoyi.blog.service.IBlogService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/blog/data")
public class BlogController extends BaseController {
    @Autowired
    public IBlogService IBlogService;

    @ApiOperation("新增文章")
    @PreAuthorize("@ss.hasPermi('blog:data:add')")
    @Log(title = "新增文章", businessType = BusinessType.INSERT)
    @PostMapping("/addBlog")
    public AjaxResult addBlog(@RequestBody Blog Blog) {
        return IBlogService.addBlog(Blog);
    }

    @ApiOperation("获取所有的文章")
//    @PreAuthorize("@ss.hasPermi('blog:data:list')")
    @GetMapping("/list")
    public TableDataInfo list(Blog blog) {
        startPage();
        return getDataTable(IBlogService.listBlog(blog));
    }

    @ApiOperation("获取一个博客")
    @GetMapping("/{id}")
    public AjaxResult getBlog(@PathVariable("id") Long id) {
        return AjaxResult.success(IBlogService.getBlog(id));
    }

}
