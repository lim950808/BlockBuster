package com.oracle.BlockBuster.dao;

import java.util.List;

import com.oracle.BlockBuster.model.Product;

public interface JEDao {

	int total();

	List<Product> listEmp(Product product);

}
