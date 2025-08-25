package com.spring.DCShop.join.dao;

import java.util.List;

import com.spring.DCShop.join.dto.PetDTO;

public interface PetDAO {
	
	// 반려동물 등록
	public int insertPet(List<PetDTO> pet);

}

