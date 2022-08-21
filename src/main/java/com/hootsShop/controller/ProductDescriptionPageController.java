package com.hootsShop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hootsShop.entity.Product;
import com.hootsShop.service.CartService;
import com.hootsShop.service.ProductService;
import com.hootsShop.service.UserService;

@Controller
public class ProductDescriptionPageController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CartService cartService;
	
	@GetMapping("/product")
	public String showProductDescriptionPage(@RequestParam Integer productId, Model model) {
		Product product = productService.getProduct(productId);
		
		model.addAttribute("product", product);
		model.addAttribute("sellerName", userService.getUsernameById(product.getSellerId()));
		model.addAttribute("currentUser", userService.getCurrentUser());

		return "product-description-page";
	}
	
	@RequestMapping(value = "/addToCart", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String addToCart(@RequestParam Integer quantity, @RequestParam Integer productId) {
		cartService.createNewCart(userService.getCurrentUser().getId(), productId, quantity);
		
		return "Ok";
	}
}
