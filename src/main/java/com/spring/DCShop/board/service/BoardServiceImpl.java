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
		
		List<UserDTO> list = dao.boardListAction(map);
		System.out.println("list : " + list);
		
		// 댓글 개수 구하기
		// dao.commentListTotal();
		
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
		
		UserDTO dto = dao.boardDetailAction(b_num);
		
		System.out.println(dto);
		
		model.addAttribute("dto", dto);
	}

	// 게시판 등록
	@Override
	public void boardInsertAction(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("BoardServiceImpl - boardInsertAction()");

		MultipartFile file = request.getFile("b_image");
		System.out.println("file : " + file);
		
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		try {
			//화면에서 입력받은 값 가져와서 dto에 setter로 담는다
			BoardDTO dto = new BoardDTO();
			// dto.setU_id((String)request.getSession().getAttribute("sessionID"));
			dto.setU_member_id(1);
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
			
		} catch(IOException e) {
			e.printStackTrace();
		} finally {
			if(fis != null) fis.close();
			if(fos != null) fos.close();
		}
		
		// int b_num = dao.selectB_num((String)request.getSession().getAttribute("sessionID"));
		
		// return b_num;
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
