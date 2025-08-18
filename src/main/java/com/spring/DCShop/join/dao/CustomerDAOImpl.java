package com.spring.DCShop.join.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.DCShop.join.dto.CustomerDTO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 회원가입 처리
	@Override
	public int insertCustomer(CustomerDTO dto) {

		int insertCnt = 0;

		System.out.println("CustomerDAOImpl - insertCustomer()");

		insertCnt = sqlSession.insert("com.spring.DCShop.join.dao.CustomerDAO.insertCustomer", dto);

		return insertCnt;

	}

}
