package com.kl.napchen.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductOutController {
	@RequestMapping("/saleProduct")
	public String saleProduct() {
		System.out.println("sale product ......");
		return "";
	}
}
