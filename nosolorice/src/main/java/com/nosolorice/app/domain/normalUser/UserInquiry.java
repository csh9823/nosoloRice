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
	public int getUserInquiryNo() {
		return userInquiryNo;
	}
	public void setUserInquiryNo(int userInquiryNo) {
		this.userInquiryNo = userInquiryNo;
	}
	public String getInquiryDivision() {
		return inquiryDivision;
	}
	public void setInquiryDivision(String inquiryDivision) {
		this.inquiryDivision = inquiryDivision;
	}
	public String getInquiryTitle() {
		return inquiryTitle;
	}
	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}
	public String getInquiryPicture() {
		return inquiryPicture;
	}
	public void setInquiryPicture(String inquiryPicture) {
		this.inquiryPicture = inquiryPicture;
	}
	public Timestamp getInquiryRegDate() {
		return inquiryRegDate;
	}
	public void setInquiryRegDate(Timestamp inquiryRegDate) {
		this.inquiryRegDate = inquiryRegDate;
	}
	public String getInquiryContent() {
		return inquiryContent;
	}
	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}
	public String getInquiryComment() {
		return inquiryComment;
	}
	public void setInquiryComment(String inquiryComment) {
		this.inquiryComment = inquiryComment;
	}
	public Timestamp getInquiryCommentRegDate() {
		return inquiryCommentRegDate;
	}
	public void setInquiryCommentRegDate(Timestamp inquiryCommentRegDate) {
		this.inquiryCommentRegDate = inquiryCommentRegDate;
	}
	public String getNormalId() {
		return normalId;
	}
	public void setNormalId(String normalId) {
		this.normalId = normalId;
	}
	
	
}
