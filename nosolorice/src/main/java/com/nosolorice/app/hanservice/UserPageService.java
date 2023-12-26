package com.nosolorice.app.hanservice;

import java.util.List;

import com.nosolorice.app.domain.normalUser.BlockHistory;
import com.nosolorice.app.domain.normalUser.DeniedUser;
import com.nosolorice.app.domain.normalUser.ReportDetails;

public interface UserPageService {
	
		//신고 목록
		public abstract List<ReportDetails>reportList();
		
		//차단 목록
		public abstract List<BlockHistory> blockList();

}
