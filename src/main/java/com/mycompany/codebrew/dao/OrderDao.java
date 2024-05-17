package com.mycompany.codebrew.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.codebrew.dto.Cart;
import com.mycompany.codebrew.dto.CartProductDetailProduct;
import com.mycompany.codebrew.dto.Product;
import com.mycompany.codebrew.dto.ProductDetail;


@Mapper
public interface OrderDao {
	public List<Product> selectByCoffee();
	public List<Product> selectByBeveridge();
	public List<Product> selectByBean();
	public List<Product> selectByMerchandise();
	public Product selectCoffeeByPrId(int prId);
	public ProductDetail selectProductDetail(int pdId);
	public void insertCart(Cart cart);
	public List<CartProductDetailProduct> selectCartList(String acId);
	public void updateProductDetail(ProductDetail productDetail);
	public void deleteCart(Cart formData);
	public void deleteProductDetail(Cart formData);
	public int updateQuantityByPdid(CartProductDetailProduct cartItem);
}
