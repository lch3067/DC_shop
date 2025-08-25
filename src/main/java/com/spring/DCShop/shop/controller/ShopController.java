package com.spring.DCShop.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.DCShop.user.controller.LoginController;

@Controller
public class ShopController {

	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	@RequestMapping("shop_main.do")
	public String shop_main() {
		logger.info("=== url -> shop_main ===");
		
		return "shop/shop_main";
	}
}
