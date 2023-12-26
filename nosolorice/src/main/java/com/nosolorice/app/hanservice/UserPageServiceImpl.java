package com.nosolorice.app.hanservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nosolorice.app.handao.UserPageDao;
import com.nosolorice.app.domain.normalUser.BlockHistory;
import com.nosolorice.app.domain.normalUser.ReportDetails;
@Service
public class UserPageServiceImpl implements UserPageService {

	private UserPageDao userPageDao;

	@Autowired
	public UserPageServiceImpl(UserPageDao userPageDao) {
		
		this.userPageDao = userPageDao;
	}

	@Override
	public List<ReportDetails> reportList() {
		
		return userPageDao.reportList();
	}

	@Override
	public List<BlockHistory> blockList() {
		
		return userPageDao.blockList();
	}


}
