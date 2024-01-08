package com.nosolorice.app.hanservice;

import java.util.Map;

public interface UserPageService {
	
		//신고 목록
		public abstract Map<String,Object> userReportList(int pageNum);
		
		//차단 목록
		public abstract Map<String,Object> blockList(int pageNum);
		
		public abstract void blockUnlock(int blockHistoryNo);

}
