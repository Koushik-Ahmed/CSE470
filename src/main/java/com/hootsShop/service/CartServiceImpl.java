package com.hootsShop.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hootsShop.dao.CartDAO;
import com.hootsShop.entity.Cart;
import com.hootsShop.entity.Product;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	private ProductService productService;
	
	@Override
	@Transactional
	public Integer createNewCart(Integer userid, Integer productId, Integer quantity){
		Cart cart = new Cart();
		cart.setUserId(userid);
		cart.setProductID(productId);
		cart.setQuantity(quantity);
		
		Integer savedCartID = cartDAO.saveCart(cart);
		
		return savedCartID;
	}
	
	@Override
	@Transactional
	public Cart getCartById(Integer cartId) {
		return cartDAO.getCart(cartId);
	}

	@Override
	@Transactional
	public void removeCart(Integer cartId) {
		cartDAO.removeCart(cartId);
	}

	// This can also be done by joining SQL tables
	@Override
	@Transactional
	public List<CartWrapper> getUserCarts(Integer userId) {
		List<CartWrapper> userCarts = new ArrayList<>();
		
		List<Cart> carts = cartDAO.getUserCarts(userId);
		
		for(Cart cart : carts) {
			if(cart.getUserId().equals(userId)) {
				userCarts.add(new CartWrapper(cart, productService.getProduct(cart.getProductID())));
			}
		}
		
		return userCarts;
	}
	
	public static class CartWrapper {
		private Cart cart;
		private Product product;
		
		public CartWrapper(Cart cart, Product product) {
			this.cart = cart;
			this.product = product;
		}

		public Cart getCart() {
			return cart;
		}

		public Product getProduct() {
			return product;
		}

	}

}
