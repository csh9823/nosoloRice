package com.nosolorice.app.eundao;

import java.util.List;

import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.normalUser.NormalUser;

public interface BusinessUserDao {

	public void addBusinessUser(BusinessUser businessUser);
	
	public int overlapBusinessNumberCheck(Integer businessNumber);
	
	public List<String> getBusinessUser(String businessId);
	
	public BusinessUser getBusinessId(String businessId);
}
