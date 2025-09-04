package com.spring.DCShop.mypage.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface MypageService {

	public void getCartList(HttpServletRequest request, HttpServletResponse response, Model model);
	
}
