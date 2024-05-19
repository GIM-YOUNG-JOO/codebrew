package com.mycompany.codebrew.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.codebrew.dao.PaymentsDao;
import com.mycompany.codebrew.dto.CartProductDetailProduct;
import com.mycompany.codebrew.dto.Payment;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PaymentsService {
	@Autowired
	private PaymentsDao paymentsDao;

	public List<CartProductDetailProduct> getCartList(String acId) {
		return paymentsDao.selectCartList(acId);
	}

	public void paymentComplete(Payment payment) {

		//카트 내의 pdid 가져오기
		List<CartProductDetailProduct> CartList = paymentsDao.selectCartList(payment.getAcId());
		//결제 테이블 insert - 주문내역번호 반환값 받음
		paymentsDao.insertPayment(payment);
		//결제 상세 insert
		for(CartProductDetailProduct cart : CartList) {
			paymentsDao.insertPaymentDetail(payment.getPaId(), cart.getPdId());
		}
		//카트 비우기
		paymentsDao.deleteCartList(payment.getAcId());
	}
	
	public List<Payment> getPaymentsList() {
		List<Payment> paymentList = paymentsDao.selectPayments();
		for(Payment list : paymentList) {
			list.setDetailCount(list.getPaymentDetail().size()+1);
		}
		return paymentList;
	}

	public List<Payment> getPaymentsListByAcId(String acId) {
		List<Payment> paymentList = paymentsDao.selectPaymentsByAcId(acId);
		for(Payment list : paymentList) {
			list.setDetailCount(list.getPaymentDetail().size()+1);
		}
		return paymentList;
	}
}
