package com.nosolorice.dao;

import com.nosolorice.domain.normalUser.NormalUser;

public interface normalUserDao {
	
	public void addNormalUser(NormalUser normalUser);

	public NormalUser getBusinessId(String normalId);
}
