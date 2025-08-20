package spring.mvc.pet_join2.controller;

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

import spring.mvc.pet_join2.service.PetServiceImpl;

@Controller
public class PetController {
	
	@Autowired
	private PetServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(PetController.class);
	
	
	@RequestMapping("/insertPet.do")
	public String insertPet(){
		logger.info("PetController - insertPet.do");
		
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
