package com.nosolorice.app.controller.sehwa;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nosolorice.app.domain.Review.Review;
import com.nosolorice.app.domain.booking.Booking;
import com.nosolorice.app.domain.booking.BookingOk;
import com.nosolorice.app.domain.businessUser.BusinessSectors;
import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.domain.normalUser.PointHistory;
import com.nosolorice.app.domain.normalUser.PointRecharge;
import com.nosolorice.app.domain.normalUser.ReportDetails;

@Service
public class SehwaServiceImpl implements SehwaService {

	@Autowired
	private SehwaDao dao;

	@Override
	public BusinessUser getBusinessUserInfo(String id) {
		return dao.getBusinessUserInfo(id);
	}

	@Override
	public List<BusinessSectors> getBusinessSectors(String id) {
		return dao.getBusinessSectors(id);
	};
	
	@Override
	public void businessUserInfoUpdate(BusinessUser user) {
		dao.businessUserInfoUpdate(user.getBusinessId(), user);
	}

	@Override
	public String getNormalUserPass(String id) {
		return dao.getNormalUserPass(id);
	};
	
	@Override
	public void normalUserInfoUpdate(NormalUser user) {
		dao.normalUserInfoUpdate(user);
	};
	
	@Override
	public void changeDefaultImg(String id) {
		dao.changeDefaultImg(id);
	};
	
	@Override
	public void storeDepositUpdate(String id, int deposit) {
		dao.storeDepositUpdate(id, deposit);
	}

	@Override
	public void storeSectorUpdate(String id, int count, int[] sector) {
		dao.deleteBusinessSectors(id);
		for(int i=0; i <= count -1 ; i++) {
			dao.insertBusinessSectors(id, sector[i]);
			System.out.println("sector[i] : " + sector[i]);
		}
	};
	
	@Override
	public void storeTimeUpdate(String id, String openTime, String closeTime, String dayOff, String breakTime) {
		dao.storeTimeUpdate(id, openTime, closeTime, dayOff, breakTime);
	}

	@Override
	public void storeIntroductionUpdate(String id, String introduction) {
		dao.storeIntroductionUpdate(id, introduction);
	}

	@Override
	public Map<String, Object> getCurrentBooking(String id) {
		// 예약관리번호 가져오기(booking_userlist)
		Integer no = dao.getCurrentBooking(id);
		Map<String, Object> result = new HashMap<>();
		result.put("currentBookingNo", no);
		
		  if (no != null && no != 0) { 
			  // 예약멤버 가져오기 
			  List<String> members = dao.getCurrentBookingMember(no, id); 
			  List<NormalUser> memberInfo = new ArrayList<>();
			  int memberCount = 0; 
			  for(int i=0; i<members.size(); i++) {
				  NormalUser member = dao.getNormalUserInfo(members.get(i)); 
				  memberInfo.add(i, member); 
				  memberCount ++;
			  } 
			  // 예약 상세내역 가져오기 
			  Booking bookingDetail = dao.getBookingDetail(no); 
			  // 사장님 아이디로 가게정보 가져오기 
			  String businessId = bookingDetail.getBusinessId(); 
			  BusinessUser storeInfo = dao.getBusinessUserInfo(businessId);
			  
			  result.put("currentBookingMembers", members);
			  result.put("currentBookingDetail", bookingDetail); 
			  result.put("storeInfo",storeInfo); 
			  result.put("memberInfo", memberInfo); 
			  result.put("memberCount",memberCount);
			  
		  }
		 
		
		return result;
	}

	@Override
	public Map<String, Object> getPastBooking(String id) {
		// 예약번호와 멤버 리스트 가져오기
		List<Integer> nos = dao.getVisitantUserListNo(id);
		int size = nos.size();
		List<BookingMember> bookingList = new ArrayList<BookingMember>();

		if(nos.size() != 0) {
			BookingMember bMember = new BookingMember();
			
			for(int i=0; i<nos.size(); i++) {
				int no = nos.get(i);
				List<String> memberId = dao.getVisitantUserListMember(no, id);
				List<NormalUser> normalUser = new ArrayList<>();
				for(int k=0; k<memberId.size(); k++) {
					NormalUser user = dao.getNormalUserInfo(memberId.get(k));
					normalUser.add(user);
				}
				BookingOk bookingDetail = dao.getVisitantBookingDetail(no);
				String businessId = bookingDetail.getBusinessId();
				Review review = dao.getReview(id, no);
				
				bMember.setNo(no);
				bMember.setMembers(memberId);
				bMember.setNormalUser(normalUser);
				bMember.setBusinessUser(dao.getBusinessUserInfo(businessId));
				bMember.setBookingTime(bookingDetail.getBookingOkTime());
				if(review == null) {
					bMember.setReviewStatus(false);
				} else {
					// 리뷰가 있을 때
					bMember.setReviewStatus(true);
					bMember.setReview(review);
				}
			}
			bookingList.add(bMember);
			
		} else {
			
		}
		
		Map<String, Object> result = new HashMap<>();
		result.put("bookingList", bookingList);
		result.put("size", size);
		return result;
	}

	@Override
	public void insertReview(Review review) {
		dao.insertReview(review);
	}

	@Override
	public void insertReport(ReportDetails report) {
		dao.insertReport(report);
	}

	@Override
	public void insertBlock(String blocker, String attacker) {
		dao.insertBlock(blocker, attacker);
	}

	@Override
	public void visitantBlind(String id, int no) {
		dao.visitantBlind(id, no);
	}

	@Override
	public void deleteReview(int no) {
		dao.deleteReview(no);
	}

	@Override
	public void rechargePoint(String id, String payment, int amount, int point) {
		// 포인트 충전내역 테이블에 추가
		dao.rechargePoint(id, payment, amount, point);
		// 내 포인트금액 추가
		dao.updateMyPoint(id, point);
	}

	@Override
	public List<PointRecharge> chargePointList(String id) {
		return dao.chargePointList(id);
	}

	@Override
	public List<PointHistory> usePointList(String id) {
		return dao.usePointList(id);
	}
	
	
}
