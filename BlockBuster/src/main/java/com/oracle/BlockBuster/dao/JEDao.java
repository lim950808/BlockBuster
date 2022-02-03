package com.oracle.BlockBuster.dao;

import java.util.List;

import com.oracle.BlockBuster.model.Product;

public interface JEDao {

	int total();

	List<Product> listProduct(Product product);

	Product detail(int pno);

	int update(Product product);

	List<Product> listManager();

	int insert(Product product);

	int delete(int pno);

	public List<Product> list(int genre, int category) throws Exception;
	
	public List<Product> list(int genre) throws Exception;
	
	Product productDetail(int pno);


}
