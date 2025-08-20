package com.spring.DCShop.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.DCShop.board.dto.BoardDTO;
import com.spring.DCShop.board.dto.CommentDTO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Autowired
	SqlSession sqlSession;

	// 게시판 목록
	@Override
	public List<BoardDTO> boardListAction(Map<String, Object> map) {
		
		List<BoardDTO> list = sqlSession.selectList("com.spring.DCShop.board.dao.BoardDAO.boardListAction", map);
		
		return list;
	}

	// 게시글 전체 개수
	@Override
	public int boardListTotal() {
		System.out.println("BoardDAOImpl - boardListTotal()");

		int total = sqlSession.selectOne("com.spring.DCShop.board.dao.BoardDAO.boardListTotal");
		
		return total;
	}

	// 댓글 개수
	@Override
	public int commentListTotal() {
		return 0;
	}

	// 게시판 상세페이지
	@Override
	public BoardDTO boardDetailAction(int b_num) {
		return null;
	}

	// 게시판 등록
	@Override
	public int boardInsertAction(BoardDTO dto) {
		return 0;
	}

	// 게시판 수정 정보
	@Override
	public BoardDTO boardUpdateDTOAction(int b_num) {
		return null;
	}

	// 게시판 수정 등록
	@Override
	public int boardUpdateAction(BoardDTO dto) {
		return 0;
	}

	// 게시판 삭제
	@Override
	public int boardDeleteAction(int b_num) {
		return 0;
	}

	// 댓글 목록
	@Override
	public List<CommentDTO> commentListAction() {
		return null;
	}

	// 댓글 등록
	@Override
	public int commentInsertAction(CommentDTO dto) {
		return 0;
	}

	// 댓글 수정
	@Override
	public int commentUpdateAction(int c_num) {
		return 0;
	}

	// 댓글 삭제
	@Override
	public int commentDeleteAction(int c_num) {
		return 0;
	}

	// 검색
	@Override
	public List<BoardDTO> searchAction(String b_category) {
		return null;
	}

}
