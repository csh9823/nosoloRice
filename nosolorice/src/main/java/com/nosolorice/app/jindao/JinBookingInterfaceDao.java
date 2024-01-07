package com.nosolorice.app.jindao;

import java.util.List;

import com.nosolorice.app.domain.booking.Booking;

public interface JinBookingInterfaceDao {
	abstract public List<Booking> BookingList(String businessId);
}
