package com.nosolorice.app.jinservice;

import java.util.List;

import com.nosolorice.app.domain.booking.Booking;
import com.nosolorice.app.domain.booking.BookingOk;

public interface JinBookInterface {
	abstract public List<Booking> BookingList(String businessId);
	abstract public void bookingState(String businessId,int bookingNo ,String bookingState);
	abstract public void bookingStateDelete(String businessId,int bookingNo);
	abstract public void bookingOkinsert(BookingOk bookingOk);
}
