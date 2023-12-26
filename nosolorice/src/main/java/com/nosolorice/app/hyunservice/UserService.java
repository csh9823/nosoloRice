package com.nosolorice.app.hyunservice;

import java.util.Map;

import com.nosolorice.app.domain.normalUser.UserInquiry;

public interface UserService {
	
	public abstract void writeUserInquiry(UserInquiry userInquiry);
	public abstract Map<String, Object> getUserInquiryList(int pageNum, String normalId);
}
