package com.oracle.BlockBuster.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.BlockBuster.dao.JEDao;
import com.oracle.BlockBuster.model.Product;

@Service
public class JEServiceImpl implements JEService {
	
	@Autowired
	private JEDao jd;

	@Override
	public int total() {
		int totCnt = jd.total();
		return totCnt;
	}

	@Override
	public List<Product> listProduct(Product product) {
		List<Product> productList = null;
		productList = jd.listProduct(product);
		return productList;
	}
	
	@Override
	public Product detail(int pno) {
		Product product = null;
		product = jd.detail(pno);
		return product;
	}

	@Override
	public int update(Product product) {
		int uptCnt = 0;
		uptCnt = jd.update(product);
		return uptCnt;
	}

	@Override
	public List<Product> listManager() {
		List<Product> productList = null;
		productList = jd.listManager();
		return productList;
	}

	@Override
	public int insert(Product product) {
		int result = 0;
		result = jd.insert(product);
		return result;
	}

	@Override
	public int delete(int pno) {
		int result = 0;
		result = jd.delete(pno);
		return result;
	}

}
