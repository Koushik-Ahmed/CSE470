package com.hootsShop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hootsShop.entity.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Product> getProducts() {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Product> query = currentSession.createQuery("from Product", Product.class);
		
		List<Product> products = query.getResultList();
		
		return products;
	}

	@Override
	public Product getProduct(Integer productId) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Product product = currentSession.get(Product.class, productId);
		
		return product;
	}

	@Override
	public List<Product> searchProduct(String searchString) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Product> query;
		
		if((searchString != null) && (searchString.trim().length() > 0)) {
			query = currentSession.createQuery("from Product where lower(title) like :searchString", Product.class);
			query.setParameter("searchString", "%" + searchString.toLowerCase() + "%");
		} else {
			// Search string is empty so return all products
			query = currentSession.createNamedQuery("from Product", Product.class);
		}
		
		List<Product> products = query.getResultList();
		
		return products;
	}

	@Override
	public void addProduct(Product newProduct) {
		Session currnetSession = sessionFactory.getCurrentSession();
		
		currnetSession.save(newProduct);
	}

}
