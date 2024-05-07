package com.mycompany.codebrew.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Product {
	private int prId;
	private String prName;
	private int pcId;
	private int prPrice;
	private String prInfo;
	private String prMemo;
	private byte[] prImgData;
	private String prImageOut;
<<<<<<< HEAD
=======
	
>>>>>>> branch 'master' of https://github.com/GIM-YOUNG-JOO/codebrew.git
	private MultipartFile prImage;
}
