package com.nosolorice.service;

import com.nosolorice.domain.businessUser.BusinessUser;

public interface BusinessUserService {
	
	public boolean overlapBusinessIdCheck(String businessId);
	
	public void addBusinessUser(BusinessUser businesssUser);
}
