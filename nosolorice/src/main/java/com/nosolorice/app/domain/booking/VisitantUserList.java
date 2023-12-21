package com.nosolorice.app.domain.booking;

public class VisitantUserList {
	// 사장님이 방문버튼 누르면 insert
	private String normalId;		// 유저아이디
	private String businessId;	// 사장님 아이디
	private int bookingOkNo;		// 예약방문완료번호
	private int BisitantBlind; //블라인드
	
	public VisitantUserList() {
		
	}
	
	
	public int getBisitantBlind() {
		return BisitantBlind;
	}


	public void setBisitantBlind(int bisitantBlind) {
		BisitantBlind = bisitantBlind;
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

	public int getBookingOkNo() {
		return bookingOkNo;
	}

	public void setBookingOkNo(int bookingOkNo) {
		this.bookingOkNo = bookingOkNo;
	}


	@Override
	public String toString() {
		return "VisitantUserList [normalId=" + normalId + ", businessId=" + businessId + ", bookingOkNo=" + bookingOkNo
				+ ", BisitantBlind=" + BisitantBlind + "]";
	}


	
	
	
}
