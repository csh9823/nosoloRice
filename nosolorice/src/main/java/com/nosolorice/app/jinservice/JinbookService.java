package com.nosolorice.app.jinservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nosolorice.app.domain.booking.Booking;
import com.nosolorice.app.domain.booking.BookingOk;
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
}
