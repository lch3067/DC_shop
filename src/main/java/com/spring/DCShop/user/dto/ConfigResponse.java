package com.spring.DCShop.user.dto;

public class ConfigResponse {
	//매개변수 생성자로 값을 부여하기 위해 private가 아닌 public.
	public String pluginKey;	//플러그인 키(channel.io API)
	public String lang;
	
	public ConfigResponse(String pluginKey, String lang) {
		this.pluginKey = pluginKey;
		this.lang = lang;
	}
}
