package com.nosolorice.app.eundao;

import com.nosolorice.app.domain.businessUser.BusinessUser;

public interface BusinessUserDao {
	
	public boolean overlapBusinessIdCheck(String businessId);
	
	public void addBusinessUser(BusinessUser businessUser);

	public static BusinessUser getBusinessId(String businessId) {
		
		return null;
	}
}
