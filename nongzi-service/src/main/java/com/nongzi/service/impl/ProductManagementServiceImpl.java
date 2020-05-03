package com.nongzi.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nongzi.dao.ProductMapper;
import com.nongzi.pojo.Product;
import com.nongzi.pojo.ProductDO;
import com.nongzi.service.ProductManagementService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author saykuray
 * @date 2020/5/3 21:43
 */
@Service
public class ProductManagementServiceImpl implements ProductManagementService {

    @Resource
    private ProductMapper productMapper;

    @Override
    public PageInfo<Product> selectProductByPage(int start, int length, ProductDO productDO) {
        PageHelper.startPage(start, length);
        List<Product> products = productMapper.selectProductByPage(productDO);
        return new PageInfo<>(products);
    }

    @Override
    public Product selectProductById(int id) {
        return productMapper.selectByPrimaryKey(id);
    }

    @Override
    public int insertProductById(Product product) {
        return productMapper.insert(product);
    }

    @Override
    public int updateProductById(Product product) {
        return productMapper.updateByPrimaryKeySelective(product);
    }

    @Override
    public int deleteProductById(int id) {
        return productMapper.deleteByPrimaryKey(id);
    }
}
