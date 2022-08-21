package com.hootsShop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hootsShop.entity.User;
import com.hootsShop.service.UserService;

@Controller
public class LoginPageController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/login")
	public String showLoginPage() {
		return "login-page";
	}
	
	@GetMapping("/login/verifyUser")
	public String verifyUser(@RequestParam String email, @RequestParam String password, Model model) {
		if (email.trim().equals("")|| password.trim().equals("")) {
			return "error";
		} else {
			userService.userLogin(email, password);
			
			return "redirect:/";
		}
	}
	
	@GetMapping("/logout")
	public String logout() {
		userService.userLogout();
		return "redirect:/";
	}
	
	@GetMapping("/showRegistrationForm")
	public String showRegistrationForm(Model model) {
		User newUser = new User();
		
		model.addAttribute("newUser", newUser);
		
		return "signup-page";
	}
	
	@RequestMapping("/registerUser")
	public String registerUser(@ModelAttribute User newUser) {
		System.out.println(newUser);

		userService.addUser(newUser);
		userService.userLogin(newUser.getEmail(), newUser.getPassword());

		return "redirect:/";
	}
}
