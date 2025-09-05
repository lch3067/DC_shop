package com.spring.DCShop.shop.dto;

import java.util.List;

public class CheckoutRequest {
	private java.util.List<CartItemRequest> items;
	private Long totalClient;
	private String shipping;
	  
	public CheckoutRequest() {}

	public CheckoutRequest(List<CartItemRequest> items, Long totalClient, String shipping) {
		super();
		this.items = items;
		this.totalClient = totalClient;
		this.shipping = shipping;
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

	public String getShipping() {
		return shipping;
	}

	public void setCurrency(String shipping) {
		this.shipping = shipping;
	}

	@Override
	public String toString() {
		return "CheckoutRequest [items=" + items + ", totalClient=" + totalClient + ", shipping=" + shipping + "]";
	}
	  
}
