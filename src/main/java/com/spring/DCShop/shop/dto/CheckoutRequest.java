package com.spring.DCShop.shop.dto;

import java.util.List;

public class CheckoutRequest {
	private java.util.List<CartItemRequest> items;
	private Long totalClient;
	private String currency;
	  
	public CheckoutRequest() {}

	public CheckoutRequest(List<CartItemRequest> items, Long totalClient, String currency) {
		super();
		this.items = items;
		this.totalClient = totalClient;
		this.currency = currency;
	}

	public java.util.List<CartItemRequest> getItems() {
		return items;
	}

	public void setItems(java.util.List<CartItemRequest> items) {
		this.items = items;
	}

	public Long getTotalClient() {
		return totalClient;
	}

	public void setTotalClient(Long totalClient) {
		this.totalClient = totalClient;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	@Override
	public String toString() {
		return "CheckoutRequest [items=" + items + ", totalClient=" + totalClient + ", currency=" + currency + "]";
	}
	  
}
