package com.nosolorice.app.handao;

import java.util.List;

import com.nosolorice.app.domain.normalUser.BlockHistory;
import com.nosolorice.app.domain.normalUser.DeniedUser;
import com.nosolorice.app.domain.normalUser.ReportDetails;

public interface UserPageDao {
		
		//신고 목록
		public abstract List<ReportDetails>userReportList(int start,int num);
		
		public abstract int getUserReportCount();
		
		//차단 목록
		public abstract List<BlockHistory> blockList(int start,int num);
		
		public abstract int getBlockCount();
		
		
		

	}

