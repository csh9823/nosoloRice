package com.nosolorice.app.domain.normalUser;

import java.sql.Timestamp;

public class UserInquiry {
	// 유저문의 게시글
	private int userInquiryNo;					// No
	private String inquiryDivision;				// 문의구분
	private String inquiryTitle;					// 문의제목
	private String inquiryPicture;				// 문의사진파일
	private Timestamp inquiryRegDate;				// 문의날짜
	private String inquiryContent;				// 문의내용
	private String inquiryComment;				// 문의답글
	private Timestamp inquiryCommentRegDate;	// 문의답글날짜
	private String normalId;						// 유저아이디
}
