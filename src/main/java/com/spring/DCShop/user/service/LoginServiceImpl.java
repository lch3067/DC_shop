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

import com.spring.DCShop.board.dao.BoardDAO;
import com.spring.DCShop.user.dao.LoginDAO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDAO dao;
	@Autowired
	private BoardDAO boardDao;
	
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
			// 4-3) sessionid(=u_id)로부터 회원번호(u_member_id)를 조회
	        //      - null일 수 있으므로 Integer로 받는 것을 권장
	        Integer uMemberId = null;
	        try {
	            uMemberId = boardDao.selectU_member_id(id);
	        } catch (Exception e) {
	            uMemberId = null; // 조회 실패 시 널로 처리
	        }

	        // 4-4) 회원 닉네임도 조회(댓글 표시/작성자 저장용)
	        String uNickname = null;
	        try {
	            uNickname = boardDao.selectU_nicknameAction(id);
	        } catch (Exception e) {
	            uNickname = null;
	        }

	        // 4-5) 조회 결과를 세션에 저장(없으면 기본값 처리)
	        //      - 컨트롤러/서비스/뷰에서 일관되게 사용할 세션 키를 표준화
	        if (uMemberId != null) {
	            session.setAttribute("u_member_id", uMemberId); // 숫자 회원번호
	        } else {
	            session.setAttribute("u_member_id", 0);         // 조회 실패 시 0으로 둠
	        }
	        session.setAttribute("u_nickname", uNickname);       // 닉네임 (null 가능)

	        // 4-6) 세션 타임아웃(선택): 30분
	        session.setMaxInactiveInterval(60 * 30);

	        // 4-7) 로그인 성공 후 이동 처리(필요 시)
	        // response.sendRedirect(request.getContextPath() + "/comm_main.do");
	        // return;

	    } else {
	        // 5) 로그인 실패 시: 에러 메시지를 모델에 담거나 리다이렉트
	        model.addAttribute("loginError", "아이디 또는 비밀번호가 올바르지 않습니다.");
	        // response.sendRedirect(request.getContextPath() + "/login_main.do");
	        // return;
	    }
	}

}
