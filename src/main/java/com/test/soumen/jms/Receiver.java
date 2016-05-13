package com.test.soumen.jms;

import java.util.concurrent.CountDownLatch;

import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.test.soumen.service.ProductService;

@Component
public class Receiver implements MessageListener {

	@Override
	public void onMessage(Message message) {
		System.out.println("Message Body:"+message.getMessageProperties().getCorrelationId());
		
		
		
		latch.countDown();
	}

	@Autowired
	ProductService productService;

	private CountDownLatch latch = new CountDownLatch(1);

	/*
	 * public void receiveMessage(Message message)) { System.out.println(
	 * "Received <" + product + ">"); //save data into DB
	 * productService.saveProductDetails(product);
	 * 
	 * latch.countDown(); }
	 */

	public CountDownLatch getLatch() {
		return latch;
	}

}