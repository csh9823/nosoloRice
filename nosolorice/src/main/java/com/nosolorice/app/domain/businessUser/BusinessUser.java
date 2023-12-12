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

}
