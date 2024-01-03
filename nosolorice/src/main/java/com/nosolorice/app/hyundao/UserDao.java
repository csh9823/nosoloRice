package com.nosolorice.app.hyundao;

import java.util.List;
import java.util.Map;

import com.nosolorice.app.domain.normalUser.UserInquiry;

public interface UserDao {
	public abstract void writeUserInquiry(UserInquiry userInquiry);
	public abstract List<UserInquiry> getUserInquiryList(int start, int pageSize, String normalId);
	public abstract int getUserInquiryListCount(String normalId);
	
	public abstract void addChatRoom(Map<String, Object> map);
	public abstract void addChatMember(Map<String, Object> map);
}
