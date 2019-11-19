package com.develovation.client_dashboard.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.develovation.client_dashboard.entity.Customer;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	// need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Customer> getCustomers() {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query
		Query<Customer> theQuery = currentSession.createQuery("from Customer order by lastName", Customer.class);
		
		//execute query and get result list
		List<Customer> customers = theQuery.getResultList();
		
		//return the results
		return customers;
	}

	@Override
	public void saveCustomer(Customer theCustomer) {
		
		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//save the customer
		currentSession.saveOrUpdate(theCustomer);
		
	}

	@Override
	public Customer getCustomer(int theId) {
		
		// get the current Hibernate Session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// retrieve/read from database using primary key
		Customer theCustomer = currentSession.get(Customer.class, theId);
		return theCustomer;
	}

	@Override
	public void deleteCustomer(int theId) {
		
		// get the current Hibernate Session
		Session currentSession = sessionFactory.getCurrentSession();
				
		// delete from database using primary key
		Customer theCustomer = currentSession.find(Customer.class, theId);
		currentSession.remove(theCustomer);
	}

	@Override
	public List<Customer> searchCustomers(String searchName) {
		
		// get the current Hibernate Session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// find from database using primary key
		Query<Customer> theQuery = null;
		if(searchName != null && searchName.trim().length() > 0) {
			theQuery = currentSession.createQuery("from Customer where lower(first_name) like :name OR lower(last_name) like :name", Customer.class);
			theQuery.setParameter("name", "%" + searchName.toLowerCase() + "%");
		}
		else {
			theQuery = currentSession.createQuery("from Customer", Customer.class);
		}
		
		List<Customer> customers = theQuery.getResultList();
		return customers;
	}

}
