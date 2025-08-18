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
	
	// 약관 동의 항목 체크
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

	// 회원가입 처리
	@Override
	public void signInAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("CustomerServiceImpl - signInAction");

		// 3단계. 화면에서 입력받은 값을 가져와서 DTO의 setAttribute를 통해 전달
		// DTO 생성 -> setter -> 맴버변수

		// 1 - DTO 생성
		CustomerDTO customerdto = new CustomerDTO();

		// 2 - setter로 담는다.
		// 유저 아이디
		customerdto.setUser_id(request.getParameter("user_id"));
		// 유저 비밀번호
		customerdto.setUser_password(request.getParameter("user_password"));
		// 유저 이름
		customerdto.setUser_name(request.getParameter("user_name"));
		// 유저 생일
		customerdto.setUser_birthday(Date.valueOf(request.getParameter("user_birthday")));
		// 유저 주소
		// 주소 합치기
		String address = request.getParameter("user_address") + " " + request.getParameter("user_deTailaddress") + " "
				+ request.getParameter("user_zipCodeaddress");
		customerdto.setUser_address(address);

		// hp은 필수가 아니므로 null값이 들어올 수 있으므로 값이 존재할 때만 받아온다.(010-1234-4567);
		String hp = "";
		String hp1 = request.getParameter("user_hp1");
		String hp2 = request.getParameter("user_hp2");
		String hp3 = request.getParameter("user_hp3");

		if (!hp1.equals("") && !hp2.equals("") && !hp3.equals("")) {
			hp = hp1 + "-" + hp2 + "-" + hp3;
			customerdto.setUser_hp(hp);
		}

		// 이메일 부분
		String user_email = "";
		String user_email1 = request.getParameter("user_email1");
		String user_email2 = request.getParameter("user_email2");
		user_email = user_email1 + "@" + user_email2;
		customerdto.setUser_email(user_email);

		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		// CustomerDao getInstance = CustomerDaoImpl.getInstance();
		// 등록일 아래 문장 생략시... DB쪽에 기본값으로 sysdate
		// customerdto.setUser_regdate(new Timestamp(System.currentTimeMillis()));

		// 5단계. 회원가입 처리
		int insertCnt = dao.insertCustomer(customerdto);

		// 6단계. jsp로 전달을 위한 처리하기
		model.addAttribute("insertCnt", insertCnt);
	}
}
