package com.mycompany.codebrew.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.codebrew.dto.CartProductDetailProduct;


@Mapper
public interface PaymentsDao {

	List<CartProductDetailProduct> selectCartList(String acId);
	
}
