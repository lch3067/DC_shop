package com.spring.DCShop.shop.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.DCShop.shop.dto.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	// 상품상세페이지
	@Override
	public ProductDTO productDetail(int pd_id) {
		System.out.println("ProductDAOImpl - productDetail()");
		
		ProductDTO dto = sqlSession.selectOne("com.spring.DCShop.shop.dao.ProductDAO.productDetail", pd_id);
		
		return dto;
	}
}
