package com.spring.DCShop.shop.dao;

import com.spring.DCShop.shop.dto.OrderDTO;

public interface OrderDAO {

	// 결제내역 저장
	public void orderInsertAction(OrderDTO dto);
	
	// 재고수량 업데이트
	
}
