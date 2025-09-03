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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
            return "redirect:/review_list.bc?pd_id=1"; 
        }

        int pdId = Integer.parseInt(pdIdParam);

        // 페이징
        int pageSize = 10;
        int currentPage = 1;
        try { if (pageNum != null) currentPage = Integer.parseInt(pageNum); } catch (Exception ignore) {}
        if (currentPage < 1) currentPage = 1;
        
        int total = dao.reviewCnt(pdId);
        
        int startRow = (currentPage - 1) * pageSize + 1;
        int endRow = currentPage * pageSize;
        if (endRow > total) endRow = total;
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pd_id", pdId);
        map.put("startRow", startRow);
        map.put("endRow", endRow);
        
        List<ReviewDTO> list = dao.reviewList(map);
        
        Paging paging = new Paging(String.valueOf(currentPage));
        paging.setTotalCount(total);
        paging.setPageSize(pageSize);

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
    
    // 리뷰 수정화면
    @Override
    public void reviewEditForm(HttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {
        String p = request.getParameter("r_num");
        if (p == null || p.isBlank()) {
            response.sendRedirect(request.getContextPath() + "/review_list.bc");
            return;
        }

        int r_num;
        try { r_num = Integer.parseInt(p); }
        catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/review_list.bc");
            return;
        }

        // 상세 조회
        ReviewDTO dto = dao.getReviewDetail(r_num);
        if (dto == null) {
            response.sendRedirect(request.getContextPath() + "/review_list.bc");
            return;
        }

        // (권장) 권한 체크: 작성자 or ADMIN만 수정 가능
        HttpSession session = request.getSession(false);
        Integer loginMemberId = (session == null) ? null : (Integer) session.getAttribute("session_u_member_id");
        String role = (session == null) ? null : (String) session.getAttribute("role");
        boolean allowed = ("ADMIN".equals(role)) ||
                          (loginMemberId != null && loginMemberId.intValue() == dto.getU_member_id());

        if (!allowed) {
            response.sendRedirect(request.getContextPath() + "/review_detailAction.bc?r_num=" + r_num);
            return;
        }

        // 수정폼에서 사용할 데이터 올리기
        model.addAttribute("dto", dto);
    }


    // 리뷰 수정
    @Override
    public void reviewUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {

        System.out.println("ReviewServiceImpl - reviewUpdateAction()");

        int rNum   = Integer.parseInt(request.getParameter("r_num"));
        int score  = Integer.parseInt(request.getParameter("r_score"));
        String content = request.getParameter("r_content");
        String origin  = request.getParameter("origin_r_img"); // hidden

        String newFileName = null;

        // 파일 업로드
        if (request instanceof MultipartHttpServletRequest) {
            MultipartHttpServletRequest mreq = (MultipartHttpServletRequest) request;
            MultipartFile file = mreq.getFile("r_imgFile"); // ← edit.jsp의 file name와 동일
            if (file != null && !file.isEmpty()) {
                String originName = file.getOriginalFilename();
                String ext = (originName != null && originName.lastIndexOf('.') > -1)
                           ? originName.substring(originName.lastIndexOf('.')) : "";
                String uuid = java.util.UUID.randomUUID().toString().replace("-", "");
                newFileName = uuid + ext;

                String root = request.getSession().getServletContext().getRealPath("/");
                java.nio.file.Path dir = java.nio.file.Paths.get(root, "resources", "upload", "review");
                java.nio.file.Files.createDirectories(dir);
                file.transferTo(dir.resolve(newFileName).toFile());
            }
        }

        ReviewDTO dto = new ReviewDTO();
        dto.setR_num(rNum);
        dto.setR_score(score);
        dto.setR_content(content);
        if (newFileName != null) {           // 새 파일 올렸을 때만 바꿈
            dto.setR_img(newFileName);
        }

        dao.updateReview(dto);               
    }


    // 리뷰 삭제
    @Override
    public void reviewDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {
        System.out.println("ReviewServiceImpl - reviewDeleteAction()");
        String p = request.getParameter("r_num");
        int num = Integer.parseInt(p);
        dao.deleteReview(num);
    }

    // 리뷰 작성 
    @Override
    public String reviewInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {
        System.out.println("ReviewServiceImpl - reviewInsertAction()");
        System.out.println("[insert] ct=" + request.getContentType());

        MultipartHttpServletRequest mreq = (request instanceof MultipartHttpServletRequest)
                ? (MultipartHttpServletRequest) request : null;
        
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
        
     // ====== 파일 저장 ======
        String savedName = null;
        if (mreq != null) {
            MultipartFile file = mreq.getFile("r_imgFile");
            if (file != null && !file.isEmpty()) {
                String origin = file.getOriginalFilename();
                String ext = (origin != null && origin.lastIndexOf('.') > -1) ? origin.substring(origin.lastIndexOf('.')) : "";
                String uuid = java.util.UUID.randomUUID().toString().replace("-", "");
                savedName = uuid + ext;

                // 저장 경로 
                String root = request.getSession().getServletContext().getRealPath("/");
                java.nio.file.Path dir = java.nio.file.Paths.get(root, "resources", "upload", "review");
                java.nio.file.Files.createDirectories(dir);
                java.nio.file.Path dst = dir.resolve(savedName);
                file.transferTo(dst.toFile());
            }
        }

        ReviewDTO dto = new ReviewDTO();
        dto.setPd_id(pdId);
        dto.setU_member_id(uMemberId);
        dto.setR_score(score);
        dto.setR_content(contentParam.trim());
        dto.setR_img(savedName);

        dao.insertReview(dto);
        return "redirect:/review_list.bc?pd_id=" + pdId;
    }

	@Override
	public void increaseLike(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}
}
