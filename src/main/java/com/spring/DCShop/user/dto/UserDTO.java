package com.spring.DCShop.user.dto;

import java.util.List;

import com.spring.DCShop.board.dto.BoardDTO;

public class UserDTO {
	
	private int u_member_id;
	private String u_id;
	private String u_nickname;
	private List<BoardDTO> boardDTO;
	
	public UserDTO() {
		super();
	}

	public UserDTO(int u_member_id, String u_id, String u_nickname, List<BoardDTO> boardDTO) {
		super();
		this.u_member_id = u_member_id;
		this.u_id = u_id;
		this.u_nickname = u_nickname;
		this.boardDTO = boardDTO;
	}

	public int getU_member_id() {
		return u_member_id;
	}

	public void setU_member_id(int u_member_id) {
		this.u_member_id = u_member_id;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_nickname() {
		return u_nickname;
	}

	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}

	public List<BoardDTO> getBoardDTO() {
		return boardDTO;
	}

	public void setBoardDTO(List<BoardDTO> boardDTO) {
		this.boardDTO = boardDTO;
	}

	@Override
	public String toString() {
		return "UserDTO [u_member_id=" + u_member_id + ", u_id=" + u_id + ", u_nickname=" + u_nickname + ", boardDTO="
				+ boardDTO + "]";
	}
	
}

//u_member_id   NUMBER  NOT NULL,          -- 회원 고유번호
//u_id          VARCHAR2(20)    NOT NULL UNIQUE,      -- 아이디
//u_password    VARCHAR2(100)   NOT NULL,             -- 비밀번호
//u_name        VARCHAR2(50)    NOT NULL,             -- 이름
//u_address     VARCHAR2(200),                        -- 주소
//u_zip_code    NUMBER,                               -- 우편번호
//u_phone       VARCHAR2(20),                         -- 전화번호
//u_email       VARCHAR2(100)   UNIQUE,               -- 이메일
//u_birthday    DATE,                                 -- 생년월일
//u_regdate     DATE DEFAULT SYSDATE,                 -- 가입일
//u_nickname    VARCHAR2(100)   UNIQUE,               -- 닉네임
//u_show        VARCHAR2(1) DEFAULT 'Y',                  -- 활성화 여부 (Y/N)
//u_role        VARCHAR2(20) DEFAULT 'USER',          -- 권한
//u_image       VARCHAR2(200),                        -- 이미지 URL
//u_piagree     VARCHAR2(1) CHECK (u_piagree IN ('Y','N')),  -- 개인정보 동의
//u_magree