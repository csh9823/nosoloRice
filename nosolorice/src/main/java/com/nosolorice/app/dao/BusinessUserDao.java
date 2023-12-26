package com.nosolorice.app.dao;

import com.nosolorice.app.domain.businessUser.BusinessUser;

public interface BusinessUserDao {
	
	public boolean overlapBusinessIdCheck(String businessId);
	
	public void addBusinessUser(BusinessUser businessUser);

	public static BusinessUser getBusinessId(String businessId) {
		
		return null;
	}
}
