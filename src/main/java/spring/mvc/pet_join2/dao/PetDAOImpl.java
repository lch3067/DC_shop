package spring.mvc.pet_join2.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.pet_join2.dto.PetDTO;

@Repository
public class PetDAOImpl implements PetDAO{

	@Autowired
	private SqlSession sqlSession;

	// 반려동물 등록
	@Override
	public int insertPet(PetDTO dto) {
		System.out.println("PetDAOImpl - insertPet()");
		System.out.println(dto);
	
		int insertCnt = sqlSession.insert("spring.mvc.pet_join2.dao.PetDAO.insertPet", dto);
		
		return insertCnt;
	}
	
	
	
}

