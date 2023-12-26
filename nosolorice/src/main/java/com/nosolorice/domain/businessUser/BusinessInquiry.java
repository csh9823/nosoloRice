package com.nosolorice.domain.businessUser;

import java.sql.Timestamp;

public class BusinessInquiry {
	// 사장님 문의
	
	private int businessInquiryNo;							// No
	private String businessDivision;						// 문의구분
	private String businessTitle;								// 문의제목
	private String businessPicture;							// 문의사진파일
	private Timestamp businessInquiryRegDate;		// 문의날짜
	private String businessContent;						// 문의내용
	private Timestamp businessCommentRegDate;	// 문의답글날짜
	private String businessComment;						// 문의답글
	private String businessId;								// 사업자아이디
	
}
