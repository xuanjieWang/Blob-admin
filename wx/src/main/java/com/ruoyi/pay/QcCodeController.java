package com.ruoyi.pay;

import com.google.zxing.EncodeHintType;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import net.glxn.qrgen.core.exception.QRGenerationException;
import net.glxn.qrgen.core.image.ImageType;
import net.glxn.qrgen.javase.QRCode;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;

@Api(tags = "二维码工具")
@Slf4j
@RestController
@RequestMapping("/qccode")
public class QcCodeController {

    public static void qrCode(HttpServletResponse response, String url,
                              Integer width, Integer height)
            throws IOException {
        log.info("[二维码]====二维码生成 传入参数 url={} width={} height={}", url, width, height);
        if (url == null || "".equals(url)) {
            log.warn("[二维码]====传入url为空");
            return;
        }
        width = (width == null ? 260 : width);
        height = (height == null ? 260 : height);
        OutputStream stream = null;
        try {
            QRCode qrCode = QRCode.from(url);
            //定义二维码的参数
            qrCode.to(ImageType.PNG);
            qrCode.withSize(width, height);
            qrCode.withHint(EncodeHintType.CHARACTER_SET, "UTF-8");
            qrCode.withHint(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
            qrCode.withHint(EncodeHintType.MARGIN, 2);
            //生成二维码
            stream = response.getOutputStream();
            qrCode.writeTo(stream);
        } catch (QRGenerationException e) {
            e.printStackTrace();
            log.warn("[二维码]====生成二维码时发生异常 e={}", e.getMessage());
        } finally {
            if (stream != null) {
                stream.flush();
                stream.close();
            }
        }

    }

    /**
     * 生成二维码
     *
     * @param res    HttpServletResponse
     * @param url    需要转换的url
     * @param width  二维码宽度 默认260
     * @param height 二维码高度 默认260
     */
    @ApiOperation("生成二维码")
    @GetMapping("makeQrCode")
    public void makeQrCode(HttpServletResponse res, String url,
                           Integer width, Integer height) {

        try {
            qrCode(res, url, width, height);
        } catch (Exception e) {

        }

    }


}
