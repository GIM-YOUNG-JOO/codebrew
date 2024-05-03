package com.mycompany.codebrew.dto;

<<<<<<< HEAD
import org.springframework.web.multipart.MultipartFile;
=======
import java.sql.Clob;
>>>>>>> refs/remotes/origin/master

import lombok.Data;

@Data
public class Product {
	private int prId;
	private String prName;
	private int pcId;
	private int prPrice;
<<<<<<< HEAD
	private String prInfo;
	private String prMemo;
	private byte[] prImgData;
	
	private MultipartFile prImage;
=======
	private Clob prInfo;
	private Clob prMemo;
	private byte[] prImage;
>>>>>>> refs/remotes/origin/master
}
