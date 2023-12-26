package com.nosolorice.app.domain.normalUser;

import java.sql.Timestamp;

//일반유저 공지사항
public class Notice {
	
	private int noticeNo;						// No
	private String noticeTitle;					// 공지사항 제목
	private String noticeContent;			// 공지사항 내용
	private Timestamp noticeRegDate;	// 공지사항 등록일
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public Timestamp getNoticeRegDate() {
		return noticeRegDate;
	}
	public void setNoticeRegDate(Timestamp noticeRegDate) {
		this.noticeRegDate = noticeRegDate;
	}
	
	

}
