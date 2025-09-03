package com.spring.DCShop.shop.dao;

import com.spring.DCShop.shop.dto.ProductDTO;

public interface ProductDAO {

	// 상품상세페이지
	public ProductDTO productDetail(int pd_id);
}
