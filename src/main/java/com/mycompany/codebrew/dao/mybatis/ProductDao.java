package com.mycompany.codebrew.dao.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.codebrew.dto.Pager;
import com.mycompany.codebrew.dto.Product;


@Mapper
public interface ProductDao {
	public int insert(Product product);
	public Product selectByPrId(int prId);
	public List<Product> selectByPage(Pager pager);
	public int count();
}
