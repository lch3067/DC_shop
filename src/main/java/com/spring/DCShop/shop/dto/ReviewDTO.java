package com.spring.DCShop.shop.dto;

import java.sql.Date;

public class ReviewDTO {
	
	private int r_num; // 리뷰번호 (PK)
	private int u_member_id; // 작성자 아이디 (FK)
	private int pd_id; // 상품 고유번호 (FK)
	private String r_content; // 리뷰 내용
	private int r_score; // 별점 (0~5)
	private String r_img; // 리뷰 이미지 URL
	private Date r_regDate; // 작성일
	private String u_nickname; // 닉네임
	
	public ReviewDTO() {
		super();
	}

	public ReviewDTO(int r_num, int u_member_id, int pd_id, String r_content, int r_score, String r_img, Date r_regDate,
			String u_nickname) {
		super();
		this.r_num = r_num;
		this.u_member_id = u_member_id;
		this.pd_id = pd_id;
		this.r_content = r_content;
		this.r_score = r_score;
		this.r_img = r_img;
		this.r_regDate = r_regDate;
		this.u_nickname = u_nickname;
	}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public int getU_member_id() {
		return u_member_id;
	}

	public void setU_member_id(int u_member_id) {
		this.u_member_id = u_member_id;
	}

	public int getPd_id() {
		return pd_id;
	}

	public void setPd_id(int pd_id) {
		this.pd_id = pd_id;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public int getR_score() {
		return r_score;
	}

	public void setR_score(int r_score) {
		this.r_score = r_score;
	}

	public String getR_img() {
		return r_img;
	}

	public void setR_img(String r_img) {
		this.r_img = r_img;
	}

	public Date getR_regDate() {
		return r_regDate;
	}

	public void setR_regDate(Date r_regDate) {
		this.r_regDate = r_regDate;
	}

	public String getU_nickname() {
		return u_nickname;
	}

	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}

	@Override
	public String toString() {
		return "ReviewDTO [r_num=" + r_num + ", u_member_id=" + u_member_id + ", pd_id=" + pd_id + ", r_content="
				+ r_content + ", r_score=" + r_score + ", r_img=" + r_img + ", r_regDate=" + r_regDate + ", r_like_cnt="
				+ ", u_nickname=" + u_nickname + "]";
	}
}
