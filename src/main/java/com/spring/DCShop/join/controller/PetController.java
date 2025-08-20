package com.spring.DCShop.join.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.DCShop.join.service.PetServiceImpl;

@Controller
public class PetController {
	
	@Autowired
	private PetServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(PetController.class);
	
	
	@RequestMapping("/insertPet.do")
	public String insertPet(HttpServletRequest request, HttpServletResponse response, Model model){
		logger.info("PetController - insertPet.do");
		
		System.out.println(request.getParameter("agreementdto"));
		
		System.out.println(request.getParameter("user_id"));
		
		
		
		
		return "pet/insert";
	}
	
	@RequestMapping("/insertAction.do")
	public String insertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		
		service.insertPetAction(request, response, model);
		logger.info("PetController - insertAction.do");
		
		return "pet/insertAction";
	}

}
