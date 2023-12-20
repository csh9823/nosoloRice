package com.nosolorice.app.domain.normalUser;

import java.sql.Timestamp;

//일반 회원
public class NormalUser {
	
	private String normalId;				// 유저아이디
	private String pass;						// 비밀번호
	private String name;					// 이름
	private String birth;						// 생년월일
	private String nickName;				// 닉네임
	private String mobile;					// 휴대폰번호
	private String profile;					// 프로필사진파일
	private int postNum;					// 우편번호
	private String address1;				// 주소1
	private String address2;				// 상세주소
	private String xpoint;					// 위도
	private String ypoint;					// 경도
	private String gender;						// 성별
	private String email;					// 이메일
	private Timestamp regDate;			// 가입일
	private int myPoint;				// 내 포인트 잔여액
	
	public NormalUser() {};
	public NormalUser(String normalId, String pass, String name, String birth, String nickName, String mobile,
			String profile, int postNum, String address1, String address2, String xpoint, String ypoint, String gender,
			String email, Timestamp regDate, int myPoint) {
		super();
		this.normalId = normalId;
		this.pass = pass;
		this.name = name;
		this.birth = birth;
		this.nickName = nickName;
		this.mobile = mobile;
		this.profile = profile;
		this.postNum = postNum;
		this.address1 = address1;
		this.address2 = address2;
		this.xpoint = xpoint;
		this.ypoint = ypoint;
		this.gender = gender;
		this.email = email;
		this.regDate = regDate;
		this.myPoint = myPoint;
	}
	
	
	
	public String getNormalId() {
		return normalId;
	}
	public void setNormalId(String normalId) {
		this.normalId = normalId;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
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
	public String getXpoint() {
		return xpoint;
	}
	public void setXpoint(String xpoint) {
		this.xpoint = xpoint;
	}
	public String getYpoint() {
		return ypoint;
	}
	public void setYpoint(String ypoint) {
		this.ypoint = ypoint;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public int getMyPoint() {
		return myPoint;
	}
	public void setMyPoint(int myPoint) {
		this.myPoint = myPoint;
	};
	
	

	
	
	
}
