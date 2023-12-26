package com.nosolorice.app.domain.Review;

import java.sql.Timestamp;

public class OwnerComment {
	private int ownerNo;						// No
	private String businessComment;		// 사장님 댓글
	private Timestamp regDate;						// 사장님 댓글 등록일
	private int reviewNo;						// 리뷰 번호
	private String normalId;					// 유저 아이디 ==> 리뷰번호가 있는데 사용이유??
	private String businessId;				// 사업자 아이디
	public OwnerComment() {
	
	}

	public int getOwnerNo() {
		return ownerNo;
	}

	public void setOwnerNo(int ownerNo) {
		this.ownerNo = ownerNo;
	}

	public String getBusinessComment() {
		return businessComment;
	}

	public void setBusinessComment(String businessComment) {
		this.businessComment = businessComment;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
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

	@Override
	public String toString() {
		return "OwnerComment [ownerNo=" + ownerNo + ", businessComment=" + businessComment + ", regDate=" + regDate
				+ ", reviewNo=" + reviewNo + ", normalId=" + normalId + ", businessId=" + businessId + "]";
	}
	
	
	
}
