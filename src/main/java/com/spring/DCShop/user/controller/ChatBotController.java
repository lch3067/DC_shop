package com.spring.DCShop.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.DCShop.user.dto.ConfigResponse;
import com.spring.DCShop.user.service.ChatbotService;

@RestController
public class ChatBotController {
	
	@Autowired
	private ChatbotService prov;
	
	public ChatBotController(ChatbotService prov) {
		this.prov = prov;
	}
	
	
	@GetMapping(value="/config", produces = MediaType.APPLICATION_JSON_VALUE)
	public ConfigResponse config(HttpSession session) {
		
		// 객체에 환경변수 pluginKey값 담기. 언어는 한국어로 고정.
		ConfigResponse res = new ConfigResponse(prov.getPluginKey(), "ko");
		return res;
	}
	
}
