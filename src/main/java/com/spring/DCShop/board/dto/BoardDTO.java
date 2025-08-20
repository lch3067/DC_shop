package com.spring.DCShop.board.dto;

import java.sql.Date;

public class BoardDTO {
	
	private int b_num;				// 글번호
	private String u_id;		// fk - 아이디
	private String b_title;			// 제목
	private String b_content;		// 내용
	private String b_category;		// 카테고리
	private Date b_dateposted;			// 작성일
	private Date b_updateDate;
	private int b_views;			// 조회수
	private int b_recommend;		// 추천수
	private String b_image;			// 이미지
	
	public BoardDTO() {
		super();
	}

	public BoardDTO(int b_num, String u_id, String b_title, String b_content, String b_category, Date b_dateposted,
			Date b_updateDate, int b_views, int b_recommend, String b_image) {
		super();
		this.b_num = b_num;
		this.u_id = u_id;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_category = b_category;
		this.b_dateposted = b_dateposted;
		this.b_updateDate = b_updateDate;
		this.b_views = b_views;
		this.b_recommend = b_recommend;
		this.b_image = b_image;
	}

	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_category() {
		return b_category;
	}
	public void setB_category(String b_category) {
		this.b_category = b_category;
	}

	public Date getB_dateposted() {
		return b_dateposted;
	}
	public void setB_dateposted(Date b_dateposted) {
		this.b_dateposted = b_dateposted;
	}

	public Date getB_updateDate() {
		return b_updateDate;
	}
	public void setB_updateDate(Date b_updateDate) {
		this.b_updateDate = b_updateDate;
	}

	public int getB_views() {
		return b_views;
	}
	public void setB_views(int b_views) {
		this.b_views = b_views;
	}

	public int getB_recommend() {
		return b_recommend;
	}
	public void setB_recommend(int b_recommend) {
		this.b_recommend = b_recommend;
	}

	public String getB_image() {
		return b_image;
	}
	public void setB_image(String b_image) {
		this.b_image = b_image;
	}

	@Override
	public String toString() {
		return "BoardDTO [b_num=" + b_num + ", u_id=" + u_id + ", b_title=" + b_title + ", b_content="
				+ b_content + ", b_category=" + b_category + ", b_dateposted=" + b_dateposted + ", b_updateDate="
				+ b_updateDate + ", b_views=" + b_views + ", b_recommend=" + b_recommend + ", b_image=" + b_image + "]";
	}
	
}
