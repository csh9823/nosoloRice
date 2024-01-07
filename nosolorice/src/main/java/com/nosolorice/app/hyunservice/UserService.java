package com.nosolorice.app.hyunservice;

import java.util.List;
import java.util.Map;

import com.nosolorice.app.domain.Review.Review;
import com.nosolorice.app.domain.booking.Booking;
import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.businessUser.Menu;
import com.nosolorice.app.domain.normalUser.BlockHistory;
import com.nosolorice.app.domain.normalUser.ChatHistory;
import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.domain.normalUser.ReportDetails;
import com.nosolorice.app.domain.normalUser.UserInquiry;

public interface UserService {
	
	public abstract void writeUserInquiry(UserInquiry userInquiry);
	public abstract Map<String, Object> getUserInquiryList(int pageNum, String normalId);
	
	public abstract void addChatRoom(Map<String, Object> map);
	public abstract void addChatMember(Map<String, Object> map);

	public abstract Map<String, Object> chatMemberCheck(String id);
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
	
	public int addBooking(Booking booking);
	public void deleteBooking(String businessId, int bookingBookNo);
	
	public void deleteChatMember(String normalId);
}
