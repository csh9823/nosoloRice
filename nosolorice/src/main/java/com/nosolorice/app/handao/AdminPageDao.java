package com.nosolorice.app.handao;

import java.util.List;

import com.nosolorice.app.domain.Review.Review;
import com.nosolorice.app.domain.normalUser.DeniedUser;
import com.nosolorice.app.domain.normalUser.ReportDetails;

public interface AdminPageDao {
	
	//신고 내역 리스트
	public abstract List<ReportDetails>reportList(int start,int num);
	//신고 상세
	public abstract ReportDetails getReport(int reportNo);
	//신고 글 수
	public abstract int getReportCount();
	//리뷰 리스트
	public abstract List<Review>reviewList(int start,int num);
	//리뷰 상세
	public abstract Review getReview(int reviewNo);
	//정지 리스트
	public abstract List<DeniedUser> deniedList(int start,int num);
	//아이디 검색
	public abstract String searchId(String id);
	//정지 추가
	public abstract void addDenied(String id,String reason,int day);
	//업체 삭제
	public abstract void businessDelete(int businessNumber);
	
	
	
	
	
	

}
