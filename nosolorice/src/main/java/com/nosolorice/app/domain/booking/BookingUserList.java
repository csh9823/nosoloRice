package com.nosolorice.app.domain.booking;

public class BookingUserList {
	// 용도 설명 필요
	
	private String normalId;		// 유저 아이디
	private String businessId;	// 사업자 아이디
	private int bookingNo;			// No
	
	public BookingUserList() {
		
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

	public int getBookingNo() {
		return bookingNo;
	}

	public void setBookingNo(int bookingNo) {
		this.bookingNo = bookingNo;
	}

	@Override
	public String toString() {
		return "BookingUserList [normalId=" + normalId + ", businessId=" + businessId + ", bookingNo=" + bookingNo
				+ "]";
	}
	
	
	
}
