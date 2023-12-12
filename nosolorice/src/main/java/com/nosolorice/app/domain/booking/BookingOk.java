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
	
}
