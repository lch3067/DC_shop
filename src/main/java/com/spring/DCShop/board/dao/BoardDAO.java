package com.spring.DCShop.board.dao;

import java.util.List;
import java.util.Map;

import com.spring.DCShop.board.dto.BoardDTO;
import com.spring.DCShop.board.dto.CommentDTO;
import com.spring.DCShop.user.dto.UserDTO;

public interface BoardDAO {

	// 게시판 목록
	public List<UserDTO> boardListAction(Map<String, Object> map);
	
	// 게시글 전체 개수
	public int boardListTotal();
	
	// 댓글 개수
	public int commentListTotal();
	
	// 게시판 상세페이지
	public UserDTO boardDetailAction(int b_num);
	
	// 조회수 증가
	public void viewsUpdateAction(int b_num);
	
	// 추천 추가 클릭
	public void recommendAddAction(Map<String, Object> map);
	
	// 추천 삭제 클릭
	public void recommendRemoveAction(Map<String, Object> map);
	
	// 추천수 변경
	public int recommendUpdateAction(int b_num);
	
	// 게시판 등록
	public int boardInsertAction(BoardDTO dto);
	
	// 게시판 수정 정보
	public BoardDTO boardUpdateDTOAction(int b_num);
	
	// 게시판 수정 등록
	public int boardUpdateAction(BoardDTO dto);
	
	// 게시판 삭제
	public int boardDeleteAction(int b_num);
	
	// 댓글 목록
	public List<CommentDTO> commentListAction();
	
	// 댓글 등록
	public int commentInsertAction(CommentDTO dto);
	
	// 댓글 수정
	public int commentUpdateAction(int c_num);
			
	// 댓글 삭제
	public int commentDeleteAction(int c_num);
	
	// 검색
	public List<BoardDTO> searchAction(String b_category);
	
}
