package com.mycompany.codebrew.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Product {
	private int prId;
	private String prName;
	private int pcId;
	private String pcName;
	private int prPrice;
	private String prInfo;
	private String prMemo;
	private byte[] prImgData;
	private String prImageOut;
	private MultipartFile prImage;
}
