package com.spring.DCShop.join.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface PetService {
	
	// 사용자와 반려동물 등록
	public boolean insertAction(HttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException;

}

