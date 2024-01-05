package com.nosolorice.app.eunservice;

import com.nosolorice.app.domain.normalUser.NormalUser;

public interface NormalUserService {	
	
	public boolean overlapIdCheck(String normalId);
	
	public void addNormalUser(NormalUser normalUser);
	
	public boolean overlapNickCheck(String nickName);
	
	public void normalPhoneCheck(String mobile, String numStr);
	
	public String certNum();
}


