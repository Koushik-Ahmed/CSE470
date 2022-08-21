package com.hootsShop.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hootsShop.dao.ProductDAO;
import com.hootsShop.entity.Product;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	@Transactional
	public List<Product> getProducts() {
		return productDAO.getProducts();
	}

	@Override
	@Transactional
	public Product getProduct(Integer productId) {
		return productDAO.getProduct(productId);
	}

	@Override
	@Transactional
	public List<Product> searchProduct(String searchString) {
		return productDAO.searchProduct(searchString);
	}

	@Override
	@Transactional
	public void addProduct(Product newProduct) {
		productDAO.addProduct(newProduct);
	}

	@Override
	public Double getDiscountedPrice(Double actualPrice, Double discountRate) {
		return actualPrice - ((discountRate/100) * actualPrice);
	}

}
