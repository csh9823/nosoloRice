package com.nosolorice.app.domain.businessUser;

import java.sql.Timestamp;

//사업자 회원
public class BusinessUser {
	
	private String businessId;			// 사업자 아이디
	private String pass;						// 비밀번호
	private String name;					// 사장님 이름
	private String phone;					// 사업장 가게번호
	private int businessNumber;			// 사업자등록번호
	private String businessName;		// 상호명
	private String businessPicture;		// 사업자등록증 사본파일
	private String email;					// 이메일
	private String mobile;					// 핸드폰번호
	private int postNum;					// 가게 우편번호
	private String address1;				// 가게주소 01
	private String address2;				// 가게주소 02
	private String xpoint;					// 위도
	private String ypoint;					// 경도
	private String businessProfile;		// 프로필사진파일
	private String bankName;				// 계좌은행
	private int bankNumber;				// 계좌번호
	private int deposit;					// 가게 예약금
	private String openTime;				// 오픈시간
	private String closeTime;				// 마감시간
	private String breakTime;				// 브레이크타임
	private String dayOff;					// 휴무일
	private String introduction;			// 가게소개
	private Timestamp regDate;			// 가입일
	private String storeOnoff;			// 영업시작/종료 상태
	private String okNoOk;				// 가입승인여부
	
	public BusinessUser() {}
	public BusinessUser(String businessId, String pass, String name, String phone, int businessNumber,
			String businessName, String businessPicture, String email, String mobile, int postNum, String address1,
			String address2, String xpoint, String ypoint, String businessProfile, String bankName, int bankNumber,
			int deposit, String openTime, String closeTime, String breakTime, String dayOff, String introduction,
			Timestamp regDate, String storeOnoff, String okNoOk) {
		this.businessId = businessId;
		this.pass = pass;
		this.name = name;
		this.phone = phone;
		this.businessNumber = businessNumber;
		this.businessName = businessName;
		this.businessPicture = businessPicture;
		this.email = email;
		this.mobile = mobile;
		this.postNum = postNum;
		this.address1 = address1;
		this.address2 = address2;
		this.xpoint = xpoint;
		this.ypoint = ypoint;
		this.businessProfile = businessProfile;
		this.bankName = bankName;
		this.bankNumber = bankNumber;
		this.deposit = deposit;
		this.openTime = openTime;
		this.closeTime = closeTime;
		this.breakTime = breakTime;
		this.dayOff = dayOff;
		this.introduction = introduction;
		this.regDate = regDate;
		this.storeOnoff = storeOnoff;
		this.okNoOk = okNoOk;
	}
	
	public String getBusinessId() {
		return businessId;
	}
	public void setBusinessId(String businessId) {
		this.businessId = businessId;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getBusinessNumber() {
		return businessNumber;
	}
	public void setBusinessNumber(int businessNumber) {
		this.businessNumber = businessNumber;
	}
	public String getBusinessName() {
		return businessName;
	}
	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}
	public String getBusinessPicture() {
		return businessPicture;
	}
	public void setBusinessPicture(String businessPicture) {
		this.businessPicture = businessPicture;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
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
	public String getBusinessProfile() {
		return businessProfile;
	}
	public void setBusinessProfile(String businessProfile) {
		this.businessProfile = businessProfile;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public int getBankNumber() {
		return bankNumber;
	}
	public void setBankNumber(int bankNumber) {
		this.bankNumber = bankNumber;
	}
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	public String getOpenTime() {
		return openTime;
	}
	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}
	public String getCloseTime() {
		return closeTime;
	}
	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
	}
	public String getBreakTime() {
		return breakTime;
	}
	public void setBreakTime(String breakTime) {
		this.breakTime = breakTime;
	}
	public String getDayOff() {
		return dayOff;
	}
	public void setDayOff(String dayOff) {
		this.dayOff = dayOff;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getStoreOnoff() {
		return storeOnoff;
	}
	public void setStoreOnoff(String storeOnoff) {
		this.storeOnoff = storeOnoff;
	}
	public String getOkNoOk() {
		return okNoOk;
	}
	public void setOkNoOk(String okNoOk) {
		this.okNoOk = okNoOk;
	}

	
	
	
	
}
