package com.hootsShop.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.KeyStore.Entry;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.hootsShop.entity.Product;
import com.hootsShop.service.ProductService;
import com.hootsShop.service.UserService;

@Controller
public class AddProductPageController {

	@Autowired
	private UserService userService;

	@Autowired
	private ProductService productService;

	private static final Map<Integer, String> categories = new LinkedHashMap<>();

	private static final String UPLOAD_PATH = "resources/images/";

	static {
		categories.put(1, "Electronics");
		categories.put(2, "Gadgets");
		categories.put(3, "Toys");
	}

	@RequestMapping("/addProductPage")
	public String showAddProductPage(Model model) {

		model.addAttribute("categories", categories.entrySet());

		Product newProduct = new Product();
		model.addAttribute("newProduct", newProduct);

		return "add-product";
	}

	@PostMapping("/addProduct")
	public String addProduct(@RequestParam MultipartFile imageFile, @ModelAttribute Product newProduct,
			HttpSession session) {
		if (userService.getCurrentUser() != null) {
			// Validation (Only checks the consistency of the properties of different
			// product types)
			if (newProduct.getNewFlag() == 0) {
				newProduct.setWarrantyDuration(null);
			} else if (newProduct.getNewFlag() == 1) {
				newProduct.setUsageDuration(null);
			}

			newProduct.setSellerId(userService.getCurrentUser().getId());
			newProduct.setImagePath(imageFile.getOriginalFilename());

			// Upload the image file to server
			try {
				BufferedOutputStream outputStream = new BufferedOutputStream(new FileOutputStream(new File(
						session.getServletContext().getRealPath("/") + UPLOAD_PATH + imageFile.getOriginalFilename())));

				byte[] bytes = imageFile.getBytes();
				
				outputStream.write(bytes);
				outputStream.flush();
				outputStream.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			// Add product to database
			productService.addProduct(newProduct);
		}

		return "redirect:/";
	}
}
