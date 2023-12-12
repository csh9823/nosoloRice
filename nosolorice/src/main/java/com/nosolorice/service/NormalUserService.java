package com.nosolorice.service;

import com.nosolorice.domain.normalUser.NormalUser;

public interface NormalUserService {	
	
	public boolean overlapNormalIdCheck(String normalId);
	
	public void addNormalUser(NormalUser normalUser);
}


