package com.hootsShop.service;

import java.util.List;

import com.hootsShop.entity.Product;

public interface ProductService {
	
	public List<Product> getProducts();
	
	public Product getProduct(Integer productId);

	public List<Product> searchProduct(String searchString);

	public void addProduct(Product newProduct);
	
	public Double getDiscountedPrice(Double actualPrice, Double discountRate);
}
