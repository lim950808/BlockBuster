package com.oracle.BlockBuster.controller;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.BlockBuster.model.Product;
import com.oracle.BlockBuster.service.JEService;
import com.oracle.BlockBuster.service.Paging;

@Controller
public class JEController {

	private static final Logger logger = LoggerFactory.getLogger(JEController.class);
	
	@Autowired
	private JEService js;
	
	@RequestMapping(value = "productList")
	public String productlist(Product product, String currentPage, Model model) {
		int total = js.total();
		Paging pg = new Paging(total, currentPage);
		product.setStart(pg.getStart());
		product.setEnd(pg.getEnd());
		
		List<Product> listProduct = js.listProduct(product);
		model.addAttribute("listProduct", listProduct);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);
		
		return "productList";
	}
	
}
