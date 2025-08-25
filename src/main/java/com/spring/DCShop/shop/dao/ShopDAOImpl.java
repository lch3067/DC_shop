package com.spring.DCShop.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.DCShop.shop.dto.ShopDTO;

@Repository
public class ShopDAOImpl implements ShopDAO{

	@Autowired
	private SqlSession sqlSession;
	
	// 상품 목록 조회
	@Override
	public List<ShopDTO> productListAction(Map<String, Object> map) {
		
		List<ShopDTO> list = sqlSession.selectList("com.spring.DCShop.shop.dao.ShopDAO.productListAction", map);
		System.out.println("dao list : "+ list);
		return list;
	}

	@Override
	public int productCnt(Map<String, Object> params) {
		int total = sqlSession.selectOne("com.spring.DCShop.shop.dao.ShopDAO.productCnt");
		return total;
	}

}
