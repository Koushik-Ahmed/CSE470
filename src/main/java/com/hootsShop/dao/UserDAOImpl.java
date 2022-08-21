package com.hootsShop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hootsShop.entity.User;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public User userLogin(String email, String password) {
		if(email != null && password != null && email.trim().length() > 0 && password.trim().length() > 0) {
			Session currentSession = sessionFactory.getCurrentSession();
			
			Query<User> userQuery = currentSession.createQuery("from User where email=:userEmail and password=:userPassword", User.class);
			userQuery.setParameter("userEmail", email.trim());
			userQuery.setParameter("userPassword", password.trim());
			
			List<User> matchedUser = userQuery.getResultList();
			
			if(matchedUser.size() > 0) {
				return matchedUser.get(0);
			} else {
				return null;
			}
		}
		
		return null;
	}

	@Override
	public void addUser(User newUser) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<User> userQuery = currentSession.createQuery("from User where email=:userEmail", User.class);
		userQuery.setParameter("userEmail", newUser.getEmail());
		
		List<User> matchedUser = userQuery.getResultList();
		
		// Only add new user if no existing account whith the provided email exist
		if(matchedUser.size() == 0) {
			currentSession.save(newUser);
		}
	}

	@Override
	public String getUsernameById(Integer sellerId) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		User user = currentSession.get(User.class, sellerId);
		
		return user.getName();
	}

}
