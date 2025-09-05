package com.spring.DCShop.shop.dto;

public class CartItemRequest {
	private Long pdId;
	private String pdName;
	private Integer pdPrice;
	private Integer qty;
	private Integer pd_discount_rate;
	
	public CartItemRequest() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CartItemRequest(Long pdId, String pdName, Integer pdPrice, Integer qty, Integer pd_discount_rate) {
		super();
		this.pdId = pdId;
		this.pdName = pdName;
		this.pdPrice = pdPrice;
		this.qty = qty;
		this.pd_discount_rate = pd_discount_rate;
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

	public Integer getPd_discount_rate() {
		return pd_discount_rate;
	}

	public void setPd_discount_rate(Integer pd_discount_rate) {
		this.pd_discount_rate = pd_discount_rate;
	}

	@Override
	public String toString() {
		return "CartItemRequest [pdId=" + pdId + ", pdName=" + pdName + ", pdPrice=" + pdPrice + ", qty=" + qty
				+ ", pd_discount_rate=" + pd_discount_rate + "]";
	}
	
}