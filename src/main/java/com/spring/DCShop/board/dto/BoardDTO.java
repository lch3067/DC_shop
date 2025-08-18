package com.spring.DCShop.board.dto;

import java.sql.Date;

public class BoardDTO {
	
	private int b_num;				// 글번호
	private String b_category;		// 카테고리
	private String b_title;			// 제목
	private String b_content;		// 내용
	private int b_recommend;		// 추천수
	private int b_readCnt;			// 조회수
	private Date b_regDate;			// 작성일
	private String b_image;			// 이미지
	private String b_user_id;		// fk - 아이디
	
	public BoardDTO() {
		super();
	}
	
	public BoardDTO(int b_num, String b_category, String b_title, String b_content, int b_recommend, int b_readCnt,
			Date b_regDate, String b_image, String b_user_id) {
		super();
		this.b_num = b_num;
		this.b_category = b_category;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_recommend = b_recommend;
		this.b_readCnt = b_readCnt;
		this.b_regDate = b_regDate;
		this.b_image = b_image;
		this.b_user_id = b_user_id;
	}
	
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	
	public String getB_category() {
		return b_category;
	}
	public void setB_category(String b_category) {
		this.b_category = b_category;
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
	
	public int getB_recommend() {
		return b_recommend;
	}
	public void setB_recommend(int b_recommend) {
		this.b_recommend = b_recommend;
	}
	
	public int getB_readCnt() {
		return b_readCnt;
	}
	public void setB_readCnt(int b_readCnt) {
		this.b_readCnt = b_readCnt;
	}
	
	public Date getB_regDate() {
		return b_regDate;
	}
	public void setB_regDate(Date b_regDate) {
		this.b_regDate = b_regDate;
	}
	
	public String getB_image() {
		return b_image;
	}
	public void setB_image(String b_image) {
		this.b_image = b_image;
	}
	
	public String getB_user_id() {
		return b_user_id;
	}
	public void setB_user_id(String b_user_id) {
		this.b_user_id = b_user_id;
	}
	
	@Override
	public String toString() {
		return "BoardDTO [b_num=" + b_num + ", b_category=" + b_category + ", b_title=" + b_title + ", b_content="
				+ b_content + ", b_recommend=" + b_recommend + ", b_readCnt=" + b_readCnt + ", b_regDate=" + b_regDate
				+ ", b_image=" + b_image + ", b_user_id=" + b_user_id + "]";
	}
	
}

//CREATE TABLE board_tbl (
//		b_num			NUMBER(7)		PRIMARY KEY,		-- 글번호
//		b_category		varchar2(50)	NOT NULL,			-- 카테고리
//		b_title			VARCHAR2(50)	NOT NULL,			-- 글제목
//		b_content 		CLOB			NOT NULL,			-- 글내용
//		b_recommend		NUMBER(5)		DEFAULT 0,			-- 추천수
//		b_readCnt		NUMBER(6)		DEFAULT 0,			-- 조회수
//		b_regDate		DATE			DEFAULT sysdate,	-- 작성일
//		b_image			varchar2(255),						-- 이미지
//		b_user_id		varchar2(50)	-- REFERENCES   user_tbl(user_id)	-- fk
//	);