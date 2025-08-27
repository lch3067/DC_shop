package com.spring.DCShop.user.dao;

import java.util.Map;

public interface LoginDAO {
	//로그인처리
	public int idpasswordchk(Map<String, Object> map);
}
