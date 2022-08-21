package com.hootsShop.dao;

import java.util.List;

import com.hootsShop.entity.Cart;

public interface CartDAO {
	
	public Integer saveCart(Cart cart);
	public Cart getCart(Integer cartId);
	public void removeCart(Integer cartId);
	public List<Cart> getUserCarts(Integer userId);
}
