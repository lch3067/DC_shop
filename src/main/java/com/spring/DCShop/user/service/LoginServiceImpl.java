package com.spring.DCShop.user.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.DCShop.user.dao.LoginDAO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDAO dao;
	
	@Override
	public void loginaction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("CustomerServiceImpl - loginaction");
		
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_password");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pw", pw);
		
		int selcnt = dao.idpasswordchk(map);
		//6. 로그인 성공시 세션 id를 설정
		if(selcnt == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("sessionid", id);
			//위 아래 두가지 동일한 방식
			request.getSession().setAttribute("sessionpw", pw);
		}
	}

}
