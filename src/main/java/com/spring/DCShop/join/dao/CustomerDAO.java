package com.spring.DCShop.join.dao;

import com.spring.DCShop.join.dto.CustomerDTO;

public interface CustomerDAO {

	// 회원가입 처리
	public int insertCustomer(CustomerDTO dto);
	
}
