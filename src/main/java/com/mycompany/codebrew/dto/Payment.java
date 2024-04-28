package com.mycompany.codebrew.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment {
	
	private int paId;
	private int acId;
	private int pdId;
	private int paPdCount;
	private String paName;
	private String paTel;
	private Date paDate;
	private String paRequest;
	private int paPay;
	private int brId;
	
}
