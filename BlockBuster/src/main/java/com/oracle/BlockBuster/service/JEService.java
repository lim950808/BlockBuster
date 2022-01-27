package com.oracle.BlockBuster.service;

import java.util.List;

import com.oracle.BlockBuster.model.Product;

public interface JEService {

	int total();

	List<Product> listProduct(Product product);

}
