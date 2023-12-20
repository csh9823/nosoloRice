package com.nosolorice.app.domain.Review;


import java.sql.Timestamp;

public class Review {
	private int reviewNo;					// No
	private String reviewContent;		// 리뷰내용
	private String reviewPicture;			// 리뷰사진파일
	private int reviewScore;				// 별점
	private String reviewId;				// 작성자 아이디 (사용x)
	private Timestamp regDate;					// 리뷰 등록일
	private String reviewBlind;			// 리뷰 블라인드 상태
	private String reviewDelete;			// 리뷰 삭제요청 상태
	private String normalId;				// 유저아이디 ==> 작성자 아이디 있는데???
	private String businessId;				// 사업자아이디
	private int bookingOkNo;
	
	public Review() {};
	public Review(int reviewNo, String reviewContent, String reviewPicture, int reviewScore, String reviewId,
			Timestamp regDate, String reviewBlind, String reviewDelete, String normalId, String businessId,
			int bookingOkNo) {
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.reviewPicture = reviewPicture;
		this.reviewScore = reviewScore;
		this.reviewId = reviewId;
		this.regDate = regDate;
		this.reviewBlind = reviewBlind;
		this.reviewDelete = reviewDelete;
		this.normalId = normalId;
		this.businessId = businessId;
		this.bookingOkNo = bookingOkNo;
	}



	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewPicture() {
		return reviewPicture;
	}
	public void setReviewPicture(String reviewPicture) {
		this.reviewPicture = reviewPicture;
	}
	public int getReviewScore() {
		return reviewScore;
	}
	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}
	public String getReviewId() {
		return reviewId;
	}
	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getReviewBlind() {
		return reviewBlind;
	}
	public void setReviewBlind(String reviewBlind) {
		this.reviewBlind = reviewBlind;
	}
	public String getReviewDelete() {
		return reviewDelete;
	}
	public void setReviewDelete(String reviewDelete) {
		this.reviewDelete = reviewDelete;
	}
	public String getNormalId() {
		return normalId;
	}
	public void setNormalId(String normalId) {
		this.normalId = normalId;
	}
	public String getBusinessId() {
		return businessId;
	}
	public void setBusinessId(String businessId) {
		this.businessId = businessId;
	}
	public int getBookingOkNo() {
		return bookingOkNo;
	}
	public void setBookingOkNo(int bookingOkNo) {
		this.bookingOkNo = bookingOkNo;
	};
	
	
	
	
	
	
}
