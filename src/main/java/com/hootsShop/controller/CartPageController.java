package com.hootsShop.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hootsShop.service.CartService;
import com.hootsShop.service.CartServiceImpl.CartWrapper;
import com.hootsShop.service.ProductService;
import com.hootsShop.service.UserService;

@Controller
public class CartPageController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/showCartPage")
	public String showCartPage(Model model) {
		List<CartWrapper> carts;
		double totalPrice = 0.0;
		
		if(userService.getCurrentUser() == null) {
			carts = new ArrayList<>();
		} else {
			carts = cartService.getUserCarts(userService.getCurrentUser().getId());
			
			for (CartWrapper cart : carts) {
				double price = productService.getDiscountedPrice(cart.getProduct().getPrice(), cart.getProduct().getDiscountRate());
				int quantity = cart.getCart().getQuantity();
				
				totalPrice += (price * quantity);
			}
		}
		
		model.addAttribute("carts", carts);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("currentUser", userService.getCurrentUser());
		
		return "cart-page";
	}
	
	@PostMapping("/removeCart")
	@ResponseBody
	public String removeCart(@RequestParam Integer cartId) {
		cartService.removeCart(cartId);
		
		return "Ok";
	}
}
