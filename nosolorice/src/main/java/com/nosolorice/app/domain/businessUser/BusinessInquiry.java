package com.nosolorice.app.domain.businessUser;

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
	public int getBusinessInquiryNo() {
		return businessInquiryNo;
	}
	public void setBusinessInquiryNo(int businessInquiryNo) {
		this.businessInquiryNo = businessInquiryNo;
	}
	public String getBusinessDivision() {
		return businessDivision;
	}
	public void setBusinessDivision(String businessDivision) {
		this.businessDivision = businessDivision;
	}
	public String getBusinessTitle() {
		return businessTitle;
	}
	public void setBusinessTitle(String businessTitle) {
		this.businessTitle = businessTitle;
	}
	public String getBusinessPicture() {
		return businessPicture;
	}
	public void setBusinessPicture(String businessPicture) {
		this.businessPicture = businessPicture;
	}
	public Timestamp getBusinessInquiryRegDate() {
		return businessInquiryRegDate;
	}
	public void setBusinessInquiryRegDate(Timestamp businessInquiryRegDate) {
		this.businessInquiryRegDate = businessInquiryRegDate;
	}
	public String getBusinessContent() {
		return businessContent;
	}
	public void setBusinessContent(String businessContent) {
		this.businessContent = businessContent;
	}
	public Timestamp getBusinessCommentRegDate() {
		return businessCommentRegDate;
	}
	public void setBusinessCommentRegDate(Timestamp businessCommentRegDate) {
		this.businessCommentRegDate = businessCommentRegDate;
	}
	public String getBusinessComment() {
		return businessComment;
	}
	public void setBusinessComment(String businessComment) {
		this.businessComment = businessComment;
	}
	public String getBusinessId() {
		return businessId;
	}
	public void setBusinessId(String businessId) {
		this.businessId = businessId;
	}
	
	
}
