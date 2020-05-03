package com.nongzi.service;

import com.github.pagehelper.PageInfo;
import com.nongzi.pojo.Product;
import com.nongzi.pojo.ProductDO;

/**
 * @author saykuray
 * @date 2020/5/3 21:42
 */
public interface ProductManagementService {

    /**
     * 分页条件查询所有产品信息
     * @param productDO
     * @return
     */
    PageInfo<Product> selectProductByPage(int start, int length, ProductDO productDO);

    /**
     * 根据id查询农产品
     * @param id
     * @return
     */
    Product selectProductById(int id);

    /**
     * 添加农产品
     * @param product
     * @return
     */
    int insertProductById(Product product);

    /**
     * 修改农产品
     * @param product
     * @return
     */
    int updateProductById(Product product);

    /**
     * 删除农产品
     * @param id
     * @return
     */
    int deleteProductById(int id);
}
