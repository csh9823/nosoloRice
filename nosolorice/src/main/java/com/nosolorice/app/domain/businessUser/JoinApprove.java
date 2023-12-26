package com.nosolorice.app.domain.businessUser;

import java.sql.Timestamp;

//가입 승인 리스트
public class JoinApprove {
	private int joinApproveNo;	// No
	private String name;	// 사업자 아이디
	private String businessName;
	private String businessPicture;
	private Timestamp regDate;
	private int businessNumber;
	private String address1;
	private String address2;
	private String mobile;
	private String phone;
	private String email;
	
	
	public int getJoinApproveNo() {
		return joinApproveNo;
	}
	public void setJoinApproveNo(int joinApproveNo) {
		this.joinApproveNo = joinApproveNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBusinessName() {
		return businessName;
	}
	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public int getBusinessNumber() {
		return businessNumber;
	}
	public void setBusinessNumber(int businessNumber) {
		this.businessNumber = businessNumber;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBusinessPicture() {
		return businessPicture;
	}
	public void setBusinessPicture(String businessPicture) {
		this.businessPicture = businessPicture;
	}

}
