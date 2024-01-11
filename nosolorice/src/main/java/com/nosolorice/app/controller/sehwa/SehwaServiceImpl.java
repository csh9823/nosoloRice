package com.nosolorice.app.controller.sehwa;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
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
	
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 10;

	@Override
	public BusinessUser getBusinessUserInfo(String id) {
		return dao.getBusinessUserInfo(id);
	}

	@Override
	public NormalUser getNormalUserInfo(String id) {
		return dao.getNormalUserInfo(id);
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
	public void normalUserInfoUpdate(NormalUser user) {
		dao.normalUserInfoUpdate(user);
	};
	
	@Override
	public void changeDefaultImg(String id, String type) {
		dao.changeDefaultImg(id, type);
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
	public Map<String, Object> getPastBooking(String id, int pageNum) {
		// 예약번호와 멤버 리스트 가져오기
		List<Integer> nos1 = dao.getVisitantUserListNo(id);
		int size = nos1.size();
		List<BookingMember> bookingList = new ArrayList<BookingMember>();
		
		// 페이지네이션
		// 시작페이지번호
		int start = (pageNum -1) * PAGE_SIZE;
		// 출력할 전체 게시글 수
		int listCount = size;
		// 페이지에 출력할 게시글
		List<Integer> nos = dao.getVisitantUserListNo(id, start, PAGE_SIZE);
		// 전체페이지수 계산
		int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
		
		int startPage = (pageNum / PAGE_GROUP) * PAGE_GROUP + 1
				- (pageNum % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
		int endPage = startPage + PAGE_GROUP - 1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		if(nos.size() != 0) {
			
			int testNo = nos.size() + 1;
			
			for(int i=0; i<nos.size(); i++) {
				// 예약 정보 (가게, 멤버 등)
				BookingMember bMember = new BookingMember();
				// 예약번호
				int no = nos.get(i); 
				// 같이 예약한 멤버
				List<String> memberId = dao.getVisitantUserListMember(no, id);
				List<NormalUser> normalUser = new ArrayList<>();
				for(int k=0; k<memberId.size(); k++) {
					NormalUser user = dao.getNormalUserInfo(memberId.get(k));
					normalUser.add(user);
				}
				// 예약상세내역
				BookingOk bookingDetail = dao.getVisitantBookingDetail(no);
				String businessId = bookingDetail.getBusinessId();
				Review review = dao.getReview(id, no);
				
				testNo --;
				bMember.setNo(testNo);
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
				bookingList.add(bMember);
			}
			
		} else {
			
		}
		
		for(int i =0; i <bookingList.size(); i++ ) {
			System.out.println(bookingList.get(i).getNo());
		}
		
		
		Map<String, Object> result = new HashMap<>();
		result.put("bookingList", bookingList);
		result.put("size", size);
		result.put("PAGE_GROUP", PAGE_GROUP);
		result.put("startPage", startPage);
		result.put("endPage", endPage);
		result.put("pageNum", pageNum);
		result.put("pageCount", pageCount);
		
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
	public Map<String, Object> chargePointList(String id, int chargePageNum) {
		// 페이지네이션
		// 시작페이지 번호
		int start = (chargePageNum -1) * PAGE_SIZE;
		// 출력할 전체 게시글 수
		List<PointRecharge> list = dao.chargePointList(id);
		int listCount = list.size();
		// 페이지에 출력할 게시글
		List<PointRecharge> chargePointList = dao.chargePointList(id, start, PAGE_SIZE);
		// 전체페이지수 계산
		int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
		// 시작페이지와 끝페이지
		int startPage = (chargePageNum / PAGE_GROUP) * PAGE_GROUP + 1
								- (chargePageNum % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
		int endPage = startPage + PAGE_GROUP -1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("chargePointList", chargePointList);
		resultMap.put("chargeListCount", listCount);
		resultMap.put("chargePAGE_GROUP", PAGE_GROUP);
		resultMap.put("chargeStartPage", startPage);
		resultMap.put("chargeEndPage", endPage);
		resultMap.put("chargePageNum", chargePageNum);
		resultMap.put("chargePageCount", pageCount);
		
		return resultMap;
	}

	@Override
	public Map<String, Object> usePointList(String id, int usePageNum) {
		// 페이지네이션
		// 시작페이지 번호
		int start = (usePageNum -1) * PAGE_SIZE;
		// 출력할 전체 게시글 수
		List<PointHistory> list = dao.usePointList(id);
		int listCount = list.size();
		// 페이지에 출력할 게시글
		List<PointHistory> usePointList = dao.usePointList(id, start, PAGE_SIZE);
		// 전체페이지수 계산
		int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
		// 시작페이지와 끝페이지
		int startPage = (usePageNum / PAGE_GROUP) * PAGE_GROUP + 1
								- (usePageNum % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
		int endPage = startPage + PAGE_GROUP -1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("usePointList", usePointList);
		resultMap.put("useListCount", listCount);
		resultMap.put("usePAGE_GROUP", PAGE_GROUP);
		resultMap.put("useStartPage", startPage);
		resultMap.put("useEndPage", endPage);
		resultMap.put("usePageNum", usePageNum);
		resultMap.put("usePageCount", pageCount);
		return resultMap;
		
	}

	@Override
	public boolean checkNormalNickName(String nickName) {
		boolean result = false;
		NormalUser user = dao.checkNormalNickName(nickName);
		if(user != null) result = true;
		
		return result;
	}

	@Override
	public void deleteBusinessUser(String id) {
		dao.deleteBusinessUser(id);
	}

	@Override
	public void deleteNormalUser(String id) {
		dao.deleteNormalUser(id);
	}
	
	
}
