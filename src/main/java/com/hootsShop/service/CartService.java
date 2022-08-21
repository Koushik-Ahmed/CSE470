package com.hootsShop.service;

import java.util.List;

import com.hootsShop.entity.Cart;
import com.hootsShop.service.CartServiceImpl.CartWrapper;

public interface CartService {
	
	public Integer createNewCart(Integer userid, Integer productId, Integer quantity);
	public Cart getCartById(Integer cartId);
	public void removeCart(Integer cartId);
	public List<CartWrapper> getUserCarts(Integer userId);

}
