package com.hootsShop.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hootsShop.entity.Product;
import com.hootsShop.service.ProductService;
import com.hootsShop.service.UserService;

@Controller
public class SearchPageController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/search")
	public String showSearchPage(@RequestParam(required = false) String searchString, Model model) {
		List<Product> matchedProducts;
		
		searchString = searchString.trim();
		
		if (searchString.equals("")) {
			matchedProducts = new ArrayList<>();
		} else {
			matchedProducts = productService.searchProduct(searchString);
		} 
		
		model.addAttribute("searchString", searchString);
		model.addAttribute("matchedProducts", matchedProducts);
		model.addAttribute("currentUser", userService.getCurrentUser());

		return "search-page";
	}
}
