package com.nosolorice.app.hyundao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nosolorice.app.domain.Review.Review;
import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.businessUser.Menu;
import com.nosolorice.app.domain.normalUser.ChatHistory;
import com.nosolorice.app.domain.normalUser.NormalUser;
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
	public List<BusinessUser> getStoreListByMap(double lat, double lng) {
		Map<String, Double> map = new HashMap<>();
		map.put("lat", lat);
		map.put("lng", lng);
		return sqlSession.selectList(NAME_SPACE + ".getStoreListByMap", map);
	}

	@Override
	public List<BusinessUser> getStoreListByAddress(String address) {
		return sqlSession.selectList(NAME_SPACE + ".getStoreListByAddress", address);
	}

	@Override
	public List<Review> getReviewList(String businessId) {
		return sqlSession.selectList(NAME_SPACE + ".getReviewList", businessId);
	}

	@Override
	public List<Menu> getMenuList(String businessId) {
		return sqlSession.selectList(NAME_SPACE + ".getMenuList", businessId);
	}
}
