package com.mycompany.codebrew.dao;

import org.apache.ibatis.annotations.Mapper;
import com.mycompany.codebrew.dto.Account;
import com.mycompany.codebrew.dto.Cart;
import com.mycompany.codebrew.dto.Product;
import com.mycompany.codebrew.dto.ProductCategory;

@Mapper
public interface ProductCategoryDao {
	public int insert(ProductCategory productCategory);
}
