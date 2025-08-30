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
		String category = request.getParameter("category");			// 메인카테고리
		String subcategory = request.getParameter("subcategory");	// 서브카테고리
		// 가격
		String priceMin = request.getParameter("priceMin");
		String priceMax = request.getParameter("priceMax");
		
		
		// 게시글 갯수 
		Map<String, Object> map = new HashMap<>();
		Paging paging = new Paging(pageNum);
		
		
		// 상품 갯수를 가져오기 위해 전달할 Map 생성
		Map<String, Object> countP = new HashMap<>();
		countP.put("keyword", keyword);
		countP.put("petType", petType);
		countP.put("category", category);
		countP.put("subcategory", subcategory);
		countP.put("priceMin", priceMin);
		countP.put("priceMax", priceMax);
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
		map.put("category", category);
		
		map.put("subcategory", subcategory);
		map.put("priceMin", priceMin);
		map.put("priceMax", priceMax);
		
		// (상품)리스트 출력 함수 호출
		List<ShopDTO> list = dao.productListAction(map);
		
		if(category != null && !category.trim().isEmpty()) {
			int categoryI = Integer.parseInt(category);
			List<Integer> cateList = dao.getSubcategory(categoryI);
			model.addAttribute("cateList",cateList);
		}
		
		
		Map<Integer, String> dogcategoryNames = new HashMap<>();
		int[] dogKeys = {1101,1102,1103,1201,1202,1203,1204,1205,1301,1302,1401,1402,1403,1404,1501,1502,1503,1504};
		String[] dogValues = {"대형","중형","소형","샴푸","미용가위","구강관리","타올","발톱깎이","배변패드","기저귀",
		                      "공","원반","터그","인형","목줄","하네스","리드줄","자동줄"};

		for (int i = 0; i < dogKeys.length; i++) {
		    dogcategoryNames.put(dogKeys[i], dogValues[i]);
		}

		Map<Integer, String> catcategoryNames = new HashMap<>();
		int[] catKeys = {2101,2102,2103,2201,2202,2203,2204,2205,2301,2302,2401,2402,2403,2501,2502,2503};
		String[] catValues = {"대형","중형","소형","샴푸","미용가위","구강관리","타올","발톱깎이",
		                      "응고형두부모래","흡수형실리카겔모래","낚시대","공","막대","캣타워형","패드형","하우스형"};

		for (int i = 0; i < catKeys.length; i++) {
		    catcategoryNames.put(catKeys[i], catValues[i]);
		}

		model.addAttribute("dogcategoryNames", dogcategoryNames);
		model.addAttribute("catcategoryNames", catcategoryNames);
		
		
		
		model.addAttribute("list", list);
		model.addAttribute("paging",paging);
		model.addAttribute("sortOrder", sortOrder);
		model.addAttribute("keyword", keyword);
		model.addAttribute("petType", petType);
		model.addAttribute("total", total);
		model.addAttribute("category", category);
		model.addAttribute("subcategory", subcategory);
	}

}
