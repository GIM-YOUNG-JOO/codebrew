package com.mycompany.codebrew.dto;

import lombok.Data;

@Data
public class Product {
	private int prId;
	private String prName;
	private int pcId;
	private int prPrice;
	//private Clob prinfo;
	//private Clob prmemo;
	private byte[] prImage;
}
