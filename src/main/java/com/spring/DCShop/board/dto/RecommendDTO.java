package com.spring.DCShop.board.dto;

public class RecommendDTO {

	private int rec_num;
	private int u_member_id;
	private int b_num;
	
	public RecommendDTO() {
		super();
	}

	public RecommendDTO(int rec_num, int u_member_id, int b_num) {
		super();
		this.rec_num = rec_num;
		this.u_member_id = u_member_id;
		this.b_num = b_num;
	}

	public int getRec_num() {
		return rec_num;
	}

	public void setRec_num(int rec_num) {
		this.rec_num = rec_num;
	}

	public int getU_member_id() {
		return u_member_id;
	}

	public void setU_member_id(int u_member_id) {
		this.u_member_id = u_member_id;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	@Override
	public String toString() {
		return "RecommendDTO [rec_num=" + rec_num + ", u_member_id=" + u_member_id + ", b_num=" + b_num + "]";
	}
	
}

// rec_num		NUMBER	PRIMARY KEY,	-- 추천 번호(일련번호)
// u_member_id	NUMBER	NOT NULL,		-- 회원 FK(숫자 키)
// b_num		NUMBER	NOT NULL,		-- 게시판번호 FK(숫자 키)