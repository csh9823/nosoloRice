package com.nosolorice.dao;

import com.nosolorice.domain.businessUser.BusinessUser;

public interface BusinessUserDao {
	
	public boolean overlapBusinessIdCheck(String businessId);
	
	public void addBusinessUser(BusinessUser businessUser);

	public static BusinessUser getBusinessId(String businessId) {
		
		return null;
	}
}
