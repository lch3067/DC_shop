package com.spring.DCShop.board.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.DCShop.board.dao.BoardDAO;
import com.spring.DCShop.board.dto.BoardDTO;
import com.spring.DCShop.board.page.Paging;


@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDAO dao;

	// 게시판 목록
	@Override
	public void boardListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("BoardServiceImpl - boardListAction()");
		
		// 화면에서 입력받은 값을 가져오기
		String pageNum = request.getParameter("pageNum");
		
		
		// 전체 게시글 갯수 카운트
		Paging paging = new Paging(pageNum);
		int total = dao.boardListTotal();
		System.out.println("total : " + total);
		
		paging.setTotalCount(total);
		
		// 게시글 목록 조회
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<BoardDTO> list = dao.boardListAction(map);
		System.out.println("list : " + list);
		
		//jsp로 처리결과 전달
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}

	// 게시판 상세페이지
	@Override
	public void boardDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// 게시판 등록
	@Override
	public void boardInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// 게시판 수정 정보
	@Override
	public void boardUpdateDTOAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// 게시판 수정 등록
	@Override
	public void boardUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// 게시판 삭제
	@Override
	public void boardDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// 댓글 목록
	@Override
	public void commentListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// 댓글 등록
	@Override
	public void commentInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// 댓글 수정
	@Override
	public void commentUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// 댓글 삭제
	@Override
	public void commentDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// 검색
	@Override
	public void searchAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

}
