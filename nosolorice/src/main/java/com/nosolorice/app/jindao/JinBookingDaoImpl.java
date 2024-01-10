package com.nosolorice.app.jindao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nosolorice.app.domain.booking.Booking;
import com.nosolorice.app.domain.booking.BookingOk;
import com.nosolorice.app.domain.booking.BookingUserList;

@Repository
public class JinBookingDaoImpl implements JinBookingInterfaceDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String NAME_SPACE = "com.nosolorice.app.mapper.JinBooking";
	
	@Override
	public List<Booking> BookingList(String businessId) {
				
		
		return sqlSession.selectList(NAME_SPACE + ".BookingList",businessId);
	}
	
	public void bookingState(String businessId,int bookingNo ,String bookingState) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("businessId", businessId);
		map.put("bookingNo", bookingNo);
		map.put("bookingState", bookingState);
		
		sqlSession.update(NAME_SPACE + ".bookingState",map);
	}
	
	public void bookingStateDelete(String businessId,int bookingNo) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("businessId", businessId);
		map.put("bookingNo", bookingNo);
		
		sqlSession.delete(NAME_SPACE + ".bookingStateDelete",map);
	}
	
	public void bookingOkinsert(BookingOk bookingOk) {
		sqlSession.insert(NAME_SPACE + ".bookingOkinsert", bookingOk);
	}
	
	public void bookinguserdelete(String businessId,int bookingNo) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("businessId", businessId);
		map.put("bookingNo", bookingNo);
		
		sqlSession.delete(NAME_SPACE + ".bookinguserdelete",map);
	}
	
	// 부킹 유저 리스트
	public List<BookingUserList> bookingUserList(String businessId,int bookingNo){
		Map<String, Object> map = new HashMap<>();
		map.put("businessId", businessId);
		map.put("bookingNo", bookingNo);
		return sqlSession.selectList(NAME_SPACE + ".bookinguserdelete",map);
	}
	
	// 방문완료 생성
	public void visitantuseradd(String normalId, String businessId,int bookingokNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("businessId", businessId);
		map.put("bookingokNo", bookingokNo);
		map.put("businessId", businessId);
		
		sqlSession.insert(NAME_SPACE + ".visitantuseradd",map);
	}
}
