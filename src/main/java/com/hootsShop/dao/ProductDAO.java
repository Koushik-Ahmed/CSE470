package com.hootsShop.dao;

import java.util.List;

import com.hootsShop.entity.Product;

public interface ProductDAO {

	public List<Product> getProducts();
	
	public Product getProduct(Integer productId);

	public List<Product> searchProduct(String searchString);

	public void addProduct(Product newProduct);
}
