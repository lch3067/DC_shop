package com.spring.DCShop.shop.service;

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

import com.spring.DCShop.shop.dao.ProductDAO;
import com.spring.DCShop.shop.dto.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDAO dao;
	
	
	// 상품상세페이지
	@Override
	public void productDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ProductServiceImpl - productDetailAction");
		
		// pd_id 파라미터 안전 처리: 없거나 잘못되면 1로 폴백
        String pdIdParam = request.getParameter("pdId");
        
        System.out.println(pdIdParam);
        
        int pd_id;
        try {
            pd_id = (pdIdParam == null || pdIdParam.isEmpty()) ? 1 : Integer.parseInt(pdIdParam);
        } catch (NumberFormatException e) {
            pd_id = 1;
        }
		
		// DB 조회
		ProductDTO dto = dao.productDetail(pd_id);
		
		// jsp로 처리결과 전달
		model.addAttribute("dto", dto);
		
	}
}
