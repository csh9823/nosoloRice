package com.nosolorice.app.eunservice;

import com.nosolorice.app.domain.normalUser.NormalUser;

import net.nurigo.java_sdk.exceptions.CoolsmsException;

public interface NormalUserService {	
	
	public boolean overlapNormalIdCheck(String normalId);
	
	public void addNormalUser(NormalUser normalUser);
	
	public String normalPhoneCheck(String to) throws CoolsmsException;
}


