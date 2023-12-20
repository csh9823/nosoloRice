package com.nosolorice.app.controller.sehwa;

import java.util.List;
import java.util.Map;

import com.nosolorice.app.domain.Review.Review;
import com.nosolorice.app.domain.booking.Booking;
import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.normalUser.ReportDetails;

public interface SehwaService {

	public BusinessUser getBusinessUserInfo(String id);
	
	public void businessUserInfoUpdate(BusinessUser user);
	
	public void storeDepositUpdate(String id, int deposit);
	
	public void storeTimeUpdate(String id, String openTime, String closeTime, String dayOff, String breakTime);
	
	public void storeIntroductionUpdate(String id, String introduction);
	
	public Map<String, Object> getCurrentBooking(String id);
	
	public Map<String, Object> getPastBooking(String id);
	
	public void insertReview(Review review);
	
	public void insertReport(ReportDetails report);
	
	public void insertBlock(String blocker, String attacker);
	
}
