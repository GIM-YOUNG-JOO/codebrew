package com.mycompany.codebrew.dto;

import java.sql.Clob;

import lombok.Data;

@Data
public class Product {
	private int prId;
	private String prName;
	private int pcId;
	private int prPrice;
	private Clob prInfo;
	private Clob prMemo;
	private byte[] prImage;
}
