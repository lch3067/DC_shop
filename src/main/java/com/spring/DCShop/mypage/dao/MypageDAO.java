package com.spring.DCShop.mypage.dao;

import java.util.List;
import java.util.Map;

import com.spring.DCShop.mypage.dto.CartDTO;
import com.spring.DCShop.mypage.dto.OrderDTO;
import com.spring.DCShop.mypage.dto.ProductDTO;

public interface MypageDAO {
	
	public List<OrderDTO> getOrderList(Map<String, Object> productListInfo);
	
}
