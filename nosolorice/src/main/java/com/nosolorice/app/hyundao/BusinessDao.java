package com.nosolorice.app.hyundao;

import java.util.List;

import com.nosolorice.app.domain.booking.BookingOk;
import com.nosolorice.app.domain.booking.BookingOkMonth;
import com.nosolorice.app.domain.businessUser.BusinessInquiry;

public interface BusinessDao {
	public abstract void writeBusinessInquiry(BusinessInquiry businessInquiry);
	public abstract List<BusinessInquiry> getBusinessInquiryList(int start, int pageSize, String businessId);
	public abstract int getBusinessInquiryListCount(String businessId);
	public abstract List<BookingOk> getDailySalesList(int start, int pageSize, String businessId);
	public abstract List<BookingOkMonth> getMonthlySalesList(int start, int pageSize, String businessId);
	public abstract int getDailySalesListCount(String businessId);
	public abstract int getMonthlySalesListCount(String businessId);
	
}
