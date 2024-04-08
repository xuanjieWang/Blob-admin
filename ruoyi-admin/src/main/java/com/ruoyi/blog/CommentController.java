package com.ruoyi.blog;


import com.ruoyi.blog.entity.Comment;
import com.ruoyi.blog.service.ICommentService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author wangxuanjie
 * @since 2024-04-07
 */
@RestController
@RequestMapping("/comm/data")
public class CommentController extends BaseController {
    @Autowired
    public ICommentService commentService;


    @ApiOperation("test")
    @GetMapping("/test")
    public AjaxResult Test() {
        return AjaxResult.success("测试commentService");
    }


    @ApiOperation("获取到所有的评论信息")
    @GetMapping("/{id}")
    public TableDataInfo listComm(@PathVariable("id") Long id) {
        startPage();
        return getDataTable(commentService.listComm(id));
    }

    //添加评论信息
    @ApiOperation("添加评论信息")
    @PutMapping("/addComm")
    public AjaxResult addComm(@RequestBody Comment comment) {
        commentService.addComm(comment);
        return AjaxResult.success();
    }

}
