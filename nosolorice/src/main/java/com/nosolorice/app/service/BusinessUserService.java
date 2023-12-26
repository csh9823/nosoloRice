package com.nosolorice.app.service;

import com.nosolorice.app.domain.businessUser.BusinessUser;

public interface BusinessUserService {
	
	public boolean overlapBusinessIdCheck(String businessId);
	
	public void addBusinessUser(BusinessUser businesssUser);
}
