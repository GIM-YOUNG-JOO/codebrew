package com.mycompany.codebrew.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDetail {
	
	private int pdId;
	private int pdShotCount;
	private int pdCount;

	private int prId;
	private String prName;
	private byte[] prImgData;
	private String prImageOut;
	
	private int bopId;
	private int sopId;
	private int topId;
}
