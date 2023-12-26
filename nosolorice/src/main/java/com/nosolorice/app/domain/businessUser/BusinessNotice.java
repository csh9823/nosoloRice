package com.nosolorice.app.domain.businessUser;

import java.sql.Timestamp;


public class BusinessNotice {
	//사장님 공지사항
	
	private int businessNoticeNo;						// No
	private String businessNoticeTitle;				// 공지사항 제목
	private String businessNoticeContent;			// 공지사항 내용
	private Timestamp businessNoticeRegDate;	// 공지사항 등록일
	public int getBusinessNoticeNo() {
		return businessNoticeNo;
	}
	public void setBusinessNoticeNo(int businessNoticeNo) {
		this.businessNoticeNo = businessNoticeNo;
	}
	public String getBusinessNoticeTitle() {
		return businessNoticeTitle;
	}
	public void setBusinessNoticeTitle(String businessNoticeTitle) {
		this.businessNoticeTitle = businessNoticeTitle;
	}
	public String getBusinessNoticeContent() {
		return businessNoticeContent;
	}
	public void setBusinessNoticeContent(String businessNoticeContent) {
		this.businessNoticeContent = businessNoticeContent;
	}
	public Timestamp getBusinessNoticeRegDate() {
		return businessNoticeRegDate;
	}
	public void setBusinessNoticeRegDate(Timestamp businessNoticeRegDate) {
		this.businessNoticeRegDate = businessNoticeRegDate;
	}
	
	

}
