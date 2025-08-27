package com.spring.DCShop.shop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.DCShop.shop.dao.ShopDAO;
import com.spring.DCShop.shop.dto.ShopDTO;
import com.spring.DCShop.shop.page.Paging;

@Service
public class ShopServiceImpl implements ShopService{

	@Autowired
	private ShopDAO dao;
	
	@Override
	public void productListAction(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		// 페이지 처리를 위해 화면에서 입력받은 pageNum 가져오기
		String pageNum = request.getParameter("pageNum");
		String sortOrder = request.getParameter("sortOrder");		// 정렬타입
		String keyword = request.getParameter("searchKeyword");
		String petType = request.getParameter("petType");   
		String category = request.getParameter("category");
		System.out.println("키워드 : "+keyword);
		System.out.println("정렬 : "+sortOrder);
		System.out.println("동물종류 : "+petType + "   카테고리 :" + category);
		
		// 게시글 갯수 
		Map<String, Object> map = new HashMap<>();
		Paging paging = new Paging(pageNum);
		
		
		Map<String, Object> countP = new HashMap<>();
		countP.put("keyword", keyword);
		countP.put("petType", petType);
		// 전체 상품 수 조회 (+키워드에 맞게)
		int total = dao.productCnt(countP);
		
		// 페이징 객체에 전체 상품수 전달하깅!
		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		map.put("start", start);
		map.put("end", end);
		map.put("sortOrder", sortOrder);
		map.put("keyword", keyword);
		map.put("petType", petType);
		
		
		
		List<ShopDTO> list = dao.productListAction(map);
		
		System.out.println("service list :"+list);
		System.out.println("service map :"+map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging",paging);
		model.addAttribute("sortOrder", sortOrder);
		model.addAttribute("keyword", keyword);
		model.addAttribute("petType", petType);
		model.addAttribute("total", total);
	}

}
