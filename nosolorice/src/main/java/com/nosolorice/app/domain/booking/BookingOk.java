package com.nosolorice.app.domain.booking;

import java.sql.Timestamp;

public class BookingOk {
	// 방문/미방문 눌렀을때 insert
	
	private int bookingOkNo;					// No
	private int bookingOkCount;				// 예약인원
	private String bookingOkRequest;		// 요청사항
	private Timestamp bookingOkTime;	// 예약시간
	private String bookingOkState;			// 방문여부
	private int bookingNo;						// 관리번호 ==> NO랑 나눠놓은 이유 설명필요
	private String businessId;				// 사업자 아이디
	
	
	public BookingOk() {};
	public BookingOk(int bookingOkNo, int bookingOkCount, String bookingOkRequest, Timestamp bookingOkTime,
			String bookingOkState, int bookingNo, String businessId) {
		this.bookingOkNo = bookingOkNo;
		this.bookingOkCount = bookingOkCount;
		this.bookingOkRequest = bookingOkRequest;
		this.bookingOkTime = bookingOkTime;
		this.bookingOkState = bookingOkState;
		this.bookingNo = bookingNo;
		this.businessId = businessId;
	}
	
	
	public int getBookingOkNo() {
		return bookingOkNo;
	}
	public void setBookingOkNo(int bookingOkNo) {
		this.bookingOkNo = bookingOkNo;
	}
	public int getBookingOkCount() {
		return bookingOkCount;
	}
	public void setBookingOkCount(int bookingOkCount) {
		this.bookingOkCount = bookingOkCount;
	}
	public String getBookingOkRequest() {
		return bookingOkRequest;
	}
	public void setBookingOkRequest(String bookingOkRequest) {
		this.bookingOkRequest = bookingOkRequest;
	}
	public Timestamp getBookingOkTime() {
		return bookingOkTime;
	}
	public void setBookingOkTime(Timestamp bookingOkTime) {
		this.bookingOkTime = bookingOkTime;
	}
	public String getBookingOkState() {
		return bookingOkState;
	}
	public void setBookingOkState(String bookingOkState) {
		this.bookingOkState = bookingOkState;
	}
	public int getBookingNo() {
		return bookingNo;
	}
	public void setBookingNo(int bookingNo) {
		this.bookingNo = bookingNo;
	}
	public String getBusinessId() {
		return businessId;
	}
	public void setBusinessId(String businessId) {
		this.businessId = businessId;
	};
	
	
	
	
	
	
	
	
	
	
}
