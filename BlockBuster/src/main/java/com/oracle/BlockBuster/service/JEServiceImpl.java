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
		productList = jd.listEmp(product);
		return productList;
	}

}
