package com.nosolorice.app.jinservice;

import java.util.List;

import com.nosolorice.app.domain.booking.Booking;

public interface JinBookInterface {
	abstract public List<Booking> BookingList(String businessId);
	abstract public void BookingOkNumberupdate(String businessId, int bookingno);
}
