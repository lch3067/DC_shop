package com.spring.DCShop.board.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface BoardService {

	// 게시판 목록
	public void boardListAction(HttpServletRequest request, HttpServletResponse response, Model moedel)
		throws ServletException, IOException;
	
	// 게시판 상세페이지
	public void boardDetailAction(HttpServletRequest request, HttpServletResponse response, Model moedel)
		throws ServletException, IOException;
	
	// 게시판 등록
	public void boardInsertAction(HttpServletRequest request, HttpServletResponse response, Model moedel)
			throws ServletException, IOException;
	
	// 게시판 수정 정보
	public void boardUpdateDTOAction(HttpServletRequest request, HttpServletResponse response, Model moedel)
			throws ServletException, IOException;
	
	// 게시판 수정 등록
	public void boardUpdateAction(HttpServletRequest request, HttpServletResponse response, Model moedel)
			throws ServletException, IOException;
	
	// 게시판 삭제
	public void boardDeleteAction(HttpServletRequest request, HttpServletResponse response, Model moedel)
			throws ServletException, IOException;
	
	// 댓글 목록
	public void commentListAction(HttpServletRequest request, HttpServletResponse response, Model moedel)
			throws ServletException, IOException;
	
	// 댓글 등록
	public void commentInsertAction(HttpServletRequest request, HttpServletResponse response, Model moedel)
			throws ServletException, IOException;
	
	// 댓글 수정
	public void commentUpdateAction(HttpServletRequest request, HttpServletResponse response, Model moedel)
			throws ServletException, IOException;
	
	// 댓글 삭제
	public void commentDeleteAction(HttpServletRequest request, HttpServletResponse response, Model moedel)
			throws ServletException, IOException;
	
	// 검색
	public void searchAction(HttpServletRequest request, HttpServletResponse response, Model moedel)
			throws ServletException, IOException;
}
