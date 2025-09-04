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
        // 어떤 상품의 리뷰인지 pd_id 파라미터로 받음
        String pdIdParam = request.getParameter("pd_id");
        String pageNum   = request.getParameter("pageNum");

        // pd_id= null => 1번 상품으로 리다이렉트
        if (pdIdParam == null || pdIdParam.isEmpty()) {
            return "redirect:/review_list.bc?pd_id=1"; 
        }

        int pdId = Integer.parseInt(pdIdParam);

        // 페이징
        int pageSize = 10;
        int currentPage = 1;
        try { if (pageNum != null) currentPage = Integer.parseInt(pageNum); } catch (Exception ignore) {}
        if (currentPage < 1) currentPage = 1;
        
        // 해당 상품 리뷰 총 개수 DB에서 조회
        int total = dao.reviewCnt(pdId);
        
        // 현재 페이지에 보여줄 범위를 구함(1부터 시작)
        int startRow = (currentPage - 1) * pageSize + 1;
        int endRow = currentPage * pageSize;
        if (endRow > total) endRow = total;
        
        // map에 pd_id, startRow, endRow 담기
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pd_id", pdId);
        map.put("startRow", startRow);
        map.put("endRow", endRow);
        
        List<ReviewDTO> list = dao.reviewList(map);
        
        Paging paging = new Paging(String.valueOf(currentPage));
        paging.setTotalCount(total);
        paging.setPageSize(pageSize);

        // 모델에 담아서 review_list(목록)jsp로 이동
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
        
        // 어떤 리뷰를 볼 건지 r_num(리뷰번호) 받기
        String p = request.getParameter("r_num");
        
        // 리뷰번호(r_num) 없으면 목록으로 리다이렉트
        if (p == null || p.isBlank()) {
            response.sendRedirect(request.getContextPath() + "/review_list.bc");
            return;
        }
        int r_num = Integer.parseInt(p);
        
        // DB에서 리뷰 한 건 조회
        ReviewDTO dto = dao.getReviewDetail(r_num);
        model.addAttribute("dto", dto);
    }
    
    // 수정/삭제 체크
    @Override
    public int review_chkAction(HttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {
        System.out.println("ReviewServiceImpl - review_chkAction()");
        
        // 폼에서 넘어온 리뷰번호를 먼저 hidden_r_num에서 찾고, 없으면 r_num에서 찾음
        String p = request.getParameter("hidden_r_num");
        if (p == null || p.isBlank()) p = request.getParameter("r_num");
        
        // 값이 비었거나 숫자가 아니면 실패(0) 반환
        if (p == null || !p.matches("\\d+")) return 0;
        
        int r_num = Integer.parseInt(p);

        // 기존 세션만 꺼냄 (없으면 새로 만들지 않음)
        HttpSession session = request.getSession(false);
        
        // 로그인 여부 확인. 세션에 u_id가 없으면 로그인 안 된 것이므로 실패(0)
        String u_id = (session == null) ? null : (String) session.getAttribute("u_id");
        if (u_id == null || u_id.isEmpty()) return 0;

        // 그 리뷰가 실제 DB에 있는지 확인. 없으면 실패(0)
        ReviewDTO dto = dao.getReviewDetail(r_num);
        if (dto == null) return 0;

        // 모델에 리뷰 정보 싣고, 성공(1) 반환
        model.addAttribute("dto", dto);
        return 1;
    }
    
    // 리뷰 수정화면
    @Override
    public void reviewEditForm(HttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {
    	
        String p = request.getParameter("r_num");
        
        // r_num 없거나 숫자 아니면 목록으로 리다이렉트
        if (p == null || p.isBlank()) {
            response.sendRedirect(request.getContextPath() + "/review_list.bc");
            return;
        }

        // 숫자로 변환 실패하면 목록으로
        int r_num;
        try { r_num = Integer.parseInt(p); }
        catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/review_list.bc");
            return;
        }

        // 해당 리뷰가 DB에 없으면 목록으로
        ReviewDTO dto = dao.getReviewDetail(r_num);
        if (dto == null) {
            response.sendRedirect(request.getContextPath() + "/review_list.bc");
            return;
        }

        // 세션에서 로그인한 회원번호와 권한 가져오기
        HttpSession session = request.getSession(false);
        Integer loginMemberId = (session == null) ? null : (Integer) session.getAttribute("session_u_member_id");
        String role = (session == null) ? null : (String) session.getAttribute("role");
        
        // 관리자이거나, 글쓴이 본인이면 수정 가능
        boolean allowed = ("ADMIN".equals(role)) ||
                          (loginMemberId != null && loginMemberId.intValue() == dto.getU_member_id());

        // 권한 없으면 상세페이지로 돌려보냄
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

        // 파라미터 추출
        int rNum   = Integer.parseInt(request.getParameter("r_num"));
        int score  = Integer.parseInt(request.getParameter("r_score"));
        String content = request.getParameter("r_content");

        String newFileName = null;

        // 멀티파트 요청(파일 업로드)인지 확인하고, r_imgFile을 꺼냄
        if (request instanceof MultipartHttpServletRequest) {
            MultipartHttpServletRequest mreq = (MultipartHttpServletRequest) request;
            MultipartFile file = mreq.getFile("r_imgFile"); 
            
            // 파일이 있다면 원래 파일명에서 확장자만 뽑아옴 (없으면 빈 문자열)
            if (file != null && !file.isEmpty()) {
                String originName = file.getOriginalFilename();
                String ext = (originName != null && originName.lastIndexOf('.') > -1)
                           ? originName.substring(originName.lastIndexOf('.')) : "";
                // 충돌 방지를 위해 랜덤한 파일명 생성
                String uuid = java.util.UUID.randomUUID().toString().replace("-", "");
                newFileName = uuid + ext;

                // 실제 저장 경로(/resources/upload/review)를 만들고 거기에 파일 저장
                String root = request.getSession().getServletContext().getRealPath("/");
                java.nio.file.Path dir = java.nio.file.Paths.get(root, "resources", "upload", "review");
                java.nio.file.Files.createDirectories(dir);
                file.transferTo(dir.resolve(newFileName).toFile());
            }
        }

        // dto에 변경사항 세팅
        ReviewDTO dto = new ReviewDTO();
        dto.setR_num(rNum);
        dto.setR_score(score);
        dto.setR_content(content);
        // 새 파일이 있을 때만 r_img 갱신(없으면 기존 유지)
        if (newFileName != null) {           
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

        // 멀티파트 요청이면 캐스팅해서 파일을 다룰 수 있게 준비
        MultipartHttpServletRequest mreq = (request instanceof MultipartHttpServletRequest)
                ? (MultipartHttpServletRequest) request : null;
        
        String pdIdParam    = request.getParameter("pd_id");
        String scoreParam   = request.getParameter("r_score");
        String contentParam = request.getParameter("r_content");

        // 필수값(상품/점수/내용)이 하나라도 빠지면 목록으로 돌려보냄
        if (pdIdParam == null || pdIdParam.isEmpty()
         || scoreParam == null || scoreParam.isEmpty()
         || contentParam == null || contentParam.trim().isEmpty()) {
            return "redirect:/review_list.bc";
        }

        // 상품ID와 점수가 숫자인지 확인. 숫자 아니면 목록으로
        int pdId, score;
        try {
            pdId = Integer.parseInt(pdIdParam);
            score = Integer.parseInt(scoreParam);
        } catch (NumberFormatException e) {
            return "redirect:/review_list.bc?pd_id=" + pdIdParam;
        }

        // 기존 세션 가져오고, 로그인 회원번호 변수 준비
        HttpSession sess = request.getSession(false);
        Integer uMemberId = null;
        // 세션에서 회원번호를 꺼냄
        if (sess != null) {
            Object v = sess.getAttribute("session_u_member_id");
            if (v == null) v = sess.getAttribute("sessionid");
            if (v instanceof Integer) uMemberId = (Integer) v;
            else if (v instanceof String) {
                try { uMemberId = Integer.parseInt((String) v); } catch (Exception ignore) {}
            }
        }
        // 로그인 안 되어 있으면 로그인 화면으로
        if (uMemberId == null) {
            return "redirect:/login.do";
        }
        
     // ====== 파일 저장 ======
     // 첨부 이미지가 있으면 확장자 뽑고 UUID 파일명 만들기
        String savedName = null;
        if (mreq != null) {
            MultipartFile file = mreq.getFile("r_imgFile");
            if (file != null && !file.isEmpty()) {
                String origin = file.getOriginalFilename();
                String ext = (origin != null && origin.lastIndexOf('.') > -1) ? origin.substring(origin.lastIndexOf('.')) : "";
                String uuid = java.util.UUID.randomUUID().toString().replace("-", "");
                savedName = uuid + ext;

                // 저장 경로 : /resources/upload/review에 파일 저장
                String root = request.getSession().getServletContext().getRealPath("/");
                java.nio.file.Path dir = java.nio.file.Paths.get(root, "resources", "upload", "review");
                java.nio.file.Files.createDirectories(dir);
                java.nio.file.Path dst = dir.resolve(savedName);
                file.transferTo(dst.toFile());
            }
        }

        // DB에 넣을 리뷰 데이터 채우기
        ReviewDTO dto = new ReviewDTO();
        dto.setPd_id(pdId);
        dto.setU_member_id(uMemberId);
        dto.setR_score(score);
        dto.setR_content(contentParam.trim());
        dto.setR_img(savedName);

        dao.insertReview(dto);
        
        // 방금 작성한 그 상품의 리뷰 목록으로 이동
        return "redirect:/review_list.bc?pd_id=" + pdId;
    }
}
