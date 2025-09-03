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
		return list;
	}

	// 상품목록 갯수 조회
	@Override
	public int productCnt(Map<String, Object> countP) {
		int total = sqlSession.selectOne("com.spring.DCShop.shop.dao.ShopDAO.productCnt", countP);
		return total;
	}

	@Override
	public List<Integer> getSubcategory(int category) {
		List<Integer> total = sqlSession.selectList("com.spring.DCShop.shop.dao.ShopDAO.getSubcategory", category);
		return total;
	}


}
