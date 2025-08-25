package com.spring.DCShop.join.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface CustomerService {

	/**
	 * @purpose 약관 동의
	 */
	public void totalAgreement(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;

	/**
	 * @throws ParseException 
	 * @purpose 회원가입 처리
	 */
	public void signInAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;

	/**
	 * @purpose ID 중복확인 처리
	 */
	public void idConfirmAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;

	/**
	 * @purpose 닉네임 중복확인 처리
	 */
	public void nickNameConfirmAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	
}
