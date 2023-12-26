package com.nosolorice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.nosolorice.dao.BusinessUserDao;
import com.nosolorice.dao.normalUserDao;
import com.nosolorice.domain.businessUser.BusinessUser;
import com.nosolorice.domain.normalUser.NormalUser;

@Service
public class BusinessUserServiceImpl implements BusinessUserService {

	@Autowired
	private normalUserDao normalUserDao;
	
	@Override
	public boolean overlapBusinessIdCheck(String businessId) {
		BusinessUser businessUser = BusinessUserDao.getBusinessId(businessId);
		
		if(businessUser == null) {
			return false;
		}
		return true;
	}
	
	@Override
	public void addBusinessUser(BusinessUser businessUser) {
		
		businessUser.setPass(PasswordEncoder.encode(businessUser.getPass()));
		businessUser.addBusinessUser(businessUser);
	}
}
