package com.spring.DCShop.join.service;

import java.io.IOException;

import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.DCShop.join.dao.CustomerDAO;
import com.spring.DCShop.join.dto.AgreeDTO;
import com.spring.DCShop.join.dto.CustomerDTO;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerDAO dao;

	/**
	 * @purpose 약관 동의
	 */
	@Override
	public void totalAgreement(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("CustomerServiceImpl - totalAgreement");

		AgreeDTO agreementdto = new AgreeDTO();
		String terms = request.getParameter("agreeTerms");
		String privacy = request.getParameter("agreePrivacy");
		String third = request.getParameter("agreeThird");
		String marketing = request.getParameter("agreeMarketing");

		// 서비스 이용약관 동의여부
		if ("Y".equals(terms)) {
			agreementdto.setAgreeTerms(terms);
		} else {
			agreementdto.setAgreeTerms("N");
		}

		// 개인정보 수집 동의
		if ("Y".equals(privacy)) {
			agreementdto.setAgreePrivacy(privacy);
		} else {
			agreementdto.setAgreePrivacy("N");
		}

		// 개인정보 제3자 제공 동의
		if ("Y".equals(third)) {
			agreementdto.setAgreeThird(third);
		} else {
			agreementdto.setAgreeThird("N");
		}

		// 마케팅 수신 동의
		if ("Y".equals(marketing)) {
			agreementdto.setAgreeMarketing(marketing);
		} else {
			agreementdto.setAgreeMarketing("N"); // 마케팅 수신 비동의
		}

		// 약관 동의 정보 넘기기
		model.addAttribute("agreementdto", agreementdto);
	}

	/**
	 * @throws ParseException 
	 * @purpose 회원가입 처리
	 */
	@Override
	public void signInAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("CustomerServiceImpl - signInAction");

		// 객체 담기
		CustomerDTO customerdto = new CustomerDTO();

		// 유저 닉네임
		customerdto.setU_nickname(request.getParameter("u_nickname"));
		
		// 유저 아이디
		customerdto.setU_id(request.getParameter("u_id"));
		
		// 유저 비밀번호
		customerdto.setU_password(request.getParameter("u_password"));
		
		// 유저 이름
		customerdto.setU_name(request.getParameter("u_name"));
		
		// 유저 생일
		customerdto.setU_birthday(Date.valueOf(request.getParameter("u_birthday")));
		
		// 유저 주소 : 주소 합치기
		String address = request.getParameter("u_address") + " " + request.getParameter("u_deTailAddress") + " "
				+ request.getParameter("u_zip_code");
		customerdto.setU_address(address);

		// 전화번호
		// hp은 필수가 아니므로 null값이 들어올 수 있으므로 값이 존재할 때만 받아온다.(010-1234-4567);
		String hp = "";
		String hp1 = request.getParameter("u_phone1");
		String hp2 = request.getParameter("u_phone2");
		String hp3 = request.getParameter("u_phone3");

		if (!hp1.equals("") && !hp2.equals("") && !hp3.equals("")) {
			hp = hp1 + "-" + hp2 + "-" + hp3;
			customerdto.setU_phone(hp3);
		}

		// 이메일 부분
		String user_email = "";
		String user_email1 = request.getParameter("u_email1");
		String user_email2 = request.getParameter("u_email2");
		user_email = user_email1 + "@" + user_email2;
		customerdto.setU_email(user_email);

		customerdto.setU_piagree(request.getParameter("agreePrivacy"));
		customerdto.setU_magree(request.getParameter("agreeMarketing"));
		
		request.getSession().setAttribute("customerdto", customerdto);
	}

	/**
	 * @purpose ID 중복확인 처리
	 */
	@Override
	public void idConfirmAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("CustomerServiceImpl - idConfirmAction()");

		// 3단계.화면에서 입력받은 값을 가져온다.
		String strId = request.getParameter("u_id");

		System.out.println(strId);

		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		// CustomerDAO getInstance = CustomerDaoImpl.getInstance();

		// 5단계. 아이디 중복확인 처리
		int selectCnt = dao.useridCheck(strId);

		System.out.println("selectCnt" + selectCnt);

		// 6단계. jsp로 처리결과 전달
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("strId", strId);

	}

	@Override
	public void nickNameConfirmAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("CustomerServiceImpl - nickNameConfirmAction()");

		String strNickName = request.getParameter("u_nickname");

		int selectCnt = dao.userNickNameCheck(strNickName);

		System.out.println("selectCnt" + selectCnt);

		// 6단계. jsp로 처리결과 전달
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("strNickName", strNickName);
		
	}
}
