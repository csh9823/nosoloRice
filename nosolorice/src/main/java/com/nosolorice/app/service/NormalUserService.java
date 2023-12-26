package com.nosolorice.app.service;

import com.nosolorice.app.domain.normalUser.NormalUser;

public interface NormalUserService {	
	
	public boolean overlapNormalIdCheck(String normalId);
	
	public void addNormalUser(NormalUser normalUser);
	
	public void normalPhoneCheck(String phone, String numStr);
}


