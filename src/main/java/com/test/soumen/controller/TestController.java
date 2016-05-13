package com.test.soumen.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.test.soumen.model.Json;
import com.test.soumen.model.Product;
import com.test.soumen.service.ProductService;

@RestController
public class TestController {

	@Autowired
	ProductService productService;

	@RequestMapping("/hello")
	public String hello() {

		return "Welcome to Spring BOOT";
	}

	@RequestMapping("/productslist/{type}")
	public Object productsJSON(@PathVariable("type") String type) {
		Product product=new Product();
		product.setType(type);
		
		List<Product> products = productService.getProductDetails(product);
		
		List<Json> finalJson=new ArrayList<>();
		for (Product product1 : products) {
			finalJson.add(new Json(product1.getName(), product1.getPrice()+""));
		}
		
		String json = new Gson().toJson(finalJson);
		return json;
		// return "myapp.products";
	}
}
