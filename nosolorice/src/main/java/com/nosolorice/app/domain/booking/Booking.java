package com.nosolorice.app.domain.booking;

import java.sql.Timestamp;

public class Booking {
	// 채팅방에서 예약요청 보냈을 때 insert
	// 사장님이 승인/거절 누르면 update
	private int bookingNo;					// No
	private int bookingCount;				// 예약인원
	private String bookingRequest;		// 요청사항
	private Timestamp bookingTime;			// 예약시간
	private String bookingState;			// 예약상태 (승인/거절)
	private int bookingBookNo;				// 가게별 예약번호 ==> 변수명 동일
	private String businessId;			// 사장님 아이디
	private String bookingChatName;	// 채팅방 이름
	
	public Booking() {
		
	}

	public int getBookingNo() {
		return bookingNo;
	}

	public void setBookingNo(int bookingNo) {
		this.bookingNo = bookingNo;
	}

	public int getBookingCount() {
		return bookingCount;
	}

	public void setBookingCount(int bookingCount) {
		this.bookingCount = bookingCount;
	}

	public String getBookingRequest() {
		return bookingRequest;
	}

	public void setBookingRequest(String bookingRequest) {
		this.bookingRequest = bookingRequest;
	}

	public Timestamp getBookingTime() {
		return bookingTime;
	}

	public void setBookingTime(Timestamp bookingTime) {
		this.bookingTime = bookingTime;
	}

	public String getBookingState() {
		return bookingState;
	}

	public void setBookingState(String bookingState) {
		this.bookingState = bookingState;
	}

	public int getBookingBookNo() {
		return bookingBookNo;
	}

	public void setBookingBookNo(int bookingBookNo) {
		this.bookingBookNo = bookingBookNo;
	}

	public String getBusinessId() {
		return businessId;
	}

	public void setBusinessId(String businessId) {
		this.businessId = businessId;
	}

	public String getBookingChatName() {
		return bookingChatName;
	}

	public void setBookingChatName(String bookingChatName) {
		this.bookingChatName = bookingChatName;
	}

	@Override
	public String toString() {
		return "Booking [bookingNo=" + bookingNo + ", bookingCount=" + bookingCount + ", bookingRequest="
				+ bookingRequest + ", bookingTime=" + bookingTime + ", bookingState=" + bookingState
				+ ", bookingBookNo=" + bookingBookNo + ", businessId=" + businessId + ", bookingChatName="
				+ bookingChatName + "]";
	}
	
	
	
}
