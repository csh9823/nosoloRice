package com.nosolorice.app.jinservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.domain.rootUser.RootUser;
import com.nosolorice.app.jindao.JinLoginDaoImpl;

@Service
public class JinloginService implements JinloginInterface {
	
	@Autowired
	JinLoginDaoImpl jinLoginDaoImpl;
	
	@Override
	public BusinessUser loginBusinessUser(String id, String pass) {
		
		return jinLoginDaoImpl.loginBusinessUser(id, pass);
	}

	@Override
	public NormalUser loginNormalUser(String id, String pass) {
		
		return jinLoginDaoImpl.loginNormalUser(id, pass);
	}
	
	public RootUser loginRootUser(String id, String pass) {
		
		return jinLoginDaoImpl.loginRootUser(id, pass);
	}
}
