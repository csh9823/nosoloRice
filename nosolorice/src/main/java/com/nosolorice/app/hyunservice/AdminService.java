package com.nosolorice.app.hyunservice;

import java.util.Map;

public interface AdminService {
	public abstract Map<String, Object> getJoinApproveList(int pageNum);	
	public abstract void updateJoinApprove(long businessNumber);
	public abstract void deleteJoinApprove(int no);
	public abstract Map<String, Object> getDailySalesList(int pageNum);
	public abstract Map<String, Object> getMonthlySalesList(int pageNum);
}
