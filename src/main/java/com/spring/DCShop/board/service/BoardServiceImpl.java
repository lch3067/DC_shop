package com.spring.DCShop.board.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.DCShop.board.dao.BoardDAO;
import com.spring.DCShop.board.dto.BoardDTO;
import com.spring.DCShop.board.page.Paging;
import com.spring.DCShop.user.dto.UserDTO;


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
		System.out.println("BoardServiceImpl - boardDetailAction()");
		
		// 화면에서 입력받은 값을 가져오기
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		String u_id = (String)request.getSession().getAttribute("sessionid");
		System.out.println(u_id);
		
		// 조회수 증가 - 목록에서 클릭했을시에만 증가하도록
		int listClick = Integer.parseInt(request.getParameter("listClick"));
		if(listClick == 1) {
			dao.viewsUpdateAction(b_num);
		}
		
		// 게시판 상세페이지 가져오기
		BoardDTO board = dao.boardDetailAction(b_num);
		System.out.println(board);
		
		model.addAttribute("board", board);
		
		// 로그인한 사용자라면 해당 게시글을 추천한 사용자인지 확인
		if (u_id != null) {
			// 회원아이디에 맞는 회원번호 가져오기
			int u_member_id = dao.selectU_member_id(u_id);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("u_member_id", u_member_id);
			map.put("b_num", b_num);
			
			int isRecommended = dao.isRecommended(map);
			
			model.addAttribute("isRecommended", isRecommended);
		} else {
			model.addAttribute("isRecommended", 0);
		}
			
	}
	
	// 게시판 추천 클릭
	public Map<String, Object> recommendClickAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("BoardServiceImpl - recommendClickAction()");
		
		// 화면에서 입력받은 값을 가져오기
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		int click = Integer.parseInt(request.getParameter("click"));
		
		String u_id = (String)request.getSession().getAttribute("sessionid");
		
		// 회원아이디에 맞는 회원번호 가져오기
		int u_member_id = dao.selectU_member_id(u_id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("b_num", b_num);
		map.put("u_member_id", u_member_id);
		
		if(click == 1) {
			dao.recommendAddAction(map);
		} else {
			dao.recommendRemoveAction(map);
		}
		
		// board_tbl에 추천수 반영
		int success = dao.recommendUpdateAction(b_num);
		
		// 추천 성공 시 현재 추천 수 가져오기
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(success == 1) {
			int b_recommend  = dao.selectB_recommend(b_num);
			result.put("b_recommend", b_recommend);
		}
		
		result.put("success", success);
		
		return result;
	}
	
	// 작성자
	public void selectU_nicknameAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("BoardServiceImpl - selectU_nicknameAction()");
		
		String u_id = (String)request.getSession().getAttribute("sessionid");
		
		String u_nickname = dao.selectU_nicknameAction(u_id);
		
		model.addAttribute("u_nickname", u_nickname);
	}

	// 게시판 등록
	@Override
	public int boardInsertAction(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("BoardServiceImpl - boardInsertAction()");

		MultipartFile file = request.getFile("b_image");
		System.out.println("file : " + file);
		
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		int b_num = 0;
		
		try {
			//화면에서 입력받은 값 가져와서 dto에 setter로 담는다
			BoardDTO dto = new BoardDTO();
			String u_id = (String)request.getSession().getAttribute("sessionid");
			
			// 회원아이디에 맞는 회원번호 가져오기
			int u_member_id = dao.selectU_member_id(u_id);
			dto.setU_member_id(u_member_id);
			
			dto.setB_title(request.getParameter("b_title"));
			dto.setB_contents(request.getParameter("b_contents"));
			dto.setB_category(request.getParameter("b_category"));
			
			if(!file.isEmpty()) {
				ServletContext save = request.getSession().getServletContext();
				System.out.println(save);
				
				String saveDir = request.getSession().getServletContext().getRealPath("/resources/board_upload/");
				System.out.println("saveDir : " + saveDir);
				
				String realDir = "D:\\DEV05\\workspace_DCshop\\DCShop\\src\\main\\webapp\\resources\\board_upload\\";
				System.out.println("realDir : " + realDir);
				
				file.transferTo(new File(saveDir + file.getOriginalFilename())); 	// import java.io.File
				fis = new FileInputStream(saveDir + file.getOriginalFilename());
				fos = new FileOutputStream(realDir + file.getOriginalFilename());
				
				int data = 0;
				while((data = fis.read())!= -1) {
					fos.write(data);
				}
				
				String b_image1 = "/DCShop_team/resources/board_upload/" + file.getOriginalFilename();
				System.out.println("p_img1 : " + b_image1);
				dto.setB_image(b_image1);
			} else {
				dto.setB_image(null);
			}
			
			
			// 게시글 작성 처리 후 컨트롤러에서 board_list로 이동
			int insertCnt = dao.boardInsertAction(dto);
			
			// jsp로 처리결과 전달
			model.addAttribute("insertCnt", insertCnt);
			
			b_num = dao.selectB_num(u_member_id);
			
			return b_num;
			
		} catch(IOException e) {
			e.printStackTrace();
		} finally {
			if(fis != null) fis.close();
			if(fos != null) fos.close();
		}
		
		return b_num;
	}

	// 게시판 수정 정보
	@Override
	public void boardUpdateDTOAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// 게시판 수정 등록
	@Override
	public void boardUpdateAction(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
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
