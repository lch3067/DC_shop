package com.spring.DCShop.user.dto;

public class ChatBotPluginDTO {
	private String pluginKey;
	
	private String lang;
	
	public ChatBotPluginDTO(String pluginKey, String lang) {
		this.pluginKey = pluginKey;
		this.lang = lang;	//한국어 고정
	}
}
