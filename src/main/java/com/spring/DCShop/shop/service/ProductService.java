package com.spring.DCShop.shop.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface ProductService {

	// 상품상세페이지
	public void productDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException;
}
