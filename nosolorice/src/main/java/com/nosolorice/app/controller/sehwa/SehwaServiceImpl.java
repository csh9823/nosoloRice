package com.nosolorice.app.controller.sehwa;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nosolorice.app.domain.businessUser.BusinessUser;

@Service
public class SehwaServiceImpl implements SehwaService {

	@Autowired
	private SehwaDao dao;

	@Override
	public BusinessUser getBusinessUserInfo(String id) {
		return dao.getBusinessUserInfo(id);
	}
	
	
}
