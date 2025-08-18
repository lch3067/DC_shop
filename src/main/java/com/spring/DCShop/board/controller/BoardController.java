package com.spring.DCShop.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	// 게시판 목록
	@RequestMapping("board_list")
	public String board_list() {
		logger.info("<<< url => board_list >>>");
		
		return "board_board_list";
	}
	
	// 게시판 상세페이지
	
	// 게시판 작성
	
	// 게시판 등록
	
	// 게시판 수정
	
	// 게시판 수정 등록
	
	// 게시판 삭제
	
	// 댓글 목록
	
	// 댓글 등록
	
	// 댓글 수정
	
	// 댓글 삭제
	
	// 검색
	
}
