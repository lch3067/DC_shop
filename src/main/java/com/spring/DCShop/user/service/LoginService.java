package com.spring.DCShop.user.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface LoginService {
	//로그인처리
	public void loginaction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
}
