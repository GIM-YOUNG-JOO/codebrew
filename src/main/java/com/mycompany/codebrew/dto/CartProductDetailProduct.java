package com.mycompany.codebrew.dto;

import lombok.Data;

@Data
public class CartProductDetailProduct {
	private int caId;
	private int pdId;
	private int pdShotCount;
	private int pdCount;
	private int prId;
	private String prName;
	private int prPrice;
	private String prInfo;
	private byte[] prImgData;
	private String prImageOut;
	private String bopName;
	private String sopName;
	private String topName;
}
