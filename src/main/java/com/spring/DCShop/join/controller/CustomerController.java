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

import com.spring.DCShop.join.service.CustomerService;

@Controller
public class CustomerController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@Autowired
	private CustomerService service;

	/**
	 * 약관동의 페이지로 이동
	 */
	@RequestMapping("termsAgreement.do")
	public String termsAgreement(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("CustomerController - join.do");

		return "user/join/termsAgreement";
	}

	/**
	 * 약관동의 완료 -> 회원가입 페이지로 이동
	 */
	@RequestMapping("join.do")
	public String join(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("CustomerController - join.do");
		service.totalAgreement(request, response, model);

		return "user/join/join";
	}

	// -> 개랑 고양이 join페이지?


	/**
	 * purpose 아이디 중복시 처리
	 */
	@RequestMapping("/idConfirmAction.do")
	public String idConfirmAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /idConfirmAction.do >>>");

		service.idConfirmAction(request, response, model);

		return "user/join/modar/idConfirmAction";
	}
	
	/**
	 * purpose 닉네임 중복시 처리
	 */
	@RequestMapping("/nickNameConfirmAction.do")
	public String nickNameConfirmAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /nickNameConfirmAction.do >>>");

		service.nickNameConfirmAction(request, response, model);

		return "user/join/modar/nickNameConfirmAction";
	}
	
}
