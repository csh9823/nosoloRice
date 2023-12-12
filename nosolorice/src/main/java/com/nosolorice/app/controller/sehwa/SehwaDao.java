package com.nosolorice.app.controller.sehwa;

import com.nosolorice.app.domain.businessUser.BusinessUser;

public interface SehwaDao {

	public BusinessUser getBusinessUserInfo(String id);
	
}
