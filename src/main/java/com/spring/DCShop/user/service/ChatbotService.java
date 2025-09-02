package com.spring.DCShop.user.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class ChatbotService {
	
	@Value("${channelio.pluginKey}") //application.properties의 환경값 주입.
	private String pluginKey;
    
	public String getPluginKey() {
		return pluginKey;
    }
}
