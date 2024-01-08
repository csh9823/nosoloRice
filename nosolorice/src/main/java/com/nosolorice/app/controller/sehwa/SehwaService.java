package com.nosolorice.app.controller.sehwa;

import java.util.List;
import java.util.Map;

import com.nosolorice.app.domain.Review.Review;
import com.nosolorice.app.domain.booking.Booking;
import com.nosolorice.app.domain.businessUser.BusinessSectors;
import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.domain.normalUser.PointHistory;
import com.nosolorice.app.domain.normalUser.PointRecharge;
import com.nosolorice.app.domain.normalUser.ReportDetails;

public interface SehwaService {
	
	public BusinessUser getBusinessUserInfo(String id);
	
	public NormalUser getNormalUserInfo(String id);
	
	public List<BusinessSectors> getBusinessSectors(String id);
	
	public void businessUserInfoUpdate(BusinessUser user);
	
	public void normalUserInfoUpdate(NormalUser user);
	
	public void changeDefaultImg(String id, String type);
	
	public void storeDepositUpdate(String id, int deposit);
	
	public void storeSectorUpdate(String id, int count, int[] sector);
	
	public void storeTimeUpdate(String id, String openTime, String closeTime, String dayOff, String breakTime);
	
	public void storeIntroductionUpdate(String id, String introduction);
	
	public Map<String, Object> getCurrentBooking(String id);
	
	public Map<String, Object> getPastBooking(String id, int pageNum);
	
	public void insertReview(Review review);
	
	public void insertReport(ReportDetails report);
	
	public void insertBlock(String blocker, String attacker);
	
	public void visitantBlind(String id, int no);
	
	public void deleteReview(int no);
	
	public void rechargePoint(String id, String payment, int amount, int point);
	
	public Map<String, Object> chargePointList(String id,int chargePageNum);
	
	public Map<String, Object> usePointList(String id, int usePageNum);
	
	public boolean checkNormalNickName(String nickName);
	
	
	
	
	
}
