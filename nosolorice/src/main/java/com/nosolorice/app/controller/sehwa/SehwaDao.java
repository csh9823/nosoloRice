package com.nosolorice.app.controller.sehwa;

import java.sql.Timestamp;
import java.util.List;

import com.nosolorice.app.domain.Review.OwnerComment;
import com.nosolorice.app.domain.Review.Review;
import com.nosolorice.app.domain.booking.Booking;
import com.nosolorice.app.domain.booking.BookingOk;
import com.nosolorice.app.domain.businessUser.BusinessSectors;
import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.domain.normalUser.PointHistory;
import com.nosolorice.app.domain.normalUser.PointRecharge;
import com.nosolorice.app.domain.normalUser.ReportDetails;

public interface SehwaDao {

	public BusinessUser getBusinessUserInfo(String id);

	public void businessUserInfoUpdate(String id, BusinessUser user);
	
	public void normalUserInfoUpdate(NormalUser user);
	
	public void changeDefaultImg(String id, String type);
	
	public void storeDepositUpdate(String id, int deposit);
	
	public void storeTimeUpdate(String id, String openTime, String closeTime, String dayOff, String breakTime);
	
	public void storeIntroductionUpdate(String id, String introduction);
	
	public List<BusinessSectors> getBusinessSectors(String id);
	
	public void insertBusinessSectors(String id, int sectorsNo);
	
	public void deleteBusinessSectors(String id);
	
	public int getCurrentBooking(String id);
	
	public List<String> getCurrentBookingMember(int no, String id);
	
	public Booking getBookingDetail(int no);
	
	public NormalUser getNormalUserInfo(String id);
	
	public List<Integer> getVisitantUserListNo(String id);

	public List<Integer> getVisitantUserListNo(String id, int start, int PAGE_SIZE);
	
	public List<String> getVisitantUserListMember(int no, String id);
	
	public BookingOk getVisitantBookingDetail(int no);
	
	public Review getReview(String normalId, int bookingOkNo);
	
	public void insertReview(Review review);
	
	public void insertReport(ReportDetails report);
	
	public void insertBlock(String blocker, String attacker);
	
	public void visitantBlind(String id, int no);
	
	public void deleteReview(int no);
	
	public void rechargePoint(String id, String payment, int amount, int point);
	
	public void updateMyPoint(String id, int point);
	
	public List<PointRecharge> chargePointList(String id);

	public List<PointRecharge> chargePointList(String id, int start, int PAGE_SIZE);
	
	public List<PointHistory> usePointList(String id);
	
	public List<PointHistory> usePointList(String id, int start, int PAGE_SIZE);
	
	public NormalUser checkNormalNickName(String nickName);
	
	public void deleteBusinessUser(String id);
	
	public void deleteNormalUser(String id);
	
	public void storeClose(String id);
	
	public void storeOpen(String id);
	
	public OwnerComment getOwnerCommnet(int reviewNo);
	
	public void deleteOwnerComment(int reviewNo);
	
	
	
}
