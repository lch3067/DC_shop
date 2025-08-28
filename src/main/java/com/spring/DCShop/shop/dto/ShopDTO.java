package com.spring.DCShop.shop.dto;

import java.sql.Date;

public class ShopDTO {
	private int pd_id;				// 상품 고유 번호
	private String pd_name;			// 상품명
	private String pd_description;	// 상품설명
	private int pd_price;			// 상품 가격
	private int pd_stock;			// 재고수량
	private int pd_category;		// 상품카테고리
	private Date pd_created;		// 상품 등록일
	private Date pd_updated;		// 상품 수정일
	private String pd_brand;		// 브랜드
	private String pd_image_url;	// 이미지URL
	private int pd_shipping_fee;	// 배송비
	private int pd_discount_rate;	// 할인율
	private String pd_status;		// 판매상태(판매중, 품절, 재입고대기)
	private String pd_option;		// 옵션
	private int pd_pet_category;	// 동물타입(강아지1/고양이2)
	
	private int review_count;		// 리뷰갯수
	private double review_score;	// 리뷰점수
	private String sortOrder;		// 정렬방법
	
	
	public ShopDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ShopDTO(int pd_id, String pd_name, String pd_description, int pd_price, int pd_stock, int pd_category,
			Date pd_created, Date pd_updated, String pd_brand, String pd_image_url, int pd_shipping_fee,
			int pd_discount_rate, String pd_status, String pd_option, int pd_pet_category, int review_count,
			String sortOrder, double review_score) {
		super();
		this.pd_id = pd_id;
		this.pd_name = pd_name;
		this.pd_description = pd_description;
		this.pd_price = pd_price;
		this.pd_stock = pd_stock;
		this.pd_category = pd_category;
		this.pd_created = pd_created;
		this.pd_updated = pd_updated;
		this.pd_brand = pd_brand;
		this.pd_image_url = pd_image_url;
		this.pd_shipping_fee = pd_shipping_fee;
		this.pd_discount_rate = pd_discount_rate;
		this.pd_status = pd_status;
		this.pd_option = pd_option;
		this.pd_pet_category = pd_pet_category;
		this.review_count = review_count;
		this.sortOrder = sortOrder;
		this.review_score = review_score;
	}


	public int getPd_id() {
		return pd_id;
	}


	public void setPd_id(int pd_id) {
		this.pd_id = pd_id;
	}


	public String getPd_name() {
		return pd_name;
	}


	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}


	public String getPd_description() {
		return pd_description;
	}


	public void setPd_description(String pd_description) {
		this.pd_description = pd_description;
	}


	public int getPd_price() {
		return pd_price;
	}


	public void setPd_price(int pd_price) {
		this.pd_price = pd_price;
	}


	public int getPd_stock() {
		return pd_stock;
	}


	public void setPd_stock(int pd_stock) {
		this.pd_stock = pd_stock;
	}


	public int getPd_category() {
		return pd_category;
	}


	public void setPd_category(int pd_category) {
		this.pd_category = pd_category;
	}


	public Date getPd_created() {
		return pd_created;
	}


	public void setPd_created(Date pd_created) {
		this.pd_created = pd_created;
	}


	public Date getPd_updated() {
		return pd_updated;
	}


	public void setPd_updated(Date pd_updated) {
		this.pd_updated = pd_updated;
	}


	public String getPd_brand() {
		return pd_brand;
	}


	public void setPd_brand(String pd_brand) {
		this.pd_brand = pd_brand;
	}


	public String getPd_image_url() {
		return pd_image_url;
	}


	public void setPd_image_url(String pd_image_url) {
		this.pd_image_url = pd_image_url;
	}


	public int getPd_shipping_fee() {
		return pd_shipping_fee;
	}


	public void setPd_shipping_fee(int pd_shipping_fee) {
		this.pd_shipping_fee = pd_shipping_fee;
	}


	public int getPd_discount_rate() {
		return pd_discount_rate;
	}


	public void setPd_discount_rate(int pd_discount_rate) {
		this.pd_discount_rate = pd_discount_rate;
	}


	public String getPd_status() {
		return pd_status;
	}


	public void setPd_status(String pd_status) {
		this.pd_status = pd_status;
	}


	public String getPd_option() {
		return pd_option;
	}


	public void setPd_option(String pd_option) {
		this.pd_option = pd_option;
	}


	public int getPd_pet_category() {
		return pd_pet_category;
	}


	public void setPd_pet_category(int pd_pet_category) {
		this.pd_pet_category = pd_pet_category;
	}


	public int getReview_count() {
		return review_count;
	}


	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}


	public String getSortOrder() {
		return sortOrder;
	}


	public void setSortOrder(String sortOrder) {
		this.sortOrder = sortOrder;
	}


	public double getReview_score() {
		return review_score;
	}


	public void setReview_score(double review_score) {
		this.review_score = review_score;
	}


	@Override
	public String toString() {
		return "ShopDTO [pd_id=" + pd_id + ", pd_name=" + pd_name + ", pd_description=" + pd_description + ", pd_price="
				+ pd_price + ", pd_stock=" + pd_stock + ", pd_category=" + pd_category + ", pd_created=" + pd_created
				+ ", pd_updated=" + pd_updated + ", pd_brand=" + pd_brand + ", pd_image_url=" + pd_image_url
				+ ", pd_shipping_fee=" + pd_shipping_fee + ", pd_discount_rate=" + pd_discount_rate + ", pd_status="
				+ pd_status + ", pd_option=" + pd_option + ", pd_pet_category=" + pd_pet_category + ", review_count="
				+ review_count + ", sortOrder=" + sortOrder + ", review_score=" + review_score + "]";
	}
	
	
}
