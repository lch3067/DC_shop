package com.spring.DCShop.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.DCShop.board.service.BoardServiceImpl;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardServiceImpl service;
	
	// 게시판 목록
	@RequestMapping("board_list")
	public String board_list(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url => board_list >>>");
		
		service.boardListAction(request, response, model);
		
		return "board/board_list";
	}
	
	// 게시판 상세페이지
	@RequestMapping("board_detail")
	public String board_detail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("<<< url => board_detail >>>");
		
		service.boardDetailAction(request, response, model);
		
		return "board/board_detail";
	}
	
	// 게시판 작성
	@RequestMapping("board_insert")
	public String board_insert(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url => board_insert >>>");
		
		return "board/board_insert";
	}
	
	// 게시판 등록
	@RequestMapping("board_insertAction")
	public void board_insertAction(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url => board_insertAction >>>");
		
		service.boardInsertAction(request, response, model);
		
		String viewPage=request.getContextPath() + "/board_list";
		response.sendRedirect(viewPage);
	}
	
	// 게시판 수정
	
	// 게시판 수정 등록
	
	// 게시판 삭제
	
	// 댓글 목록
	
	// 댓글 등록
	
	// 댓글 수정
	
	// 댓글 삭제
	
	// 검색
	
}
