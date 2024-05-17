package com.mycompany.codebrew.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.codebrew.dto.CartProductDetailProduct;
import com.mycompany.codebrew.dto.Payment;


@Mapper
public interface PaymentsDao {

	List<CartProductDetailProduct> selectCartList(String acId);

	Payment selectByAcId(String acId);
	
}
