package com.mycompany.codebrew.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDetail {
	
	private int pdId;
	private int prId;
	private int pdShotCount;
	private int pdCount;
	private int bopId;
	private int sopId;
	private int topId;
}
