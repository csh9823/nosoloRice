package com.nosolorice.app.controller.sehwa;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nosolorice.app.domain.Review.Review;
import com.nosolorice.app.domain.booking.Booking;
import com.nosolorice.app.domain.booking.BookingOk;
import com.nosolorice.app.domain.businessUser.BusinessSectors;
import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.domain.normalUser.ReportDetails;

@Repository
public class SehwaDaoImpl implements SehwaDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String NAME_SPACE = "com.nosolorice.app.mappers.sehwa";

	@Override
	public BusinessUser getBusinessUserInfo(String id) {
		return sqlSession.selectOne(NAME_SPACE + ".getBusinessUserInfo", id);
	}
	
	@Override
	public void businessUserInfoUpdate(String id, BusinessUser user) {
		Map<String, Object> params = new HashMap<>();
		params.put("id", id);
		params.put("user", user);	
		
		sqlSession.update(NAME_SPACE + ".businessUserInfoUpdate", params);
	}

	@Override
	public void storeDepositUpdate(String id, int deposit) {
		Map<String, Object> params = new HashMap<>();
		params.put("id", id);
		params.put("deposit", deposit);
		
		sqlSession.update(NAME_SPACE + ".storeDepositUpdate", params);
	}

	@Override
	public void storeTimeUpdate(String id, String openTime, String closeTime, String dayOff, String breakTime) {
		Map<String, String> params = new HashMap<>();
		params.put("id", id);
		params.put("openTime", openTime);
		params.put("closeTime", closeTime);
		params.put("breakTime", breakTime);
		params.put("dayOff", dayOff);
		
		sqlSession.update(NAME_SPACE + ".storeTimeUpdate", params);
	}

	@Override
	public void storeIntroductionUpdate(String id, String introduction) {
		Map<String, String> params = new HashMap<>();
		params.put("id", id);
		params.put("introduction", introduction);
		
		sqlSession.update(NAME_SPACE + ".storeIntroductionUpdate", params);
	}

	@Override
	public List<BusinessSectors> getBusinessSectors(String id) {
		return sqlSession.selectList(NAME_SPACE + ".getBusinessSectors", id);
	}

	@Override
	public void insertBusinessSectors(String id, String sectorsNo) {
		Map<String, Object> params = new HashMap<>();
		params.put("id", id);
		params.put("sectorsNo", sectorsNo);
		
		sqlSession.insert(NAME_SPACE + ".insertBusinessSectors", params);
	}

	@Override
	public void deleteBusinessSectors(String id) {
		sqlSession.delete(NAME_SPACE + ".deleteBusinessSectors", id);
	}

	@Override
	public int getCurrentBooking(String id) {
		return sqlSession.selectOne(NAME_SPACE + ".getCurrentBooking", id);
	}

	@Override
	public List<String> getCurrentBookingMember(int no, String id) {
		Map<String, Object> params = new HashMap<>();
		params.put("no", no);
		params.put("id", id);
		
		return sqlSession.selectList(NAME_SPACE + ".getCurrentBookingMember", params);
	}

	@Override
	public Booking getBookingDetail(int no) {
		return sqlSession.selectOne(NAME_SPACE + ".getBookingDetail", no);
	}

	@Override
	public NormalUser getNormalUserInfo(String id) {
		return sqlSession.selectOne(NAME_SPACE + ".getNormalUserInfo", id);
	}

	@Override
	public List<Integer> getVisitantUserListNo(String id) {
		return sqlSession.selectList(NAME_SPACE + ".getVisitantUserListNo", id);
	}

	@Override
	public List<String> getVisitantUserListMember(int no, String id) {
		Map<String, Object> params = new HashMap<>();
		params.put("no", no);
		params.put("id", id);
		
		return sqlSession.selectList(NAME_SPACE + ".getVisitantUserListMember", params);
	}

	@Override
	public BookingOk getVisitantBookingDetail(int no) {
		return sqlSession.selectOne(NAME_SPACE + ".getVisitantBookingDetail", no);
	}

	@Override
	public Review getReview(String normalId, int bookingOkNo) {
		Map<String, Object> params = new HashMap<>();
		params.put("normalId", normalId);
		params.put("bookingOkNo", bookingOkNo);
		
		return sqlSession.selectOne(NAME_SPACE + ".getReview", params);
	}

	@Override
	public void insertReview(Review review) {
		sqlSession.insert(NAME_SPACE + ".insertReview", review);
	}

	@Override
	public void insertReport(ReportDetails report) {
		sqlSession.insert(NAME_SPACE + ".insertReport", report);
	}

	@Override
	public void insertBlock(String blocker, String attacker) {
		Map<String, Object> params = new HashMap<>();
		params.put("blocker", blocker);
		params.put("attacker", attacker);
		
		sqlSession.insert(NAME_SPACE + ".insertBlocker", params);
	}
	
	
	
	
	
	
	
	
}
