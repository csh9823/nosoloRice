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
	private int BookingokNo; //
	private Timestamp ReviewRequestRegdate;
	public Review() {
	
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

	public int getBookingokNo() {
		return BookingokNo;
	}

	public void setBookingokNo(int bookingokNo) {
		BookingokNo = bookingokNo;
	}

		
	public Timestamp getReviewRequestRegdate() {
		return ReviewRequestRegdate;
	}

	public void setReviewRequestRegdate(Timestamp reviewRequestRegdate) {
		ReviewRequestRegdate = reviewRequestRegdate;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewContent=" + reviewContent + ", reviewPicture=" + reviewPicture
				+ ", reviewScore=" + reviewScore + ", reviewId=" + reviewId + ", regDate=" + regDate + ", reviewBlind="
				+ reviewBlind + ", reviewDelete=" + reviewDelete + ", normalId=" + normalId + ", businessId="
				+ businessId + ", BookingokNo=" + BookingokNo + ", ReviewRequestRegdate=" + ReviewRequestRegdate + "]";
	}
	
}
