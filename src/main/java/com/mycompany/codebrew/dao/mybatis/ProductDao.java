package com.mycompany.codebrew.dao.mybatis;

import org.apache.ibatis.annotations.Mapper;
import com.mycompany.codebrew.dto.Account;
import com.mycompany.codebrew.dto.Cart;
import com.mycompany.codebrew.dto.Product;

@Mapper
public interface ProductDao {
	public int insert(Product product);
}
