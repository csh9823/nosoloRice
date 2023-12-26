package com.nosolorice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.nosolorice.dao.normalUserDao;

import com.nosolorice.domain.normalUser.NormalUser;

@Service
public class NormalUserServiceImpl implements NormalUserService {

	@Autowired
	private normalUserDao normalUserDao;
	
	@Override
	public boolean overlapNormalIdCheck(String normalId) {
		NormalUser normalUser = normalUserDao.getNormalId(normalId);
		
		if(normalUser == null) {
			return false;
		}
		return true;
	}
	
	@Override
	public void addNormalUser(NormalUser nornalUser) {
		
		nornalUser.setPass(PasswordEncoder.encode(nornalUser.getPass()));
		normalUserDao.addNormalUser(normalUser);
	}
}
