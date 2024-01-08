package com.nosolorice.app.hyundao;

import java.util.List;
import java.util.Map;

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

public interface UserDao {
	public abstract void writeUserInquiry(UserInquiry userInquiry);
	public abstract List<UserInquiry> getUserInquiryList(int start, int pageSize, String normalId);
	public abstract int getUserInquiryListCount(String normalId);
	
	public abstract void addChatRoom(Map<String, Object> map);
	public abstract void addChatMember(Map<String, Object> map);

	public abstract boolean chatMemberCheck(String id);
	
	public abstract String getRoomId(String id);
	
	public abstract List<ChatHistory> getChatHistory(String roomId);
	public abstract Map<String, Object> getChatRoomInfo(String roomId);
	public abstract void addChatMessage(ChatHistory chatHistory);
	
	public abstract boolean isMatchingCheck(String id);
	
	public abstract List<BusinessUser> getStoreListByMap(double lat, double lng, String sortType);
	public abstract List<BusinessUser> getStoreListByAddress(String address, String sortType);
	
	public abstract List<BusinessUser> searchStoreListByMap(double lat, double lng, String keyword, String sortType);
	public abstract List<BusinessUser> searchStoreListByAddress(String address, String keyword, String sortType);
	
	public abstract List<Review> getReviewList(String businessId);
	public abstract List<Menu> getMenuList(String businessId);
	
	public abstract NormalUser getReviewWriterInfo(String normalId);
	public abstract BusinessUser getBusinessUserInfo(String businessId);
	public abstract NormalUser getNormalUserInfo(String normalId);
	
	public void addChatMemberReport(ReportDetails report);
	public void addChatMemberBlock(BlockHistory block);
	
	public int getRecentBookingNo(Booking booking);
	public void addBooking(Booking booking);
	public void deleteBooking(String businessId, int bookingBookNo);
	public Booking getBookingInfo(String roomId);
	
	public void deleteChatMember(String normalId);
	public void addBookingUserList(BookingUserList bul);
}
