package com.mycompany.codebrew.dto;

import lombok.Data;

@Data
public class Dashboard {
	private int userCount;
	private int totalSalesCount;
	private int totalSalesRevenue;
	private int menuCount;
	private int maker = 4;
}
