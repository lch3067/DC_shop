package com.spring.DCShop.join.service;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.DCShop.join.dao.PetDAO;
import com.spring.DCShop.join.dto.PetDTO;

@Service
public class PetServiceImpl implements PetService{
	
	@Autowired
	private PetDAO dao;
	
	// 펫등록 처리
	@Override
	public void insertPetAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("PetServiceImpl - insertPetAction()");
		
		PetDTO dto = new PetDTO();
		
		dto.setPet_name(request.getParameter("pet_name"));
		
		String birthdayStr = request.getParameter("pet_birthday");
		if (birthdayStr != null && !birthdayStr.trim().equals("")) {
		    dto.setPet_birthday(Date.valueOf(birthdayStr));
		} else {
		    dto.setPet_birthday(null);
		}
		
		dto.setPet_kind(request.getParameter("pet_kind"));
		dto.setPet_gender(request.getParameter("pet_gender"));
		
		String petType = request.getParameter("pet_type");
		dto.setPet_type(petType);

		String petKgStr = request.getParameter("pet_kg");
		if (petKgStr != null && !petKgStr.trim().equals("")) {
		    double petKg = Double.parseDouble(petKgStr);
		    dto.setPet_kg(petKg);

		    // 강아지 / 고양이 구분
		    if ("강아지".equals(petType)) {
		        if (petKg <= 5) {
		            dto.setPet_size("소형");
		        } else if (petKg <= 15) {
		            dto.setPet_size("중형");
		        } else {
		            dto.setPet_size("대형");
		        }
		    } else if ("고양이".equals(petType)) {
		        if (petKg <= 4) {
		            dto.setPet_size("소형");
		        } else if (petKg <= 6) {
		            dto.setPet_size("중형");
		        } else {
		            dto.setPet_size("대형");
		        }
		    }

		} else {
		    dto.setPet_kg(0.0);
		    dto.setPet_size("소형"); // 기본값
		}
		
		dto.setUser_id(request.getParameter("user_id"));
		
		String neutered = request.getParameter("pet_neutered");
		if (neutered == null || neutered.trim().isEmpty()) {
		    neutered = "N";   // 기본값
		}
		dto.setPet_neutered(neutered);
		
		int insertCnt = dao.insertPet(dto);
		
		model.addAttribute("insertCnt", insertCnt);
		
	}

}

