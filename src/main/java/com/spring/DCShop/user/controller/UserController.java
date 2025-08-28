package com.spring.DCShop.user.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping("main")
	public String main() {
		logger.info("=== url -> main ===");
		
		return "main";
	}                                                                                                                                                                                                                                                  

}
