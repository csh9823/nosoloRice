package com.nosolorice.app.hanservice;

import java.util.Map;

public interface UserPageService {
	
		//신고 목록
		public abstract Map<String,Object> userReportList(String reporter,int pageNum);
		//차단 목록
		public abstract Map<String,Object> blockList(String blocker,int pageNum);
		//차단 해제하기
		public abstract void blockUnlock(int blockHistoryNo);

}
