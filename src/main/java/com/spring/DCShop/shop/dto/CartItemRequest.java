package com.spring.DCShop.shop.dto;

public class CartItemRequest {
	private Long pdId;
	private String pdName;
	private Integer pdPrice;
	private Integer qty;
	
	public CartItemRequest() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CartItemRequest(Long pdId, String pdName, Integer pdPrice, Integer qty) {
		super();
		this.pdId = pdId;
		this.pdName = pdName;
		this.pdPrice = pdPrice;
		this.qty = qty;
	}
	
	public Long getPdId() {
		return pdId;
	}
	
	public void setPdId(Long pdId) {
		this.pdId = pdId;
	}
	
	public String getPdName() {
		return pdName;
	}
	
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	
	public Integer getPdPrice() {
		return pdPrice;
	}
	
	public void setPdPrice(Integer pdPrice) {
		this.pdPrice = pdPrice;
	}
	
	public Integer getQty() {
		return qty;
	}
	
	public void setQty(Integer qty) {
		this.qty = qty;
	}
	
	@Override
	public String toString() {
		return "CartItemRequest [pdId=" + pdId + ", pdName=" + pdName + ", pdPrice=" + pdPrice + ", qty=" + qty + "]";
	}

}