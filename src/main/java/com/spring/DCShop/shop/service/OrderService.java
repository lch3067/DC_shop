package com.spring.DCShop.shop.service;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestBody;

public interface OrderService {

	// 결제내역 저장
	public void orderInsertAction(@RequestBody String jsonBody, JSONObject jsonObject, HttpServletRequest request) throws Exception;

}
