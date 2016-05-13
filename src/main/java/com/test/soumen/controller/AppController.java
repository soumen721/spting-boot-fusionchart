package com.test.soumen.controller;

import java.util.List;

import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.test.soumen.model.Product;
import com.test.soumen.service.ProductService;

@Controller
public class AppController {
	final static String queueName = "spring-boot";
	@Autowired
	RabbitTemplate rabbitTemplate;
	
	@Autowired
	ProductService productService;

	@RequestMapping("/")
	public String welcome(Model model) {
		String message = "Welcome to Spring MVC";
		model.addAttribute("welcomeMessage", message);
		return "myapp.homepage";
	}

	@RequestMapping("/products/{type}")
	public Object productList(@PathVariable("type") String type, Model model) {
		Product product=new Product();
		product.setType(type);
		
		List<Product> products = productService.getProductDetails(product);
		model.addAttribute("products", products);
		model.addAttribute("selType", type);
		
		
		
		return "myapp.products";
	}

	
	@RequestMapping(value = "/addproduct", method = RequestMethod.GET)
	public ModelAndView addProducts() {
		return new ModelAndView("myapp.add.products", "command", new Product());
	}

	@RequestMapping(value = "/addproduct", method = RequestMethod.POST)
	public String addStudent(@ModelAttribute("SpringWeb") Product product, ModelMap model) {

		productService.saveProductDetails(product);

		return "redirect:/products/all";
	}

	@RequestMapping(value = "/delproduct/{id}/{type}", method = RequestMethod.GET)
	public String delProducts(@PathVariable("id") String id, @PathVariable("type") String type) {
		productService.deleteProductDetails(id);
		
		return "redirect:/products/"+type;
	}

}
