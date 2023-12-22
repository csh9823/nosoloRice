package com.nosolorice.app.controller.sehwa;

import java.sql.Timestamp;
import java.util.List;

import com.nosolorice.app.domain.Review.Review;
import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.normalUser.NormalUser;

public class BookingMember {
	
	private int no;									// 방문관리번호
	private List<String> members;				// 같이 방문한 사람 아이디
	private List<NormalUser> normalUser;	// 같이 방문한 사람 정보
	private BusinessUser businessUser;		// 사업장정보
	private Timestamp bookingTime;			// 방문시간
	private Boolean reviewStatus;				// 리뷰등록여부
	private Review review;
	
	
	public BookingMember() {};
	public BookingMember(int no, List<String> members, List<NormalUser> normalUser, BusinessUser businessUser,
			Timestamp bookingTime, Boolean reviewStatus, Review review) {
		this.no = no;
		this.members = members;
		this.normalUser = normalUser;
		this.businessUser = businessUser;
		this.bookingTime = bookingTime;
		this.reviewStatus = reviewStatus;
		this.review = review;
	}




	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public BusinessUser getBusinessUser() {
		return businessUser;
	}
	public void setBusinessUser(BusinessUser businessUser) {
		this.businessUser = businessUser;
	}
	public List<String> getMembers() {
		return members;
	}
	public void setMembers(List<String> members) {
		this.members = members;
	}
	public List<NormalUser> getNormalUser() {
		return normalUser;
	}
	public void setNormalUser(List<NormalUser> normalUser) {
		this.normalUser = normalUser;
	}
	public Timestamp getBookingTime() {
		return bookingTime;
	}
	public void setBookingTime(Timestamp bookingTime) {
		this.bookingTime = bookingTime;
	}
	public Boolean getReviewStatus() {
		return reviewStatus;
	}
	public void setReviewStatus(Boolean reviewStatus) {
		this.reviewStatus = reviewStatus;
	}
	public Review getReview() {
		return review;
	}
	public void setReview(Review review) {
		this.review = review;
	}





	

	
	

	
	
	
	
	
}
