package com.nosolorice.app.jinservice;

import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.normalUser.NormalUser;

public interface JinloginInterface {
	abstract public BusinessUser loginBusinessUser(String id, String pass);
	
	abstract public NormalUser loginNormalUser(String id, String pass);
}