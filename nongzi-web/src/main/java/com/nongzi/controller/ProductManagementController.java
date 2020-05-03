package com.nongzi.controller;

import com.github.pagehelper.PageInfo;
import com.nongzi.pojo.Product;
import com.nongzi.pojo.ProductDO;
import com.nongzi.pojo.enums.ResultCode;
import com.nongzi.pojo.vo.PageResultVO;
import com.nongzi.pojo.vo.ResultVO;
import com.nongzi.service.ProductManagementService;
import com.nongzi.util.DateUtil;
import com.nongzi.util.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author saykuray
 * @date 2020/4/29 14:34
 */
@Controller
@RequestMapping("admin/product")
public class ProductManagementController {

    @Resource
    private ProductManagementService productManagementService;

    @GetMapping("/list")
    public String getPage() {
        return "admin/product/adminProduct";
    }

    @PostMapping("/page")
    @ResponseBody
    public PageResultVO<Product> page(@RequestParam("start") Integer start,
                                      @RequestParam("length") Integer length,
                                      ProductDO productDO) {
        PageInfo<Product> pageInfo = productManagementService.selectProductByPage(start / length + 1, length, productDO);
        return new PageResultVO<>(pageInfo.getTotal(), pageInfo.getTotal(), pageInfo.getList());
    }

    /**
     * 查询农产品
     * @param id
     * @return
     */
    @PostMapping("/id")
    @ResponseBody
    public ResultVO<Product> selectProductById(@RequestParam("sId") Integer id) {
        Product product = productManagementService.selectProductById(id);
        if (product == null) {
            return new ResultVO<>(ResultCode.BUSINESS_FAIL);
        } else {
            return new ResultVO<>(ResultCode.REQUIRED_SUCCESS, product);
        }
    }

    /**
     * 添加农产品
     * @param file
     * @param session
     * @param fileName
     * @param product
     * @return
     * @throws IOException
     */
    @PostMapping("/add")
    @ResponseBody
    public ResultVO add(@RequestParam("file") MultipartFile file, HttpSession session,
                        String fileName, Product product) throws IOException {
        if (file == null || file.isEmpty()) {
            return new ResultVO(ResultCode.BAD_REQUEST);
        }
        if (StringUtils.isEmpty(fileName)) {
            return new ResultVO(ResultCode.BAD_REQUEST);
        }
        Date day = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
        String sBatch=df.format(day).toString()+String.valueOf((int)(Math.random()*9000+1000));
        product.setsCreatedate(DateUtil.getCurrentDate());
        product.setsBatch(sBatch);
        product.setsPictureurl(fileName);
        // 调用service添加
        int count = productManagementService.insertProductById(product);
        if (count == 0) {
            return new ResultVO(ResultCode.BUSINESS_FAIL);
        }
        // 保存文件
        String path = session.getServletContext().getRealPath("/image/");
        File filePath = new File(path, fileName);
        if (!filePath.getParentFile().exists()) {
            filePath.mkdirs();
        }
        file.transferTo(new File(path + File.separator + fileName));
        return new ResultVO(ResultCode.REQUIRED_SUCCESS);
    }

    /**
     * 更新农产品
     */
    @PostMapping("/update")
    @ResponseBody
    public ResultVO update(MultipartFile file, HttpSession session,
                           String fileName, Product product) throws IOException {
        if (file != null) {
            product.setsPictureurl(fileName);
            productManagementService.updateProductById(product);
            String path = session.getServletContext().getRealPath("/image/");
            File filePath = new File(path, fileName);
            if (!filePath.getParentFile().exists()) {
                filePath.mkdirs();
            }
            filePath.delete();
            file.transferTo(new File(path + File.separator + fileName));
        } else {
            productManagementService.updateProductById(product);
        }
        return new ResultVO(ResultCode.REQUIRED_SUCCESS);
    }

    /**
     * 删除农产品
     * @param id
     * @return
     */
    @PostMapping("/del")
    @ResponseBody
    public ResultVO delete(@RequestParam("sId") Integer id) {
        int count = productManagementService.deleteProductById(id);
        if (count == 0) {
            return new ResultVO(ResultCode.BUSINESS_FAIL);
        } else {
            return new ResultVO(ResultCode.REQUIRED_SUCCESS);
        }
    }
}
