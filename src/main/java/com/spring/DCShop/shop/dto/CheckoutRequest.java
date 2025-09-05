package com.spring.DCShop.shop.dto;

import java.util.List;

public class CheckoutRequest {
	private List<CartItemRequest> items;
	private Integer pdShippingFee;
	private Long totalClient;
	private String currency;
	private Integer totalDiscount;
	  
	public CheckoutRequest() {}

	public CheckoutRequest(List<CartItemRequest> items,Integer pdShippingFee , Long totalClient, String currency, Integer totalDiscount) {
		super();
		this.items = items;
		this.pdShippingFee = pdShippingFee;
		this.totalClient = totalClient;
		this.currency = currency;
		this.totalDiscount = totalDiscount;
	}

	public List<CartItemRequest> getItems() {
		return items;
	}

	public void setItems(List<CartItemRequest> items) {
		this.items = items;
	}
	
	public Integer getPdShippingFee() {
		return pdShippingFee;
	}
	
	public void setPdShippingFee(Integer pdShippingFee) {
		this.pdShippingFee = pdShippingFee;
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
	
	public Integer getTotalDiscount() {
		return totalDiscount;
	}
	
	public void setTotalDiscount(Integer totalDiscount) {
		this.totalDiscount = totalDiscount;
	}

	@Override
	public String toString() {
		return "CheckoutRequest [items=" + items + ", pdShippingFee=" + pdShippingFee + ", totalClient=" + totalClient + ", currency=" + currency + ", totalDiscount=" + totalDiscount + "]";
	}
	  
}
