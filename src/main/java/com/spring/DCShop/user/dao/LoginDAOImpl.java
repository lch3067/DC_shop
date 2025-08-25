package com.spring.DCShop.user.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//회원 정보조회
	@Override
	public int idpasswordchk(Map<String, Object> map) {
		System.out.println("LoginDAOImpl - idpasswordchk");
		
		int selcnt = sqlSession.selectOne("com.spring.DCShop.user.dao.LoginDAO.idpasswordchk", map);
		System.out.println(selcnt);
		return selcnt;
	}

}
