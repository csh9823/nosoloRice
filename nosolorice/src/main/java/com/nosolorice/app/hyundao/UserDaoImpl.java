package com.nosolorice.app.hyundao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nosolorice.app.domain.Review.Review;
import com.nosolorice.app.domain.booking.Booking;
import com.nosolorice.app.domain.booking.BookingUserList;
import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.businessUser.Menu;
import com.nosolorice.app.domain.normalUser.BlockHistory;
import com.nosolorice.app.domain.normalUser.ChatHistory;
import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.domain.normalUser.ReportDetails;
import com.nosolorice.app.domain.normalUser.UserInquiry;

@Repository
public class UserDaoImpl implements UserDao {

	private static final String NAME_SPACE = "com.nosolorice.app.mapper.UserMapper";
	
	private SqlSessionTemplate sqlSession;
	@Autowired
	public UserDaoImpl(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void writeUserInquiry(UserInquiry userInquiry) {
		sqlSession.insert(NAME_SPACE + ".writeUserInquiry", userInquiry);
	}
	@Override
	public List<UserInquiry> getUserInquiryList(int start, int pageSize, String normalId) {
		Map<String, Object> params = new HashMap<>();
		params.put("start", start);
		params.put("pageSize", pageSize);
		params.put("normalId", normalId);
		return sqlSession.selectList(NAME_SPACE + ".getUserInquiry", params);
	}
	@Override
	public int getUserInquiryListCount(String normalId) {
		Map<String, String> params = new HashMap<>();
		params.put("normalId", normalId);
		return sqlSession.selectOne(NAME_SPACE + ".getUserInquiryListCount", params);
	}

	@Override
	public void addChatRoom(Map<String, Object> map) {
		sqlSession.insert(NAME_SPACE + ".addChatRoom", map);
	}

	@Override
	public void addChatMember(Map<String, Object> map) {
		sqlSession.insert(NAME_SPACE + ".addChatMember", map);
	}

	@Override
	public boolean chatMemberCheck(String id) {
		boolean result = false;
		int data = sqlSession.selectOne(NAME_SPACE + ".chatMemberCheck", id);
		if(data == 1) result = true;
		return result;
	}

	@Override
	public String getRoomId(String id) {
		return sqlSession.selectOne(NAME_SPACE + ".getRoomId", id);
	}

	@Override
	public List<ChatHistory> getChatHistory(String roomId) {
		return sqlSession.selectList(NAME_SPACE + ".getChatHistory", roomId);
	}

	@Override
	public Map<String, Object> getChatRoomInfo(String roomId) {
		return sqlSession.selectOne(NAME_SPACE + ".getChatRoomInfo", roomId);
	}

	@Override
	public void addChatMessage(ChatHistory chatHistory) {
		sqlSession.insert(NAME_SPACE+".addChatMessage", chatHistory);
	}

	@Override
	public boolean isMatchingCheck(String id) {
		int count = sqlSession.selectOne(NAME_SPACE + ".isMatchingCheck", id);
		System.out.println("dao에서 count : " + count);
		System.out.println("dao에서 id : " + id);
		boolean result = false;
		if(count > 0) {
			result = true;
		}
		System.out.println("dao에서 result : " + result);
		return  result;
	}

	@Override
	public List<BusinessUser> getStoreListByMap(double lat, double lng, String sortType) {
		Map<String, Object> map = new HashMap<>();
		map.put("lat", lat);
		map.put("lng", lng);
		map.put("sortType", sortType);
		return sqlSession.selectList(NAME_SPACE + ".getStoreListByMap", map);
	}

	@Override
	public List<BusinessUser> getStoreListByAddress(String address, String sortType) {
		Map<String, String> map = new HashMap<>();
		map.put("address", address);
		map.put("sortType", sortType);
		System.out.println("dao에서 address : " + address);
		System.out.println("dao에서 sortType : " + sortType);
		List<BusinessUser> sList = sqlSession.selectList(NAME_SPACE + ".getStoreListByAddress", map);
		System.out.println(sList.size());
		return sList;
	}
	

	@Override
	public List<BusinessUser> searchStoreListByMap(double lat, double lng, String keyword, String sortType) {
		Map<String, Object> map = new HashMap<>();
		map.put("lat", lat);
		map.put("lng", lng);
		map.put("keyword", keyword);
		map.put("sortType", sortType);
		return sqlSession.selectList(NAME_SPACE + ".searchStoreListByMap", map);
	}

	@Override
	public List<BusinessUser> searchStoreListByAddress(String address, String keyword, String sortType) {
		Map<String, String> map = new HashMap<>();
		map.put("address", address);
		map.put("keyword", keyword);
		map.put("sortType", sortType);
		return sqlSession.selectList(NAME_SPACE + ".searchStoreListByAddress", map);
	}

	@Override
	public List<Review> getReviewList(String businessId) {
		return sqlSession.selectList(NAME_SPACE + ".getReviewList", businessId);
	}

	@Override
	public List<Menu> getMenuList(String businessId) {
		return sqlSession.selectList(NAME_SPACE + ".getMenuList", businessId);
	}

	@Override
	public NormalUser getReviewWriterInfo(String normalId) {
		return sqlSession.selectOne(NAME_SPACE + ".getReviewWriterInfo", normalId);
	}

	@Override
	public BusinessUser getBusinessUserInfo(String businessId) {
		return sqlSession.selectOne(NAME_SPACE + ".getBusinessUserInfo", businessId);
	}

	@Override
	public NormalUser getNormalUserInfo(String normalId) {
		return sqlSession.selectOne(NAME_SPACE + ".getNormalUserInfo", normalId);
	}

	@Override
	public void addChatMemberReport(ReportDetails report) {
		sqlSession.insert(NAME_SPACE + ".addChatMemberReport", report);
	}

	@Override
	public void addChatMemberBlock(BlockHistory block) {
		sqlSession.insert(NAME_SPACE + ".addChatMemberBlock", block);
	}

	@Override
	public int getRecentBookingNo(Booking booking) {
		return sqlSession.selectOne(NAME_SPACE + ".getRecentBookingNo", booking);
	}

	@Override
	public void addBooking(Booking booking) {
		sqlSession.insert(NAME_SPACE + ".addBooking", booking);
	}

	@Override
	public void deleteBooking(String businessId, int bookingBookNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("businessId", businessId);
		map.put("bookingBookNo", bookingBookNo);
		sqlSession.delete(NAME_SPACE + ".deleteBooking", map);
	}

	@Override
	public Booking getBookingInfo(String roomId) {
		return sqlSession.selectOne(NAME_SPACE + ".getBookingInfo", roomId);
	}

	@Override
	public void deleteChatMember(String normalId) {
		sqlSession.delete(NAME_SPACE + ".deleteChatMember", normalId);
	}

	@Override
	public void addBookingUserList(BookingUserList bul) {
		sqlSession.insert(NAME_SPACE + ".addBookingUserList", bul);
	}

	@Override
	public int getBookingIndex(BookingUserList bul, int bookNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("businessId", bul.getBusinessId());
		map.put("bookNo", bookNo);
		System.out.println("DAO에서 bookNo : " + bookNo);
		return sqlSession.selectOne(NAME_SPACE + ".getBookingIndex", map);
	}

	@Override
	public void deleteBookingUserList(String normalId) {
		sqlSession.delete(NAME_SPACE + ".deleteBookingUserList" + normalId);
	}

}
