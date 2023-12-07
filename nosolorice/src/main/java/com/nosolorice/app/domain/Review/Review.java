package com.nosolorice.app.domain.Review;


import java.sql.Timestamp;

public class Review {
	private int reviewNo;					// No
	private String reviewContent;		// 리뷰내용
	private String reviewPicture;			// 리뷰사진파일
	private int reviewScore;				// 별점
	private String reviewId;				// 작성자 아이디
	private Timestamp regDate;					// 리뷰 등록일
	private String reviewBlind;			// 리뷰 블라인드 상태
	private String reviewDelete;			// 리뷰 삭제요청 상태
	private String normalId;				// 유저아이디 ==> 작성자 아이디 있는데???
	private String businessId;				// 사업자아이디
}
