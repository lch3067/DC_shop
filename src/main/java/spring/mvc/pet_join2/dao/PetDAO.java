package spring.mvc.pet_join2.dao;

import spring.mvc.pet_join2.dto.PetDTO;

public interface PetDAO {
	
	// 반려동물 등록
	public int insertPet(PetDTO pet);

}

