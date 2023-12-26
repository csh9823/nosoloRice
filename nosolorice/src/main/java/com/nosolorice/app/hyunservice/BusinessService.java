package com.nosolorice.app.hyunservice;

import java.util.Map;

import com.nosolorice.app.domain.businessUser.BusinessInquiry;

public interface BusinessService {
	
	public abstract void writeBusinessInquiry(BusinessInquiry businessInquiry);
	public abstract Map<String, Object> getBusinessInquiryList(int pageNum, String businessId);
	public abstract Map<String, Object> getDailySalesList(int pageNum, String businessId);
	public abstract Map<String, Object> getMonthlySalesList(int pageNum, String businessId);
}
