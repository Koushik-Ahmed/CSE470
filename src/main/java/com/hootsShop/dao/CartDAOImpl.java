package com.hootsShop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hootsShop.entity.Cart;

@Repository
public class CartDAOImpl implements CartDAO {
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public Integer saveCart(Cart cart) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Integer savedCartId = (Integer) currentSession.save(cart);
		
		return savedCartId;
	}
	
	@Override
	public Cart getCart(Integer cartId) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Cart cart = currentSession.get(Cart.class, cartId);
		
		return cart;
	}

	@Override
	public void removeCart(Integer cartId) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query removeCartQuery = currentSession.createQuery("delete from Cart where id=:cartId");
		removeCartQuery.setParameter("cartId", cartId);
		
		removeCartQuery.executeUpdate();
	}

	@Override
	public List<Cart> getUserCarts(Integer userId) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query query = currentSession.createQuery("from Cart where userId=:user_id");
		query.setParameter("user_id", userId);
		
		List<Cart> carts = query.getResultList();
		
		return carts;
	}

}
