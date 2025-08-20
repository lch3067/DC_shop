package com.spring.DCShop.join.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.DCShop.join.dto.PetDTO;

@Repository
public class PetDAOImpl implements PetDAO{

	@Autowired
	private SqlSession sqlSession;

	// 반려동물 등록
	@Override
	public int insertPet(PetDTO dto) {
		System.out.println("PetDAOImpl - insertPet()");
		System.out.println(dto);
	
		int insertCnt = sqlSession.insert("com.spring.DCShop.join.dao.PetDAO.insertPet", dto);
		
		return insertCnt;
	}
	
	
	
}

