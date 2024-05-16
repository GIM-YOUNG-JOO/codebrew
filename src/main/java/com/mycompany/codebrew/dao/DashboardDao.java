package com.mycompany.codebrew.dao;

import org.apache.ibatis.annotations.Mapper;
import com.mycompany.codebrew.dto.Account;
import com.mycompany.codebrew.dto.Cart;

@Mapper
public interface DashboardDao {
	
	public int countUser();
	public int countMenu();
	public int totalSalesCount();
	public int totalSalesRevenue();
}
