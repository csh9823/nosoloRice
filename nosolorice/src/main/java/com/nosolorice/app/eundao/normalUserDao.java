package com.nosolorice.app.eundao;

import java.util.List;
import java.util.Map;

import com.nosolorice.app.domain.normalUser.NormalUser;

public interface normalUserDao {
	
	public void addNormalUser(NormalUser normalUser);

	public boolean getNickName(String nickName);

	public List<String> getNormalUser(String normalId);

	public NormalUser getNormalId(String normalId);
}
