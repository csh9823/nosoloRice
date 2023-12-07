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

}
