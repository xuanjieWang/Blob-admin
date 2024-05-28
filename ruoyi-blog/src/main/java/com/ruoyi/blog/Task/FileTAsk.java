package com.ruoyi.blog.Task;

import com.ruoyi.blog.Task.sftp.FileUploadUtils;
import com.ruoyi.blog.entity.Blog;
import com.ruoyi.blog.service.IBlogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;

@Component
public class FileTAsk {

    protected static final Logger log = LoggerFactory.getLogger(FileTAsk.class);
    @Autowired
    private IBlogService blogService;

    @Autowired
    private FileUploadUtils fileUpload;

    @PostConstruct
    public void init() {
        FileUpdateTask();
    }

    @Scheduled(cron = "0 30 3 * * ?")
    public void FileUpdateTask() {
        List<Blog> list = blogService.selectAllBlog();
        log.info("获取本地端的数据----" + list.size());
        List<Blog> result = blogService.selectAllLinuxBlog();
        log.info("获取服务器端的数据----" + result.size());
        if (list.size() == result.size()) return;

        log.info("start data tran");

        fileUpload.uploadFile(list, result);
    }
}
