package com.oracle.BlockBuster.service;

import java.util.List;

import com.oracle.BlockBuster.model.Product;

public interface JEService {

	int total();

	List<Product> listProduct(Product product);

	Product detail(int pno);

	int update(Product product);

	List<Product> listManager();

	int insert(Product product);

	int delete(int pno);

}
