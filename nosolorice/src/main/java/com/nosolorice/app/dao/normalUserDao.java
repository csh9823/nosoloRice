package com.nosolorice.app.dao;

import com.nosolorice.app.domain.normalUser.NormalUser;

public interface normalUserDao {
	
	public void addNormalUser(NormalUser normalUser);

	public NormalUser getNormalId(String normalId);
}
