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

	//상품상세페이지
	Product getProductsInfo(int pno);
}
