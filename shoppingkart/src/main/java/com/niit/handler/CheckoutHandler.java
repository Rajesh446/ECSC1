package com.niit.handler;

import org.springframework.stereotype.Service;

import com.niit.model.Cart;


@Service
public class CheckoutHandler {

	public String cardPayment(Cart cart){
	String name = cart.getCardnumber();
		String date=cart.getDate();
		String cvv=cart.getCvv();
		
		System.out.println(name);
		if(name.equals("1234567890")&&date.equals("01/2018")&&cvv.equals("111")){
			
			return "true";
		}
		else{
			return "false";
		}
	}
	
	 public String paymentMethod(Cart cart){
		System.out.println("method");
		cart.setMethod("card");
		String method=cart.getMethod();
		System.out.println(method);
		if(method.equals("cod"))
		{
			return "cod";
		}else {
			return "card";
		}
	}
}