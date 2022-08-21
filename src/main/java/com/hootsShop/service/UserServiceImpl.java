package com.hootsShop.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hootsShop.dao.UserDAO;
import com.hootsShop.entity.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	private static User currentUser = null;

	@Override
	@Transactional
	public User userLogin(String email, String password) {
		User mathcedUser = userDAO.userLogin(email, password);
		currentUser = mathcedUser;
		
		return mathcedUser;
	}
	
	@Override
	public User getCurrentUser() {
		return currentUser;
	}

	@Override
	public void userLogout() {
		currentUser = null;
	}

	@Override
	@Transactional
	public void addUser(User newUser) {
		userDAO.addUser(newUser);
	}

	@Override
	@Transactional
	public String getUsernameById(Integer sellerId) {
		return userDAO.getUsernameById(sellerId);
	}

}
