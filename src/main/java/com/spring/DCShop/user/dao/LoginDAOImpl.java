package com.spring.DCShop.user.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.DCShop.user.dto.UserDTO;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//회원 정보조회
	@Override
	public UserDTO idpasswordchk(Map<String, Object> map) {
		System.out.println("LoginDAOImpl - idpasswordchk");
		
		UserDTO dto = sqlSession.selectOne("com.spring.DCShop.user.dao.LoginDAO.idpasswordchk", map);
		System.out.println(dto);
		return dto;
	}

}
