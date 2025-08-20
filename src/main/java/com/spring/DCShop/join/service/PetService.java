package com.spring.DCShop.join.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface PetService {
	
	// 반려동물 등록
	public void insertPetAction(HttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException;

}

