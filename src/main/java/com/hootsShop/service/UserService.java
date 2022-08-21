package com.hootsShop.service;

import com.hootsShop.entity.User;

public interface UserService {
	
	public User userLogin(String email, String password);
	
	public void userLogout();

	public User getCurrentUser();

	public void addUser(User newUser);

	public String getUsernameById(Integer sellerId);
}
