package com.mycompany.codebrew.dto;

import lombok.Data;

@Data
public class Menu {
	private int prId;
	private String prName;
	private int prPrice;
	private byte[] prImgData;
	private String prImageOut;
}
