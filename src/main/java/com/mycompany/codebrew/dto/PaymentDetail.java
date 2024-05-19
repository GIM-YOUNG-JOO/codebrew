package com.mycompany.codebrew.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class PaymentDetail {
	
	private int paId; // 결제코드
	private int acId; // 계정코드
	private int pdId;
    private String paName;
    private String paTel;
    private Date paDate;
    private String paRequest;
    private String brName;
    private String prName;
    private int prPrice;
    private String bopName;
    private String topName;
    private int pdShotCount;
    private int pdCount;

}
