package com.nosolorice.app.eunservice;

import com.nosolorice.app.domain.businessUser.BusinessUser;

public interface BusinessUserService {
	
	public boolean overlapBusinessIdCheck(String businessId);
	
	public void addBusinessUser(BusinessUser businesssUser);
	
	public int overlapBusinessNumberCheck(long businessNumber);
	
	public void businessPhoneCheck(String phone, String numStr);
	
	public String certNum();

	public void addJoinApprove(String businessId);

}
