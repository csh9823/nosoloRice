package com.nosolorice.app.hyunservice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nosolorice.app.domain.Review.Review;
import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.businessUser.Menu;
import com.nosolorice.app.domain.normalUser.ChatHistory;
import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.domain.normalUser.UserInquiry;
import com.nosolorice.app.hyundao.UserDao;

@Service
public class UserServiceImpl implements UserService {

	private UserDao userDao;
	@Autowired
	public UserServiceImpl(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public void writeUserInquiry(UserInquiry userInquiry) {
		userDao.writeUserInquiry(userInquiry);
	}
	
	@Override
	public Map<String, Object> getUserInquiryList(int pageNum, String normalId) {
		
		int pageSize = 10;
		int pageGroup = 10;
		int currentPage = pageNum;
		int start = (currentPage - 1) * pageSize;
		int listCount = userDao.getUserInquiryListCount(normalId);
		
		if(listCount > 0) {
			List<UserInquiry> inquiryList = userDao.getUserInquiryList(start, pageSize, normalId);

			int pageCount = listCount / pageSize + (listCount % pageSize == 0 ? 0 : 1);
			int startPage = (currentPage / pageGroup) * pageGroup + 1 - (currentPage % pageGroup == 0 ? pageGroup : 0);		
			int endPage = startPage + pageGroup - 1;
			if(endPage > pageCount) endPage = pageCount;
			
			Map<String, Object> modelMap = new HashMap<String, Object>();		
			
			modelMap.put("inquiryList", inquiryList);
			modelMap.put("pageCount", pageCount);
			modelMap.put("startPage", startPage);
			modelMap.put("endPage", endPage);
			modelMap.put("currentPage", currentPage);
			modelMap.put("listCount", listCount);
			modelMap.put("pageGroup", pageGroup);
			
			return modelMap;			
		} else return null;
	}

	@Override
	public void addChatRoom(Map<String, Object> map) {
		userDao.addChatRoom(map);
	}

	@Override
	public void addChatMember(Map<String, Object> map) {
		userDao.addChatMember(map);
		
	}

	@Override
	public Map<String, Object> chatMemberCheck(String id) {
		
		Map<String, Object> map = new HashMap<>();
		
		boolean isChatMember = userDao.chatMemberCheck(id);
		String roomId = userDao.getRoomId(id);
		if(roomId != null) {
			List<ChatHistory> chatHistory = userDao.getChatHistory(roomId);
			Map<String, Object> chatRoomInfo = userDao.getChatRoomInfo(roomId);
			map.put("chatHistory", chatHistory);
			map.put("chatRoomInfo", chatRoomInfo);
		}
		
		map.put("isChatMember", isChatMember);
		map.put("roomId", roomId);
		
		return map;
	}

	@Override
	public void addChatMessage(ChatHistory chatHistory) {
		userDao.addChatMessage(chatHistory);
	}

	@Override
	public boolean isMatchingCheck(String id) {
		System.out.println("서비스에서 id : " + id);
		System.out.println("서비스에서 result : " + userDao.isMatchingCheck(id));
		return userDao.isMatchingCheck(id);
	}

	@Override
	public List<BusinessUser> getStoreListByMap(double lat, double lng) {
		return userDao.getStoreListByMap(lat, lng);
	}

	@Override
	public List<BusinessUser> getStoreListByAddress(String address) {
		return userDao.getStoreListByAddress(address);
	}

	@Override
	public List<Review> getReviewList(String businessId) {
		return userDao.getReviewList(businessId);
	}

	@Override
	public List<Menu> getMenuList(String businessId) {
		return userDao.getMenuList(businessId);
	}
	
}
