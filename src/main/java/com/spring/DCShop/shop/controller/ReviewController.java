package com.spring.DCShop.shop.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.DCShop.shop.service.ReviewServiceImpl;

@Controller
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewServiceImpl service;
	
	// [특정리뷰 목록]
	@RequestMapping("/review_list.bc")
	public String review_list(HttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException{
		logger.info("<<< url => review_list.bc >>>");
		
		return service.reviewListAction(request, response, model);
	}
	
	// [리뷰 상세페이지]
	@RequestMapping("/review_detailAction.bc")
	public String review_detailAction(HttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException{
		logger.info("<<< url => review_detailAction.bc >>>");
		
		service.reviewDetailAction(request, response, model);
		
	    if (response.isCommitted()) {
	        return null; 
	    }
	    
		return "shop/review_detailAction";
	}
	
	// [리뷰 수정삭제 버튼] 클릭시 - 아이디, 리뷰번호 인증처리(로그인했으면 sessionId가 생겼을거니까) 
	@RequestMapping("/review_chkAction.bc")
	public String review_chkAction(HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes)
		throws ServletException, IOException{
		logger.info("<<< url => review_chkAction.bc >>>");
		
		int result = service.review_chkAction(request, response, model); // 1 = 통과 | 2 = 실패
		
		// r_num 파라미터(이름 혼용 대비)
	    String p = request.getParameter("hidden_r_num");
	    if (p == null || p.isBlank()) p = request.getParameter("r_num");
	    int r_num = (p != null && p.matches("\\d+")) ? Integer.parseInt(p) : 0;

	    if (result != 0) {
	        redirectAttributes.addAttribute("r_num", r_num);
	        redirectAttributes.addAttribute("edit", "1"); // 편집 모드 
	        return "redirect:/review_detailAction.bc";
	    } else {
	        redirectAttributes.addAttribute("r_num", r_num);
	        redirectAttributes.addAttribute("message", "error");
	        return "redirect:/review_detailAction.bc";
	    }
	}
	
	// [리뷰 수정처리]
	@RequestMapping("/review_updateAction.bc")
	public String review_updateAction(HttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException{
		logger.info("<<< url => review_updateAction.bc >>>");
		
		service.reviewUpdateAction(request, response, model);
		String rnum = request.getParameter("r_num");
	    return "redirect:/review_detailAction.bc?r_num=" + rnum; // 상세로 복귀
	}
	
	// [리뷰 삭제처리]
	@RequestMapping("/review_deleteAction.bc")
	public String review_deleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException{
		logger.info("<<< url => review_deleteAction.bc >>>");
		
		
		service.reviewDeleteAction(request, response, model);
		return "redirect:/review_list.bc";
	}
	
	// [리뷰 작성화면]
	@RequestMapping("/review_insert.bc")
	public String review_insert(HttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException{
		logger.info("<<< url => review_insert.bc >>>");
		
		// 상세페이지에서 넘어온 pd_id를 폼으로 전달
	    model.addAttribute("pd_id", request.getParameter("pd_id"));
		return "shop/review_insert";
	}
	
	// [리뷰 작성처리]
	@RequestMapping("/review_insertAction.bc")
	public String review_insertAction(HttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException{
		logger.info("<<< url => review_insertAction.bc >>>");
		
		return service.reviewInsertAction(request, response, model);
		
//		// 방금 작성한 상품의 리뷰 목록으로 이동하기 위해 pd_id 유지
//	    String pdId = request.getParameter("pd_id");
//	    
//	    // pd_id가 있으면 붙이고, 없으면 전체 목록
//	    if (pdId == null || pdId.isBlank()) {
//	        return "redirect:/review_list.bc";
//	    }
//	    return "redirect:/review_list.bc?pd_id=" + pdId;
	}

}
