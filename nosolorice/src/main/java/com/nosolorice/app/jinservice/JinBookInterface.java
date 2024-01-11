package com.nosolorice.app.jinservice;

import java.util.List;

import com.nosolorice.app.domain.booking.Booking;
import com.nosolorice.app.domain.booking.BookingOk;
import com.nosolorice.app.domain.booking.BookingUserList;

public interface JinBookInterface {
	abstract public List<Booking> BookingList(String businessId);
	abstract public void bookingState(String businessId,int bookingNo ,String bookingState);
	abstract public void bookingStateDelete(String businessId,int bookingNo);
	abstract public void bookingOkinsert(BookingOk bookingOk);
	
	// 부킹 유저 리스트 삭제
	abstract public void bookinguserdelete(String businessId,int bookingNo);
	// 부킹 유저 리스트
	abstract public List<BookingUserList> bookingUserList(String businessId,int bookingNo);
	// 방문완료 생성
	abstract public void visitantuseradd(String normalId, String businessId,int bookingokNo);
	//부킹ok 번호 가져오기
	abstract public int getbookingOknumber(int bookingNo);
}
