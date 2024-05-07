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
<<<<<<< HEAD
	private String prImageOut;
	
=======
>>>>>>> refs/remotes/origin/master
	private MultipartFile prImage;

}
