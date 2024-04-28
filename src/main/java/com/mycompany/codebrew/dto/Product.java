package com.mycompany.codebrew.dto;

import java.sql.Blob;
import java.sql.Clob;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	
	private int prId;
	private String prName;
	private int pcId;
	private int prPrice;
	private Clob prInfo;
	private Clob prMemo;
	private Blob prImage;
}
