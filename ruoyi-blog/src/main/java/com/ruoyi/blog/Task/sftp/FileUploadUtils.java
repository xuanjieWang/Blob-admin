package com.ruoyi.blog.Task.sftp;

import com.ruoyi.blog.entity.Blog;
import com.ruoyi.blog.service.IBlogService;
import com.ruoyi.blog.service.impl.BlogServiceImpl;
import lombok.Data;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

@Component
@ConfigurationProperties(prefix = "sftp")
@Data
public class FileUploadUtils {

    protected static final Logger log = LoggerFactory.getLogger(FileUploadUtils.class);
    private String ip;
    private String port;
    private String username;
    private String password;
    private String winFilePath;
    private String linFilePath;

    @Autowired
    private IBlogService blogService;

    /**
     * 模拟上传文件到sftp服务器：
     * 代码生成数据，写入文件并上传到sftp服务器；
     */
    public void uploadFile(List<Blog> list, List<Blog> result) {

        if (!System.getProperty("os.name").toLowerCase().contains("win")) return;
        log.info("sftp客户端创建------: " + ip, port, username, password);

        SftpClient sftp = new SftpClient(null, ip, Integer.parseInt(port), username, password);

        for (int i = result.size(); i < list.size(); i++) {
            Blog blog = list.get(i);
            if (null != blog.getImageUrl()) {
                String imgUrl = blog.getImageUrl();
                try {
                    InputStream in = Base64Util.baseToInputStream(BlogServiceImpl.downloadPicBase64(imgUrl));
                    sftp.upload(linFilePath + "/img", blog.getImageUrl().replace(winFilePath + "\\img\\", ""), in);
                    blog.setImageUrl(linFilePath + "/img/" + blog.getImageUrl().replace(winFilePath + "\\img\\", ""));
                    log.info("img文件上传到服务器成功" + imgUrl);

                } catch (IOException e) {
                    log.error("img文件读取错误" + imgUrl);
                }
            }

            if (null != list.get(i).getText()) {
                String mdPath = blog.getText();
                try {
                    String md = new String(Files.readAllBytes(Paths.get(mdPath)));
                    ByteArrayInputStream in = new ByteArrayInputStream(md.getBytes());
                    sftp.upload(linFilePath + "/md", mdPath.replace(winFilePath + "\\md\\", ""), in);
                    blog.setText(linFilePath + "/md/" + blog.getText().replace(winFilePath + "\\md\\", ""));
                    log.info("md文件上传到服务器成功" + mdPath);
                } catch (IOException e) {
                    log.error("md文件读取错误" + mdPath);
                }
            }
            blogService.insertLinuxBlog(blog);
        }
        sftp.close();
    }
}