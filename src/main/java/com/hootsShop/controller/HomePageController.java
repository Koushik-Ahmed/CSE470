package com.hootsShop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hootsShop.entity.Product;
import com.hootsShop.service.ProductService;
import com.hootsShop.service.UserService;

@Controller
public class HomePageController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/")
	public String showHomePage(@RequestParam(required = false) Integer category, Model model) {
		System.out.println(category);
		
		if (category == null) {
			category = 0;
		}
		
		List<Product> productList = productService.getProducts();
		
		model.addAttribute("homePageCategory", category);
		model.addAttribute("productList", productList);
		model.addAttribute("currentUser", userService.getCurrentUser());
		
		return "home-page";
	}
}
