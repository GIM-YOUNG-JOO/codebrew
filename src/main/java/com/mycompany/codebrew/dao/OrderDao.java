package com.mycompany.codebrew.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.codebrew.dto.Product;


@Mapper
public interface OrderDao {
	public List<Product> selectByCoffee();
	public List<Product> selectByBeveridge();
	public List<Product> selectByBean();
	public List<Product> selectByMerchandise();
}
