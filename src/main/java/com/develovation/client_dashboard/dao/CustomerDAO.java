package com.develovation.client_dashboard.dao;

import java.util.List;

import com.develovation.client_dashboard.entity.Customer;

public interface CustomerDAO {
	List<Customer> getCustomers();

	void saveCustomer(Customer theCustomer);

	Customer getCustomer(int theId);

	void deleteCustomer(int theId);

	List<Customer> searchCustomers(String searchName);
}
