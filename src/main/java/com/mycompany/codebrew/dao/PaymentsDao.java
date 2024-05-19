package com.mycompany.codebrew.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.codebrew.dto.CartProductDetailProduct;
import com.mycompany.codebrew.dto.Payment;


@Mapper
public interface PaymentsDao {

	List<CartProductDetailProduct> selectCartList(String acId);

	void insertPayment(Payment payment);
	
	void insertPaymentDetail(@Param("paId")int paId,  @Param("pdId")int pdId);

	void deleteCartList(String acId);
	
	List<Payment> selectPayments();

	List<Payment> selectPaymentsByAcId(String acId);
}
