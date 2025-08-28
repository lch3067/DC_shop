package com.spring.DCShop.user.dao;

import java.util.Map;

import com.spring.DCShop.user.dto.UserDTO;

public interface LoginDAO {
	//로그인처리
	public UserDTO idpasswordchk(Map<String, Object> map);
}
