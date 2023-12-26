package com.nosolorice.app.hyundao;

import java.util.List;

import com.nosolorice.app.domain.normalUser.UserInquiry;

public interface UserDao {
	public abstract void writeUserInquiry(UserInquiry userInquiry);
	public abstract List<UserInquiry> getUserInquiryList(int start, int pageSize, String normalId);
	public abstract int getUserInquiryListCount(String normalId);
}
