package com.spring.DCShop.shop.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.DCShop.shop.dao.ReviewDAO;
import com.spring.DCShop.shop.dto.ReviewDTO;
import com.spring.DCShop.shop.page.Paging;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewDAO dao;

    // 리뷰 목록
    @Override
    public String reviewListAction(HttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {
        System.out.println("ReviewServiceImpl - reviewListAction()");
        String pdIdParam = request.getParameter("pd_id");
        String pageNum   = request.getParameter("pageNum");

        System.out.println("[reviewList] pd_id=" + pdIdParam + ", pageNum=" + pageNum);

        if (pdIdParam == null || pdIdParam.isEmpty()) {
            return "redirect:/review_list.bc?pd_id=1"; // 필요시 정책에 맞게 변경
        }

        int pdId = Integer.parseInt(pdIdParam);

        // 페이징
        Paging paging = new Paging(pageNum != null ? pageNum : "1");
        int start = paging.getStartRow();
        int end   = paging.getEndRow();

        int total = dao.reviewCnt(pdId);
        paging.setTotalCount(total);

        // 안전 보정
        if (end < start || start < 1) {
            start = 1;
            end   = Math.max(10, total);
        }

        System.out.println("[reviewList] total=" + total + ", start=" + start + ", end=" + end);

        // ◀ Java 1.7 미만이면 다이아몬드 연산자 금지
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pd_id", pdId);
        map.put("start", start);
        map.put("end", end);

        List<ReviewDTO> list = dao.reviewList(map);
        System.out.println("[reviewList] result.size=" + (list == null ? 0 : list.size()));
        if (list != null && !list.isEmpty()) {
            ReviewDTO first = list.get(0);
            System.out.println("[reviewList] first.r_num=" + first.getR_num() + ", first.pd_id=" + first.getPd_id());
        }

        model.addAttribute("list", list);
        model.addAttribute("paging", paging);
        model.addAttribute("pd_id", pdId);

        return "/shop/review_list";
    }

    // 리뷰 상세
    @Override
    public void reviewDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {
        System.out.println("ReviewServiceImpl - reviewDetailAction()");
        String p = request.getParameter("r_num");
        if (p == null || p.isBlank()) {
            response.sendRedirect(request.getContextPath() + "/review_list.bc");
            return;
        }
        int r_num = Integer.parseInt(p);
        ReviewDTO dto = dao.getReviewDetail(r_num);
        model.addAttribute("dto", dto);
    }

    // 수정/삭제 체크
    @Override
    public int review_chkAction(HttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {
        System.out.println("ReviewServiceImpl - review_chkAction()");
        String p = request.getParameter("hidden_r_num");
        if (p == null || p.isBlank()) p = request.getParameter("r_num");
        if (p == null || !p.matches("\\d+")) return 0;
        int r_num = Integer.parseInt(p);

        HttpSession session = request.getSession(false);
        String u_id = (session == null) ? null : (String) session.getAttribute("u_id");
        if (u_id == null || u_id.isEmpty()) return 0;

        ReviewDTO dto = dao.getReviewDetail(r_num);
        if (dto == null) return 0;

        model.addAttribute("dto", dto);
        return 1;
    }

    // 리뷰 수정
    @Override
    public void reviewUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {
        System.out.println("ReviewServiceImpl - reviewUpdateAction()");
        ReviewDTO dto = new ReviewDTO();
        dto.setR_score(Integer.parseInt(request.getParameter("r_score")));
        dto.setR_content(request.getParameter("r_content"));
        dto.setR_num(Integer.parseInt(request.getParameter("r_num")));
        dao.updateReview(dto);
    }

    // 리뷰 삭제
    @Override
    public void reviewDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {
        System.out.println("ReviewServiceImpl - reviewDeleteAction()");
        int num = Integer.parseInt(request.getParameter("hidden_r_num"));
        dao.deleteReview(num);
    }

    // 리뷰 작성 
    @Override
    public String reviewInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {
        System.out.println("ReviewServiceImpl - reviewInsertAction()");
        System.out.println("[insert] ct=" + request.getContentType());

        String pdIdParam    = request.getParameter("pd_id");
        String scoreParam   = request.getParameter("r_score");
        String contentParam = request.getParameter("r_content");

        System.out.println("[insert] pd_idParam=" + pdIdParam + ", r_score=" + scoreParam + ", content=" + contentParam);

        if (pdIdParam == null || pdIdParam.isEmpty()
         || scoreParam == null || scoreParam.isEmpty()
         || contentParam == null || contentParam.trim().isEmpty()) {
            return "redirect:/review_list.bc";
        }

        int pdId, score;
        try {
            pdId = Integer.parseInt(pdIdParam);
            score = Integer.parseInt(scoreParam);
        } catch (NumberFormatException e) {
            return "redirect:/review_list.bc?pd_id=" + pdIdParam;
        }

        HttpSession sess = request.getSession(false);
        Integer uMemberId = null;
        if (sess != null) {
            Object v = sess.getAttribute("session_u_member_id");
            if (v == null) v = sess.getAttribute("sessionid");
            if (v instanceof Integer) uMemberId = (Integer) v;
            else if (v instanceof String) {
                try { uMemberId = Integer.parseInt((String) v); } catch (Exception ignore) {}
            }
        }
        if (uMemberId == null) {
            return "redirect:/login.do";
        }

        ReviewDTO dto = new ReviewDTO();
        dto.setPd_id(pdId);
        dto.setU_member_id(uMemberId);
        dto.setR_score(score);
        dto.setR_content(contentParam.trim());

        dao.insertReview(dto);
        return "redirect:/review_list.bc?pd_id=" + pdId;
    }
}
