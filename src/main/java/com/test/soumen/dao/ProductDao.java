package com.test.soumen.dao;

import java.util.List;

import com.test.soumen.model.Product;

public interface ProductDao {

	List<Product> getProductDetails(Product product);
	Product saveProductDetails(Product product);
	void deleteProductDetails(String id);

}
