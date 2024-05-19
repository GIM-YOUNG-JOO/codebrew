package com.mycompany.codebrew.dto;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class Payment {
	
	private int paId; // 결제코드
	private String acId; // 계정코드
	private int pdId;
	private int paPdCount;
	private String paName;
	private String paTel;
	private Date paDate;
	private String paRequest;
	private int paPay;
	private int brId;
	private String brName;
	private List<PaymentDetail> paymentDetail;
	private int detailCount;
}
