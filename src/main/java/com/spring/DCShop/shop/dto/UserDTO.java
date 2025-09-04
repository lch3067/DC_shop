package com.spring.DCShop.shop.dto;

import java.sql.Date;

public class UserDTO {

	private int uMemberId;
	private String uId;
	private String uPassword;
	private String uName;
	private String uAddress;
	private int uZipCode;
	private String uPhone;
	private String uEmail;
	private Date uBirthday;
	private Date uRegdate;
	private String uNickname;
	private String uShow;
	private String uRole;
	private String uImage;
	private String uPiagree;
	private String uMagree;
	
	public UserDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public UserDTO(int uMemberId, String uId, String uPassword, String uName, String uAddress, int uZipCode,
			String uPhone, String uEmail, Date uBirthday, Date uRegdate, String uNickname, String uShow, String uRole,
			String uImage, String uPiagree, String uMagree) {
		super();
		this.uMemberId = uMemberId;
		this.uId = uId;
		this.uPassword = uPassword;
		this.uName = uName;
		this.uAddress = uAddress;
		this.uZipCode = uZipCode;
		this.uPhone = uPhone;
		this.uEmail = uEmail;
		this.uBirthday = uBirthday;
		this.uRegdate = uRegdate;
		this.uNickname = uNickname;
		this.uShow = uShow;
		this.uRole = uRole;
		this.uImage = uImage;
		this.uPiagree = uPiagree;
		this.uMagree = uMagree;
	}

	public int getuMemberId() {
		return uMemberId;
	}

	public void setuMemberId(int uMemberId) {
		this.uMemberId = uMemberId;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getuPassword() {
		return uPassword;
	}

	public void setuPassword(String uPassword) {
		this.uPassword = uPassword;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuAddress() {
		return uAddress;
	}

	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}

	public int getuZipCode() {
		return uZipCode;
	}

	public void setuZipCode(int uZipCode) {
		this.uZipCode = uZipCode;
	}

	public String getuPhone() {
		return uPhone;
	}

	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}

	public Date getuBirthday() {
		return uBirthday;
	}

	public void setuBirthday(Date uBirthday) {
		this.uBirthday = uBirthday;
	}

	public Date getuRegdate() {
		return uRegdate;
	}

	public void setuRegdate(Date uRegdate) {
		this.uRegdate = uRegdate;
	}

	public String getuNickname() {
		return uNickname;
	}

	public void setuNickname(String uNickname) {
		this.uNickname = uNickname;
	}

	public String getuShow() {
		return uShow;
	}

	public void setuShow(String uShow) {
		this.uShow = uShow;
	}

	public String getuRole() {
		return uRole;
	}

	public void setuRole(String uRole) {
		this.uRole = uRole;
	}

	public String getuImage() {
		return uImage;
	}

	public void setuImage(String uImage) {
		this.uImage = uImage;
	}

	public String getuPiagree() {
		return uPiagree;
	}

	public void setuPiagree(String uPiagree) {
		this.uPiagree = uPiagree;
	}

	public String getuMagree() {
		return uMagree;
	}

	public void setuMagree(String uMagree) {
		this.uMagree = uMagree;
	}

	@Override
	public String toString() {
		return "UserDTO [uMemberId=" + uMemberId + ", uId=" + uId + ", uPassword=" + uPassword + ", uName=" + uName
				+ ", uAddress=" + uAddress + ", uZipCode=" + uZipCode + ", uPhone=" + uPhone + ", uEmail=" + uEmail
				+ ", uBirthday=" + uBirthday + ", uRegdate=" + uRegdate + ", uNickname=" + uNickname + ", uShow="
				+ uShow + ", uRole=" + uRole + ", uImage=" + uImage + ", uPiagree=" + uPiagree + ", uMagree=" + uMagree + "]";
	}
	
}
