package com.test.soumen.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.soumen.dao.ProductDao;
import com.test.soumen.model.Product;
import com.test.soumen.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao productDao;
	
	@Override
	public List<Product> getProductDetails(Product product) {
		return productDao.getProductDetails(product);
	}

	@Override
	public Product saveProductDetails(Product product) {
		return productDao.saveProductDetails(product);
	}

	@Override
	public void deleteProductDetails(String id) {
		productDao.deleteProductDetails(id);	
	}

	
}
