package com.hootsShop.dao;

import com.hootsShop.entity.User;

public interface UserDAO {
	
	public User userLogin(String email, String password);
	
	public void addUser(User newUser);

	public String getUsernameById(Integer sellerId);
}
