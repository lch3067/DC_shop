package com.spring.DCShop.shop.dao;

import java.util.List;
import java.util.Map;

import com.spring.DCShop.shop.dto.ShopDTO;

public interface ShopDAO {
	
	// 상품 목록 조회
	public List<ShopDTO> productListAction(Map<String, Object> map);
	
	// 상품 갯수
	public int productCnt(Map<String, Object> countP);
	
	public List<Integer> getSubCategory(int mainCate);
}
