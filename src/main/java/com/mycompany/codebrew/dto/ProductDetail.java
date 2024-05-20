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
	private int pcId;
	
	private int bopId;
	private int sopId;
	private int topId;
	
	//카트아이템에 같은 옵션의 상품이 있는지를 검색하기 위해서 추가
	private String acId;
	private String prInfo;
}
