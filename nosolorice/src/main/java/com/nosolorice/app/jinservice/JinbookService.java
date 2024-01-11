package com.nosolorice.app.jinservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nosolorice.app.domain.booking.Booking;
import com.nosolorice.app.domain.booking.BookingOk;
import com.nosolorice.app.domain.booking.BookingUserList;
import com.nosolorice.app.jindao.JinBookingDaoImpl;

@Service
public class JinbookService implements JinBookInterface {
	
	@Autowired
	JinBookingDaoImpl jinBookingDaoImpl;
	@Override
	public List<Booking> BookingList(String businessId) {
		
		return jinBookingDaoImpl.BookingList(businessId);
	}
	
	public void bookingState(String businessId,int bookingNo ,String bookingState) {
		jinBookingDaoImpl.bookingState(businessId, bookingNo, bookingState);
	}
	
	public void bookingStateDelete(String businessId,int bookingNo) {
		jinBookingDaoImpl.bookingStateDelete(businessId, bookingNo);
	}
	
	public void bookingOkinsert(BookingOk bookingOk) {
		jinBookingDaoImpl.bookingOkinsert(bookingOk);
	}
	
	public void bookinguserdelete(String businessId,int bookingNo) {
		jinBookingDaoImpl.bookinguserdelete(businessId, bookingNo);
	}
	
	// 부킹 유저 리스트
	public List<BookingUserList> bookingUserList(String businessId,int bookingNo){
		return jinBookingDaoImpl.bookingUserList(businessId, bookingNo);
	}
	// 방문완료 생성
	public void visitantuseradd(String normalId, String businessId,int bookingokNo) {
		jinBookingDaoImpl.visitantuseradd(normalId, businessId, bookingokNo);
	}
	//부킹ok 번호 가져오기
	public int getbookingOknumber(int bookingNo) {
		return jinBookingDaoImpl.getbookingOknumber(bookingNo);
	}
}
