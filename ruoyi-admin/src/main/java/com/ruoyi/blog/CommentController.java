package com.ruoyi.blog;


import com.ruoyi.blog.service.ICommentService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
    @PostMapping("/test")
    public AjaxResult Test() {
        return AjaxResult.success("测试commentService");
    }


}
