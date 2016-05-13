package com.test.soumen.service;

import java.util.List;
import com.test.soumen.model.Product;

public interface ProductService {

	List<Product> getProductDetails(Product product);
	Product saveProductDetails(Product product);
	void deleteProductDetails(String id);
}