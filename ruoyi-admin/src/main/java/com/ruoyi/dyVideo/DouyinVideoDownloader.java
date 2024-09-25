package com.ruoyi.dyVideo;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class DouyinVideoDownloader {

    public static void main(String[] args) {
        // 示例视频 URL，请替换成实际的视频下载链接
        String videoUrl = "https://example.com/video.mp4";
        String outputFileName = "video.mp4";

        try {
            downloadVideo(videoUrl, outputFileName);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void downloadVideo(String videoUrl, String outputFileName) throws IOException {
        URL url = new URL(videoUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");

        // 检查响应代码
        int responseCode = connection.getResponseCode();
        if (responseCode != HttpURLConnection.HTTP_OK) {
            throw new IOException("Failed to connect: HTTP response code " + responseCode);
        }

        // 获取输入流
        try (InputStream inputStream = new BufferedInputStream(connection.getInputStream());
             FileOutputStream fileOutputStream = new FileOutputStream(outputFileName)) {

            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                fileOutputStream.write(buffer, 0, bytesRead);
            }
        } finally {
            connection.disconnect();
        }
    }
}
