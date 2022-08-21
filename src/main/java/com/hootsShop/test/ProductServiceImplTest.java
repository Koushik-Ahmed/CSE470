package com.hootsShop.test;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.hootsShop.service.ProductService;
import com.hootsShop.service.ProductServiceImpl;

class ProductServiceImplTest {
	
	private ProductService productService;

	@BeforeEach
	void setUp() throws Exception {
		productService = new ProductServiceImpl();
	}

	@Test
	void testGetDiscountedPrice() {
		assertEquals(24.5, productService.getDiscountedPrice(25.0, 2.0), 0);
		assertEquals(189.05, productService.getDiscountedPrice(199.0, 5.0), 0);
		assertEquals(220.5, productService.getDiscountedPrice(245.0, 10.0), 0);
		assertEquals(2286.24, productService.getDiscountedPrice(2598.0, 12.0), 0);
	}

}
