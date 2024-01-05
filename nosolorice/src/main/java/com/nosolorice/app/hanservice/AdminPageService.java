package com.nosolorice.app.hanservice;

import java.util.List;
import java.util.Map;

import com.nosolorice.app.domain.Review.Review;
import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.normalUser.DeniedUser;
import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.domain.normalUser.ReportDetails;

public interface AdminPageService {
	
	//신고 내역 리스트
	public abstract Map<String,Object>reportList(int pageNum);
	
	//신고 상세
	public abstract ReportDetails getReport(int reportNo);
	
	//리뷰 리스트
	public abstract Map<String, Object> reviewList(int pageNum);
	
	//리뷰 상세
	public abstract Review getReview(int reviewNo);
	//정지 리스트
	public abstract Map<String,Object> deniedList(int pageNum);
	
	public abstract NormalUser searchId(String id); 
	
	 public abstract BusinessUser searchBusinessId(String id); 

	public abstract void addDenied(String id,String reason,int day);
	
	public abstract Map<String,Object> businessDeleteList(int pageNum);
	
	public abstract void businessDelete(String id);

	public abstract void unlockUser(int deniedUserNo);
	
	public abstract NormalUser normalUser(String id);

	public abstract void reviewDelete(int reviewNo);
	
	

}
