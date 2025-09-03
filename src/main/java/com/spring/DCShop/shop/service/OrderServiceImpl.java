package com.spring.DCShop.shop.service;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.DCShop.shop.dao.OrderDAO;
import com.spring.DCShop.shop.dto.OrderDTO;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	OrderDAO dao;

	@Override
	public void orderInsertAction(String jsonBody, JSONObject jsonObject) throws Exception {
		System.out.println("OrderServiceImpl - orderInsertAction()");
				
		JSONParser parser = new JSONParser();
		
        Long o_num;
        int pd_id;
        int u_member_id;
        int o_price;
        int o_count;
        String o_request;

        try {
        	JSONObject requestData = (JSONObject) parser.parse(jsonBody);
        	
        	JSONObject orderInfo = (JSONObject) requestData.get("orderInfo");
            System.out.println("orderInfo = " + orderInfo.toJSONString());
            
        	// o_num은 문자열로 넘어오기 때문에 Long 변환
            o_num = Long.valueOf(orderInfo.get("o_num").toString());
            // 숫자들은 JSONParser가 Long으로 파싱하므로 바로 캐스팅 후 intValue() 사용
            pd_id = ((Long) orderInfo.get("pd_id")).intValue();
            u_member_id = ((Long) orderInfo.get("u_member_id")).intValue();
            o_price = ((Long) orderInfo.get("o_price")).intValue();
            o_count = ((Long) orderInfo.get("o_count")).intValue();
            o_request = (String)orderInfo.get("o_request");
        } catch (ParseException e) {
            throw new RuntimeException(e);
        };
        
        System.out.println("o_num = " + o_num);
        System.out.println("pd_id = " + pd_id);
        System.out.println("o_price = " + o_price);
        System.out.println("o_count = " + o_count);
        System.out.println("o_request = " + o_request);
        
        OrderDTO dto = new OrderDTO();
        
        dto.setO_num(o_num);
        dto.setPd_id(pd_id);
        dto.setU_member_id(u_member_id);
        dto.setO_price(o_price);
        dto.setO_count(o_count);
        dto.setO_payment("카카오페이");
        dto.setO_request(o_request);
	}

}
