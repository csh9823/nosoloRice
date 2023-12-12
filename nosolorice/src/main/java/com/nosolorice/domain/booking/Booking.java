package com.nosolorice.domain.booking;

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

}
