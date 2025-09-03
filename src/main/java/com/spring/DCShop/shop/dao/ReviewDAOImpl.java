package com.spring.DCShop.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.DCShop.shop.dto.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO{
	
	@Autowired
	private SqlSession sqlSession;

	// 리뷰 목록
	@Override
	public List<ReviewDTO> reviewList(Map<String, Object> map) {
		System.out.println("ReviewDAOImpl - reviewList()");
		
		List<ReviewDTO> list = sqlSession.selectList("com.spring.DCShop.shop.dao.ReviewDAO.reviewList", map);
		
		return list;
	}

	// 리뷰 개수 구하기 
	@Override
	public int reviewCnt(int pd_id) {
		System.out.println("ReviewDAOImpl - reviewCnt()");
		
		int total = sqlSession.selectOne("com.spring.DCShop.shop.dao.ReviewDAO.reviewCnt", pd_id);
		return total;
	}

	// 리뷰 상세 처리
	@Override
	public ReviewDTO getReviewDetail(int r_num) {
		System.out.println("ReviewDAOImpl - getReviewDetail()");
		
		ReviewDTO dto = sqlSession.selectOne("com.spring.DCShop.shop.dao.ReviewDAO.getReviewDetail", r_num);
		
		return dto;
	}
	
	@Override
    public List<ReviewDTO> recentReviews(int pd_id) {
        return sqlSession.selectList("com.spring.DCShop.shop.dao.ReviewDAO.recentReviews", pd_id);
    }
	
	// [리뷰 수정삭제 버튼] 클릭시 - 아이디 인증처리
	@Override
	public int review_chk(Map<String, Object> map) {
		System.out.println("ReviewDAOImpl - review_chk()");
		
		int selectCnt = sqlSession.selectOne("com.spring.DCShop.shop.dao.ReviewDAO.review_chk", map);
		return selectCnt;
	}

	// 리뷰 수정처리
	@Override
	public void updateReview(ReviewDTO dto) {
		System.out.println("ReviewDAOImpl - updateReview()");
		
		sqlSession.update("com.spring.DCShop.shop.dao.ReviewDAO.updateReview", dto);
		
	}

	// 리뷰 삭제 처리
	@Override
	public void deleteReview(int r_num) {
		System.out.println("ReviewDAOImpl - deleteReview()");
		
		sqlSession.delete("com.spring.DCShop.shop.dao.ReviewDAO.deleteReview", r_num);
		
	}

	// 리뷰 작성 처리
	@Override
	public void insertReview(ReviewDTO dto) {
		System.out.println("ReviewDAOImpl - insertReview()");
		
		sqlSession.insert("com.spring.DCShop.shop.dao.ReviewDAO.insertReview", dto);
		
	}

	// 평균 별점
	 @Override
	    public Double avgScoreByProduct(int pd_id) {
	        Double avg = sqlSession.selectOne(
	            "com.spring.DCShop.shop.dao.ReviewDAO.avgScoreByProduct",
	            pd_id
	        );
	        return (avg == null) ? 0.0 : avg;  // null-safe
	    }

}
