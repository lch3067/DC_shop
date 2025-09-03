package com.spring.DCShop.shop.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.DCShop.shop.dto.OrderDTO;

@Repository
public class OrderDAOImpl implements OrderDAO{
	
	@Autowired
	SqlSession sqlSession;

	// 결제내역 저장
	public void orderInsertAction(OrderDTO dto) {
		System.out.println("DAO - orderInsertAction()");
		
		sqlSession.insert("com.spring.DCShop.shop.dao.OrderDAO.orderInsertAction", dto);
	}
}
