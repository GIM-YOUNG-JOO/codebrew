package com.mycompany.codebrew.dao.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.codebrew.dto.Pager;
import com.mycompany.codebrew.dto.Product;
import com.mycompany.codebrew.dto.ProductDetail;


@Mapper
public interface ProductDao {
	public int insert(Product product);
	public int count();
	public Product selectByPrId(int prId);
	public List<Product> selectByPage(Pager pager);
	public int update(Product product);
	public int deleteByprId(int prId);
	public int insertProductDetail(ProductDetail productDetail);
}
