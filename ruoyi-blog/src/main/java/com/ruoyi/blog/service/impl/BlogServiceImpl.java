package com.ruoyi.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.blog.entity.Blog;
import com.ruoyi.blog.mapper.BlogMapper;
import com.ruoyi.blog.service.IBlogService;
import com.ruoyi.common.annotation.DataSource;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.DataSourceType;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.List;

@Service
@Component
public class BlogServiceImpl extends ServiceImpl<BlogMapper, Blog> implements IBlogService {

    protected static final Logger log = LoggerFactory.getLogger(BlogServiceImpl.class);

    /**
     * 测试base64转图片，并存储到本地
     *
     * @param base64 base64字符串
     */
    public static String saveImage(String base64) {
        String[] parts = base64.split(",");
        byte[] bs = new byte[1024];
        bs = Base64.getMimeDecoder().decode(parts[1]);

        String url = null;
        String os = System.getProperty("os.name").toLowerCase();
        if (os.contains("win")) {
            url = "D:\\blog\\img\\";
        } else if (os.contains("nux") || os.contains("nix")) {// Linux 或 UNIX 操作系统
            url = "/home/blog/img/";
        }
        File file = new File(url);

        if (!file.exists()) {
            file.mkdirs();
        }

        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        String suffix = df.format(new Date());
        file = new File(url + suffix + ".jpg");

        BufferedOutputStream bos = null;
        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream(file);
            bos = new BufferedOutputStream(fos);
            bos.write(bs);
        } catch (Exception e) {
            log.debug("文件保存失败！");
        } finally {
            if (bos != null) {
                try {
                    bos.close();
                    fos.close();
                } catch (IOException e) {
                    log.error("保存文件流失败");
                }
            }
        }
        return url + suffix + ".jpg";
    }

    public static String downloadPic(String imageUrl) {
        String base64Image = "";
        try {
            File file = new File(imageUrl);
            byte[] imageBytes = Files.readAllBytes(file.toPath());
            base64Image = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageBytes);
        } catch (Exception e) {
            log.error("图片文件读取错误: ", imageUrl);
        }
        return base64Image;
    }

    public static String downloadPicBase64(String imageUrl) {
        String base64Image = "";
        try {
            File file = new File(imageUrl);
            byte[] imageBytes = Files.readAllBytes(file.toPath());
            base64Image = Base64.getEncoder().encodeToString(imageBytes);
        } catch (Exception e) {
            log.error("图片文件读取错误: ", imageUrl);
        }
        return base64Image;
    }


    @Override
    public AjaxResult addBlog(Blog blog) {
        blog.setCreateTime(DateUtils.getNowDate());

        blog.setType(blog.getType().toLowerCase());

        //存储图片，将base64转换为图片存储到本地，数据库存储路径
        if (StringUtils.isNotBlank(blog.getImage())) {
            String imageUrl = saveImage(blog.getImage());
            blog.setImageUrl(imageUrl);
        }

        //存储markdown文件
        String url = saveMarkDown(blog.getTitle(), blog.getText());
        blog.setText(url);

        // 初始化数据
        blog.setVideoCount(0);
        blog.setCommonCount(0);
        boolean save = this.save(blog);
        return save ? AjaxResult.success() : AjaxResult.error();
    }

    // 分页查询
    @Override
    public List<Blog> listBlog(Blog blog) {
        // 根据时间查询出
        LambdaQueryWrapper<Blog> lqw = new LambdaQueryWrapper<>();
        lqw.orderByDesc(Blog::getCreateTime);
        List<Blog> list = this.list(lqw);

        // 根据标签获取文章
        lqw.eq(StringUtils.isNotBlank(blog.getType()), Blog::getType, blog.getType());

        for (Blog item : list) {
            tranData(item);
        }

        return list;
    }

    @Override
    public Blog getBlog(Long id) {
        Blog blog = this.getById(id);
        addVideoCount(blog);
        return tranData(blog);
    }

    @Override
    @DataSource(value = DataSourceType.LINUX)
    public List<Blog> selectAllLinuxBlog() {
        LambdaQueryWrapper<Blog> lqw = new LambdaQueryWrapper<>();
        lqw.orderByAsc(Blog::getCreateTime);
        return this.list(lqw);
    }

    @Override
    @DataSource(value = DataSourceType.LINUX)
    public void insertLinuxBlog(Blog blog) {
        this.save(blog);
    }

    @Override
    public List<Blog> selectAllBlog() {
        LambdaQueryWrapper<Blog> lqw = new LambdaQueryWrapper<>();
        lqw.orderByAsc(Blog::getCreateTime);
        return this.list(lqw);
    }

    // 添加浏览量
    @Async
    public void addVideoCount(Blog blog) {
        blog.setVideoCount(blog.getVideoCount() + 1);
        this.updateById(blog);
    }

    public Blog tranData(Blog blog) {
        if (StringUtils.isNotBlank(blog.getImageUrl())) {
            blog.setImage(downloadPic(blog.getImageUrl()));
        }
        if (StringUtils.isNotBlank(blog.getText())) {
            try {
                blog.setText(new String(Files.readAllBytes(Paths.get(blog.getText()))));
            } catch (IOException e) {
                log.error("md文件读取错误");
            }
        }
        return blog;
    }

    private String saveMarkDown(String title, String text) {
        String url = null;
        String os = System.getProperty("os.name").toLowerCase();
        if (os.contains("win")) {
            url = "D:\\blog\\md\\";
        } else if (os.contains("nux") || os.contains("nix")) {// Linux 或 UNIX 操作系统
            url = "/home/blog/md/";
        }

        File file = new File(url);

        if (!file.exists()) {
            file.mkdirs();
        }

        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        String suffix = df.format(new Date());
        url = url + title + suffix + ".md";

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(url))) {
            writer.write(text);
            log.info("Markdown 文件创建成功" + url);
        } catch (IOException e) {
            log.error("无法创建 Markdown 文件: " + e.getMessage());
        }
        return url;
    }

}
