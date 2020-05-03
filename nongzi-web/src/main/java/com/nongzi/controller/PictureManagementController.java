package com.nongzi.controller;

import com.nongzi.pojo.enums.ResultCode;
import com.nongzi.pojo.vo.ResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

/**
 * 上传图片的逻辑。
 * 1. 前端上传图片到后台
 * 2. 在mvc接受图片， 保存图片到服务器中
 * 3. 调用service层更新数据库图片指向
 *
 * @author saykuray
 * @date 2020/4/29 14:34
 */
@Controller
@RequestMapping("/admin/picture")
public class PictureManagementController {

    @GetMapping("/get")
    public String getPage() {
        return "admin/show/adminImg";
    }

    /**
     * 保存上传的轮播图片
     * @param file
     * @param fileName 文件名: lb1.jpg
     * @param session
     * @return
     */
    @PostMapping("/upload")
    @ResponseBody
    public ResultVO upload(@RequestParam("file") MultipartFile file,
                           String fileName, HttpSession session) throws IOException {
        // 如果文件不为空
        if (!file.isEmpty()) {
            // 获取存放目录
            String realPath = session.getServletContext().getRealPath("/image/trimImg/");
            // 创建要保存的图片
            File newFile = new File(realPath, fileName);
            // 判断路径是否存在，不存在则创建一个路径
            if (!newFile.getParentFile().exists()) {
                newFile.getParentFile().mkdirs();
            }
            // 删除原来的旧图片
            newFile.delete();
            // 替换成新的图片
            file.transferTo(new File(realPath + File.separator + fileName));
            return new ResultVO(ResultCode.REQUIRED_SUCCESS);
        } else {
            return new ResultVO(ResultCode.BAD_REQUEST);
        }
    }
}
