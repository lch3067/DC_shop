package com.spring.DCShop.user.dto;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class ChatbotProvider {
	
	@Value("${channelio.pluginKey}") //application.properties의 환경값 주입.
	private String pluginKey;
    
	public String getPluginKey() {
		return pluginKey;
    }
}
