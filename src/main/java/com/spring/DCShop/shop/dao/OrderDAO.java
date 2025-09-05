package com.spring.DCShop.shop.dao;

import com.spring.DCShop.shop.dto.OrderDTO;
import com.spring.DCShop.user.dto.UserDTO;

public interface OrderDAO {
	
	// 결제자 정보
	public UserDTO orderUserAction(int u_member_id);

	// 결제내역 저장
	public void orderInsertAction(OrderDTO dto);
	
	// 재고수량 업데이트
	
}
